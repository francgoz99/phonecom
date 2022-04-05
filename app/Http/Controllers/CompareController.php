<?php

namespace App\Http\Controllers;

use App\Category;
use App\CategorySub;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CompareController extends Controller
{
    /**
     * this function takes the user to the compare page where users sees the products we are comparing 
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        $allSubCategories = CategorySub::all();

        return view('compare')->with([
            'user' => auth()->user(),
            'categories' => $categories,
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
     * this is the function that stores the product in a compare session
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $duplicates = Cart::instance('compare')->search(function($cartItem, $rowId) use($request){
            return $cartItem->id === $request->id;
        });

        if ($duplicates->isNotEmpty()) 
            {
                return back()->with('success_message', 'Item is already in your compare!');
            }

        Cart::instance('compare')->add($request->id, $request->name, 1, $request->price)
                ->associate('App\Product');

        return redirect()->route('compare.index')->with('success_message', 'Item was added to your compare list!');
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
     * this is the function that delete products from the compare session
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::instance('compare')->remove($id);

        return back()->with('success_message', 'Item has been removed from compare list!');
    }

    /**
     * this is the function that switches a product from a whishlist to a cart
     * Switch item from wishlist to Cart.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function switchToCart($id)
    {
        $item = Cart::instance('compare')->get($id);

        Cart::instance('compare')->remove($id);

        $duplicates = Cart::instance('default')->search(function($cartItem, $rowId) use($id){
            return $rowId === $id;
        });

        if ($duplicates->isNotEmpty()) 
            {
                return redirect()->route('compare.index')->with('success_message', 'Item is already in your cart!');
            }

        Cart::instance('default')->add($item->id, $item->name, 1, $item->price)
                ->associate('App\Product');

        return redirect()->route('cart.index')->with('success_message', 'Item has been moved to your Cart!');
    }
}
