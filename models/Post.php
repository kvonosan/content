<?php

namespace app\models;

use yii\base\Model;

class Post extends Model
{
    public $id;
    public $group_id;
    public $vk_id;
    public $date;
    public $text;
    public $likes;
    public $reposts;
    public $views;
    public $repost_text;
    public $owner_id;
    public $who_add;
    public $trash;
    public $Attachments = array();
}
