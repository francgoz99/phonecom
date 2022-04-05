<?php

namespace App\Http\Controllers;

use App\Invoice;
use App\Product;
use Illuminate\Http\Request;

class AdminController extends Controller
{
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
    public function create($invoice_id)
    {
        //
    }

    /**
     * this is a function that insert records to the invoice database and also deducts it from the products and generate the invoice
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'customer' => 'required',
        ]);

        $product = $request->name;
        $quantity = $request->quantity;
        $customer = $request->customer; 

        
        $invoices = array_combine($product, $quantity);

        //let's check if any of the product is less than the requested amount
        foreach($invoices as $prod_ch_id => $prod_ch_qty) 
            {
                $chproduct = Product::find($prod_ch_id);

                if ($chproduct->quantity < $prod_ch_qty) 
                    {
                        return back()->with('error_message', $chproduct->name.' has quantity less than the ordered amount!');
                    }
            }

        //loop through the result and store it in db
        $invoice_id = mt_rand(1000000000, 9999999999);

        foreach($invoices as $d_id => $d_qty) {
            Invoice::create([
                'invoice_id' => $invoice_id,
                'user_name' => $customer,
                'product_id' => $d_id,
                'product_qty' => $d_qty,
            ]);
        }
        // // dd($invoices);

        //reduce the quantity of those products
        foreach($invoices as $prod_id => $prod_qty) 
            {
                $dproduct = Product::find($prod_id);
                
                $dproduct->decrement('quantity', $prod_qty);
            }

        return redirect()->route('invoice.show', $invoice_id);
    }

    /**
     * this function is what shows the invoice to the admin
     * Display the specified resource.
     *
     * @param  int  $invoice_id
     * @return \Illuminate\Http\Response
     */
    public function show($invoice_id)
    {
        $invoices = Invoice::where('invoice_id', $invoice_id)->get();

        $get_invoice = Invoice::where('invoice_id', $invoice_id)->first();

        return view('/vendor/voyager/invoice-show')->with([
                    'invoices' => $invoices,
                    'invoice_id' => $invoice_id,
                    'get_invoice' => $get_invoice,
                ]);
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
