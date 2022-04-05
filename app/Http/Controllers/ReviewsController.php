<?php

namespace App\Http\Controllers;

use App\Category;
use App\CategorySub;
use App\Rating;
use App\Review;
use App\User;
use Illuminate\Http\Request;

class ReviewsController extends Controller
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
     * this function returns the user where he will rate the product
     * Show the form for creating a new resource.
     *
     * @param  string  $token
     * @return \Illuminate\Http\Response
     */
    public function create($token)
    {
        $rating = Rating::where('token', $token)->first();
        $categories = Category::all();
        $allSubCategories = CategorySub::all();

        if (!$rating) 
            {
                return redirect()->route('landing-page')->with('success_message', 'Invalid Token!');
            }

        $checkRating = Review::where('token', $token)->get()->count();
        if ($checkRating > 0) 
            {
                return redirect()->route('landing-page')->with('success_message', 'You have already rated the product');
            }
        return view('rating-create')->with([
                    'rating' => $rating,
                    'categories' => $categories,
                    'allSubCategories' => $allSubCategories,
                ]);
    }

    /**
     * this function is where the user submits his rating for a product he purchased
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rating = Rating::where('token', $request->input('Thetoken'))->first();
        if (!$rating) 
            {
                return redirect()->route('landing-page')->with('success_message', 'Invalid Token!');
            }

        $request->validate([
            'rating' => 'required|integer',
            'review' => 'required|string',
            // 'g-recaptcha-response' => 'required|captcha',
        ]);

        $user = User::find($rating->user_id);

        Review::create([
            'rating' => $request->input('rating'),  
            'review' => $request->input('review'),  
            'user_name' => $user->name,  
            'product_id' => $rating->product_id,  
            'token' =>  $request->input('Thetoken'),
        ]);

        return redirect()->route('landing-page')->with([
            'success_message' => 'Your review have been submitted successfully!',
        ]);
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
