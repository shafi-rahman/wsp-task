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
        Schema::create('client_infos', function (Blueprint $table) {
            $table->id();
            $table->string('company_name', 150)->nullable();
            $table->string('company_alias', 50)->nullable();
            $table->string('company_type', 50)->nullable();
            $table->string('company_logo')->nullable();
            $table->string('company_description', 250)->nullable();
            $table->boolean('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('client_infos');
    }
};
