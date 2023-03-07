<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('company_contact_person', function (Blueprint $table) {
            $table->id();
            $table->integer('company_addres_id');
            $table->string('contact_person', 150);
            $table->string('contact_person_post', 100);
            $table->string('contact_number', 50);
            $table->string('contact_email', 150);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
