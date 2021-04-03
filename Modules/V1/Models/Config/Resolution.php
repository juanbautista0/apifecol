<?php

namespace Models\Config;
use Models\Config\TypeDocument;
use Illuminate\Database\Eloquent\Model as CustomModel;

class Resolution extends CustomModel
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'api_resolutions';
    protected $primaryKey = 'id';
    protected $hidden = ['created_at', 'updated_at'];

    public function TypeDocument()
    {
        return $this->hasOne(TypeDocument::class, 'id', 'type_document_id');
    }
}
