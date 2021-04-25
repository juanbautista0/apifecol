<?php

namespace Models\Config;

use Illuminate\Database\Eloquent\Model as CustomModel;

class SendMethod extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_invoices_send_method';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];
}
