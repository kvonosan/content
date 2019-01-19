<?php
use yii\helpers\Url;

if (!Yii::$app->user->isGuest)
{
    $this->title = 'Счет пополнен!';
    echo "<h3> $this->title</h3>";
    echo "<a href=\"" . Url::toRoute('/site/cabinet') . "\">Кабинет</a><br>";
    echo "<a href=\"" . Url::toRoute('/site/index') . "\">Главная</a><br>";
    echo "<a href=\"" . Url::toRoute('/site/korzina') . "\">Корзина</a>";
} else
{
    echo "<h3><a href=\"" . Url::toRoute('/user/registration/register') . "\">Зарегистрируйтесь</a> чтобы просматривать контент!</h3>";
    echo "<h3><a href=\"" . Url::toRoute('/user/security/login') . "\">Войдите</a> если у вас уже есть аккаунт!</h3>";
}
?>
