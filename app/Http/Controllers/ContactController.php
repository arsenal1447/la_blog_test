<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Http\Requests\ContactMeRequest;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    /**
     * 显示表单
     *
     * @return View
     */
    public function showForm()
    {
        return view('blog.contact');
    }


    public function sendContactInfo()
    {
        $data = $request->only('name','email','phone');
        $data['message'] = explode("\n",$request->get('message'));

        Mail::send('emails.contact',$data, function($message) use ($data){
            $messgae->subject('Blog Contact Form:'.$dta['name'])
                ->to(config('blog.contact_email'))
                ->raplyTo($data['email']);
        })

        return back()
            ->withSuccesss("Thank you for your message. It has been sent");


    }
}
