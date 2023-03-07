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
        Schema::create('company_addres', function (Blueprint $table) {
            $table->id();
            $table->integer('client_info_id');
            $table->string('company_address')->nullable();
            $table->string('company_city', 150)->nullable();
            $table->string('company_contrary', 150)->nullable();
            $table->string('company_email', 150)->nullable();
            $table->string('company_phone', 30)->nullable();
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
