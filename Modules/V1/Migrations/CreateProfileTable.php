<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('api_profiles', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('company', 255);
            $table->string('description', 512);
            $table->string('phone', 25);
            $table->string('address', 512);
            $table->foreign('package_code')->references('id')->on('api_packages')->onDelete('SET NULL');
            $table->string('email', 512);
            $table->string('password', 512);
            $table->foreign('language_id')->references('id')->on('api_languages')->onDelete('SET NULL');
            $table->string('main_color', 512)->nullable('#afadad');
            $table->tinyInteger('status', 2)->nullable(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('api_profiles');
    }
}
