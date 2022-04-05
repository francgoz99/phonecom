<?php

namespace App\Http\Controllers;

use App\Category;
use App\CategorySub;
use App\Order;
use App\OrderProduct;
use App\Seller;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    /**
     * this function returns the user to his account order page where he sees products that he ordered
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        $allSubCategories = CategorySub::all();
        //$orders = auth()->user()->orders; //N + 1 issue

        $orders = auth()->user()->orders()->with('products')->orderBy('id', 'desc')->get(); //fixed n + 1 issues


        return view('account-order')->with([
            'user' => auth()->user(),
            'categories' => $categories,
            'orders' => $orders,
            'allSubCategories' => $allSubCategories,
        ]);
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
     * this function returns the user to where he will see the details of a particular order
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        $categories = Category::all();
        $allSubCategories = CategorySub::all();

        if (auth()->user()->id != $order->user_id) 
            {
                return back()->withErrors('You do not have access to this order!');
            }

        $products = $order->products;
        $order_products = $order->order_products;


        return view('account-order-detail')->with([
            'user' => auth()->user(),
            'order' => $order,
            'products' => $products,
            'categories' => $categories,
            'order_products' => $order_products,
            'allSubCategories' => $allSubCategories,
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
