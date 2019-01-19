<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="no-js">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/back_top.css">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    
    <?php $this->head() ?>
</head>
<body id="top">
<?php $this->beginBody() ?>
<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'Контент для Catpost',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => 'Главная', 'url' => ['/site/index']],
            ['label' => 'Корзина', 'url' => ['/site/korzina'], 'visible' => !Yii::$app->user->isGuest],
            ['label' => 'Кабинет', 'url' => ['/site/cabinet'], 'visible' => !Yii::$app->user->isGuest],
            ['label' => 'Мои посты', 'url' => ['/site/posts'], 'visible' => !Yii::$app->user->isGuest],
            Yii::$app->user->isGuest ?
            ['label' => 'Войти', 'url' => ['/user/security/login']] :
            ['label' => 'Выйти (' . Yii::$app->user->identity->username . ')',
                'url' => ['/user/security/logout'],
                'linkOptions' => ['data-method' => 'post']],
            ['label' => 'Регистрация', 'url' => ['/user/registration/register'], 'visible' => Yii::$app->user->isGuest]
        ],
    ]);
    NavBar::end();
    ?>
    
    <div class="container">
        <div class="site-index">
            <div class="body-content">
                <div class="row">
                    <div class="col-lg-2">
                    </div>

                    <div class="col-lg-8">
                        <?= $content ?>
                    </div>
            
                    <div class="col-lg-2">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Catpost <?= date('Y') ?></p>
        <div class="">
        <a href="//www.free-kassa.ru/"><img class="img-responsive center-block" src="//www.free-kassa.ru/img/fk_btn/21.png"></a>
    </div>
</footer>

<?php $this->endBody() ?>

<script src="/assets/main.js"></script>
<script src="/assets/back_top.js"></script>
<script src="/assets/my_scripts.js"></script>
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter47732662 = new Ya.Metrika({
                    id:47732662,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/47732662" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body>
</html>
<?php $this->endPage() ?>
