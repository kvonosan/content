<?php
use yii\helpers\Url;

if (!Yii::$app->user->isGuest)
{
    $this->title = 'В разработке!';
    echo "<h3> $this->title</h3>";
} else
{
    echo "<h3><a href=\"" . Url::toRoute('/user/registration/register') . "\">Зарегистрируйтесь</a> чтобы просматривать контент!</h3>";
    echo "<h3><a href=\"" . Url::toRoute('/user/security/login') . "\">Войдите</a> если у вас уже есть аккаунт!</h3>";
}
?>
