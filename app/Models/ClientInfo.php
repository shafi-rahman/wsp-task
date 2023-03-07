<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientInfo extends Model
{
    use HasFactory;

    protected $fillable = [
        'company_name', 
        'company_alias', 
        'company_type',
        'company_logo',
        'company_description',
        'status',
        'company_address',
        'company_city',
        'company_contrary',
        'company_email',
        'company_phone',
        'contact_person',
        'contact_person_post',
        'contact_number',
        'contact_email'
    ];
}
