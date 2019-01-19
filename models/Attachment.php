<?php

namespace app\models;

use yii\base\Model;

class Attachment extends Model
{
    public $id;
    public $group_id;
    public $post_id;
    public $type;
    public $vk_id;
    public $owner_id;
    public $link;
    public $date;
}
