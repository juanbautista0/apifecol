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
        Schema::create('api_billers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreign('profile_id')->references('id')->on('api_profiles')->onDelete('cascade');
            $table->string('name', 255);
            $table->string('business_name', 255);
            $table->string('identification_number', 25);
            $table->tinyInteger('dv', 1)->nullable();
            $table->foreign('language_id')->references('id')->on('api_languages')->onDelete('SET NULL');
            $table->foreign('tax_id')->references('id')->on('api_taxes')->onDelete('SET NULL');
            $table->foreign('country_id')->references('id')->on('api_countries')->onDelete('SET NULL');
            $table->foreign('type_currency_id')->references('id')->on('api_type_currencies')->onDelete('SET NULL');
            $table->foreign('type_organization_id')->references('id')->on('api_type_organization')->onDelete('SET NULL');
            $table->foreign('type_regime_id')->references('id')->on('api_type_regimes')->onDelete('SET NULL');
            $table->foreign('liability_id')->references('id')->on('api_type_liabilities')->onDelete('SET NULL');
            $table->foreign('nit_type_id')->references('id')->on('api_nit_types')->onDelete('SET NULL');
            $table->foreign('municipality_id')->references('id')->on('api_municipalities')->onDelete('SET NULL');
            $table->string('merchant_registration', 55);
            $table->string('software_id', 512);
            $table->string('pin', 10);
            $table->string('test_id', 512);
            $table->tinyInteger('printing_format', 512)->nullable(1);
            $table->foreign('send_method')->references('id')->on('api_invoices_send_method');
            $table->string('address', 512);
            $table->string('phone', 25);
            $table->string('email', 255);
            $table->string('email', 255);
            $table->string('certificate', 512);
            $table->string('certificate_password', 512);
            $table->date('certificate_validity');
            $table->string('host_email', 512);
            $table->string('host_username', 512);
            $table->string('host_password', 512);
            $table->integer('host_port', 4);
            $table->string('integrations', 255);
            $table->tinyInteger('status', 2)->nullable(1);
            $table->binary('image');
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
        Schema:: dropIfExists('api_billers');
    }
}
