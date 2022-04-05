<?php

namespace App\Http\Controllers;

use App\Category;
use App\CategorySub;
use Illuminate\Http\Request;

class ConfirmationController extends Controller
{
    /**
     * this function takes the user to the confirmation page after the order has been done
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $allSubCategories = CategorySub::all();
        
        if (!session()->has('success_message')) {
            return redirect('/');
        }

        $categories = Category::all();

        return view('checkout-complete')->with([
            'categories' => $categories,
            'allSubCategories' => $allSubCategories,
            'received_email' => session()->get('received_email'),
            'received_amount' => session()->get('received_amount'),
            'order_id' => session()->get('order_id'),
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
