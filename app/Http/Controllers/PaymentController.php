<?php

namespace App\Http\Controllers;

use App\Agent;
use App\AgentOrder;
use App\AgentWallet;
use App\Jobs\OrderEmailJob;
use App\Mail\OrderPlaced;
use App\Order;
use App\OrderProduct;
use App\Product;
use App\Rating;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Paystack;

class PaymentController extends Controller
{

    /**
     * 
     * Redirect the User to Paystack Payment Page
     * @return Url
     */
    public function redirectToGateway()
    {
        //to check if the product quantity is still available
        if ($this->productAreNoLongerAvailable()) 
            {
                return back()->withErrors('Sorry, One of the items in your cart is no longer available!');
            }

         try {                
                return Paystack::getAuthorizationUrl()->redirectNow();
            } catch (\GuzzleHttp\Exception\ConnectException $e) {
                
               return view('errors.connectError');
            }    
    }

    /**
     * Obtain Paystack payment information and store the data of the order to the database
     * @return void
     */
    public function handleGatewayCallback()
    { 

        //SUCCESSFUL
        $paymentDetails = Paystack::getPaymentData(); 
        //dd($paymentDetails); 
        //dd($paymentDetails['data']['amount']); 

        $TotalPaid = $paymentDetails['data']['metadata']['newSubtotal'] + $paymentDetails['data']['metadata']['delivery_fee'];
        $altaddress = $paymentDetails['data']['metadata']['altaddress'];
        if ($altaddress == NULL) 
            {
                $mainAddress = $paymentDetails['data']['metadata']['address'].'. LGA: '.auth()->user()->lga.' STATE: '.auth()->user()->state;
            }else
                {
                    $mainAddress = $altaddress;
                }

        //Insert into orders table
            $order = Order::create([
                'user_id' => $paymentDetails['data']['metadata']['user_id'],
                'billing_email' => $paymentDetails['data']['customer']['email'], 
                'billing_name' => $paymentDetails['data']['metadata']['name'], 
                'billing_address' => $mainAddress, 
                'billing_phone' => $paymentDetails['data']['metadata']['phone'], 
                'delivery_fee' => $paymentDetails['data']['metadata']['delivery_fee'], 
                'billing_discount' => $paymentDetails['data']['metadata']['discount'], 
                'billing_discount_code' => $paymentDetails['data']['metadata']['discount_code'], 
                'billing_subtotal' => $paymentDetails['data']['metadata']['newSubtotal'],
                'billing_total' => $TotalPaid,
            ]);
            
            $productId = $paymentDetails['data']['metadata']['product_id'];
            $productQty = $paymentDetails['data']['metadata']['product_qty'];

            $countItem = count($productId);
            //to insert data into order_product table

            for ($h=0; $h < $countItem; $h++) 
                { 
                    OrderProduct::create([
                        'order_id' => $order->id,
                        'product_id' => $productId[$h],
                        'quantity' => $productQty[$h],
                    ]);

                    Rating::create([
                        'order_id' => $order->id,
                        'user_id' => $paymentDetails['data']['metadata']['user_id'],
                        'user_email' => $paymentDetails['data']['customer']['email'],
                        'product_id' => $productId[$h],
                        'token' => 'rating'.time().'token'.$productId[$h],
                    ]);
                }    


         //this is to send message to the admin and to the customer
        //$customerPhone = $paymentDetails['data']['metadata']['phone'] + 0;
        // include 'sms.php';

        //Mail::send(new OrderPlaced($order));
        OrderEmailJob::dispatch($order)->delay(now()->addSeconds(2));

        //decrease the quantity of all the products in the cart
        $this->decreaseQuantities();

        
         //destroying the cart and the coupon   
        Cart::instance('default')->destroy();
        session()->forget('coupon');
        session()->forget('newTotal');

        return redirect()->route('confirmation.index')->with([
            'success_message'=> 'Thank You! We have received your payment',
            'received_email' => $paymentDetails['data']['customer']['email'],
            'received_amount' => $paymentDetails['data']['amount'] / 100,
            'order_id' => $paymentDetails['data']['id'],
        ]);

        
    }

    public function payondelivery(Request $request)
    {      
        $altaddress = $request->altaddress;

        if ($altaddress == NULL) 
            {
                $mainAddress = auth()->user()->address.'. LGA: '.auth()->user()->lga.' STATE: '.auth()->user()->state;
            }else
                {
                    $mainAddress = $altaddress;
                }

        //Insert into orders table
            $order = Order::create([
                'user_id' => auth()->user()->id,
                'billing_email' => auth()->user()->email, 
                'billing_name' => auth()->user()->name, 
                'billing_address' => $mainAddress, 
                'billing_phone' => auth()->user()->phone, 
                'delivery_fee' => $request->delivery_fee, 
                'billing_discount' => $request->billing_discount, 
                'billing_discount_code' => $request->billing_discount_code, 
                'billing_subtotal' => $request->billing_subtotal,
                'billing_total' => $request->billing_total,
                'payment_gateway' => 'Pay On Delivery'
            ]);

            //to insert data into order_product table
            foreach(Cart::instance('default')->content() as $item)
            {
                // $product_id[] = $item->model->id;
                // $product_qty[] = $item->qty;
                OrderProduct::create([
                    'order_id' => $order->id,
                    'product_id' => $item->model->id,
                    'quantity' => $item->qty,
                ]);

                Rating::create([
                    'order_id' => $order->id,
                    'user_id' => auth()->user()->id,
                    'user_email' => auth()->user()->email,
                    'product_id' => $item->model->id,
                    'token' => 'rating'.time().'token'.$item->model->id,
                ]);
            }


        //Mail::send(new OrderPlaced($order));
        OrderEmailJob::dispatch($order)->delay(now()->addSeconds(2));

        //decrease the quantity of all the products in the cart
        $this->decreaseQuantities();

        
         //destroying the cart and the coupon   
        Cart::instance('default')->destroy();
        session()->forget('coupon');
        session()->forget('newTotal');

        return redirect()->route('confirmation.index')->with([
            'success_message'=> 'Thank You for your order! We will receive payment on delivery',
            'received_email' => auth()->user()->email,
            'received_amount' => $request->billing_total,
            'order_id' => $order->id,
        ]);

        
    }

    /*protected function addToOrdersTable()
        {
            //Insert into orders table
            $order = Order::create([
                'user_id' => auth()->user()->id,
                'billing_email' => $paymentDetails['data']['customer']['email'], 
                'billing_name' => $paymentDetails['data']['metadata']['name'], 
                'billing_address' => $paymentDetails['data']['metadata']['address'], 
                'billing_phone' => $paymentDetails['data']['metadata']['phone'], 
                'delivery_fee' => $paymentDetails['data']['metadata']['delivery_fee'], 
                'billing_discount' => $this->getNumbers()->get('discount'), 
                'billing_discount_code' => $this->getNumbers()->get('code'), 
                'billing_subtotal' => $this->getNumbers()->get('newSubtotal'),
                'billing_total' => $this->getNumbers()->get('newTotal'),
            ]);
         
         //Insert into order_product table
            foreach (Cart::content() as $item) 
                {
                    OrderProduct::create([
                        'order_id' => $order->id,
                        'product_id' => $item->model->id,
                        'quantity' => $item->qty,
                    ]);
                }

            return $order;    
        } */

    //this function calculates the discount, total, and sub-total
    private function getNumbers()
        {
            $discount = session()->get('coupon')['discount'] ?? 0;
            $code = session()->get('coupon')['name'] ?? null;
            $newSubtotal = (Cart::instance('default')->subtotal() - $discount);
            $newTotal = $newSubtotal;
            
            session()->put('newTotal', $newTotal);
            
            if ($newSubtotal < 0) 
                {
                    $newSubtotal = 0;
                }

            //this is to get the average sum of the delivery fee
            $delivery_fee = 0;
            $delivery_item = 0;
            $delivery_avg = 0;
            
             foreach (Cart::instance('default')->content() as $item) 
                {
                    $delivery_fee +=  $item->model->delivery_fee;
                    $delivery_item += 1;
                    $delivery_avg = $delivery_fee/$delivery_item;                  
                }

            //this is to get the dynamic delivery fee
            if ($delivery_avg == 0) 
                {
                   $delivery_sum = 0;
                }elseif ($delivery_avg == 200) 
                    {
                        $delivery_sum = 200;
                    }elseif ($delivery_avg == 300) 
                        {
                            $delivery_sum = 600;
                        }elseif ($delivery_avg == 400) 
                            {
                                $delivery_sum = 400;
                            }else
                                {
                                    $delivery_sum = $delivery_avg + 100;
                                }  

            $prod_qty = Cart::instance('default')->count();                    
            
           // this is to add money if quantity is more than 3   

           if ($prod_qty == 3 || $prod_qty == 4) 
            {
                $delivery_sum += 200;
            }elseif ($prod_qty >= 5) 
                {
                    $delivery_sum += 300;
                }else
                    {
                        $delivery_sum += 0;
                    }
                
                
            //$newTotal = $newSubtotal + $delivery_sum;

            return collect([
                'discount' => $discount,
                'code' => $code,
                'newSubtotal' => $newSubtotal,
                'newTotal' => $newTotal + $delivery_sum,
            ]);  
        }

    //this function decrements quantities from the cart
    protected function decreaseQuantities()
        {
            foreach (Cart::content() as $item) 
                {
                    $product = Product::find($item->model->id);

                    $product->update([
                        'quantity' => $product->quantity - $item->qty
                    ]);
                }
        }

        //this function  checks the availability of products in the cart session
    protected function productAreNoLongerAvailable()
        {
           foreach (Cart::content() as $item) 
                {
                    $product = Product::find($item->model->id);

                    if ($product->quantity < $item->qty) 
                        {
                            return true;
                        }
                } 
            return false;    
        }        

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
