<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookingShowRequest extends FormRequest
{

    public function register(): void
    {
        ///
    }

    public function authorize(): bool
    {
        return true;  
    }

    public function rules(): array
    {
        return [
            'code' => 'requrired',
            'email' => 'required|email',
            'phone_number' => 'required'
        ];
    }
}
