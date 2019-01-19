<?php
use yii\helpers\Url;

if (!Yii::$app->user->isGuest)
{
    $this->title = 'Кабинет пользователя ' . Yii::$app->user->identity->username;
    echo "<h3> $this->title.</h3>";
    echo "<h3>На вашем счету $money рублей.<br>Пополнить счет вы можете ниже.</h3>";?>
<h3>Внимание при оплате указывайте email который вы вводили при регистрации на этом сайте, иначе оплата не пройдет!</h3>
<iframe src="http://www.free-kassa.ru/merchant/forms.php?gen_form=1&writer=seller&targets=Пополнить счет Catpost контент&default-sum=50&button-text=Оплатить&hint=&encoding=CP1251&type=big&m=56024&id=32140"  width="650" height="540" frameBorder="0" ></iframe>
    <?php
} else
{
    echo "<h3><a href=\"" . Url::toRoute('/user/registration/register') . "\">Зарегистрируйтесь</a> чтобы просматривать контент!</h3>";
    echo "<h3><a href=\"" . Url::toRoute('/user/security/login') . "\">Войдите</a> если у вас уже есть аккаунт!</h3>";
}
?>
