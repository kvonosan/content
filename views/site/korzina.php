<?php
use yii\helpers\Url;
use yii\bootstrap\Button;

if (!Yii::$app->user->isGuest)
{
    $this->title = 'Корзина пользователя ' . Yii::$app->user->identity->username;
    echo "<h3 id=\"header1\"> $this->title:</h3>";
    echo "<h4>Если вы купите контент который у вас уже куплен, деньги не отнимаются!</h4>";
    if (isset($posts) && $posts != array())
    {
        foreach ($posts as $post)
        {
            echo "<div class=\"panel panel-default ". $post['id'] . "\"><div class=\"panel-body text-center\">";
            if ($post['text'] == '' && $post['repost_text'] == '')
            {
                $text = '';
            } else if ($post['text'])
            {
                $text = '<h3>' . $post['text'] . '</h3>';
            } else if ($post['repost_text'])
            {
                $text = '<h3>' . $post['repost_text'] . '</h3>';
            }
            echo "<h3 class=\"del\"> Пост номер(ID) ".$post['id']."</h3>";
            echo "$text";

            foreach ($post->Attachments as $attach)
            {
                if ($attach['type'] == 'photo' || $attach['type'] == 'doc')
                {
                    echo '<img width="600px" src=' . $attach['link'] . ' class="img-responsive center-block" >';
                }
            }

            echo "<p><img src=\"img/like.png\">" . $post['likes'];
            echo "<img src=\"img/repost.png\">" . $post['reposts'];
            echo "<img src=\"img/views.png\">" . $post['views'] . "</p>";
            echo "<p>Дата: " . gmdate("H:i:s d-m-Y", $post['date']) . "</p>";
            echo Button::widget([
                'label' => 'Удалить из корзины',
                'options' => ['class' => 'btn-lg', 'onclick' => 'removeKorzina('. $post['id']. ');'],
            ]);
            echo "</div></div>";
        }
        echo "<div class=\"text-center\">";
        echo Html::button('Купить все', ['class'=>'btn btn-primary', 'onclick' => 'buy()']);
        echo "</div>";
    } else
    {
        echo "<h3> Корзина пуста.</h3>";
    }
} else
{
    echo "<h3><a href=\"" . Url::toRoute('/user/registration/register') . "\">Зарегистрируйтесь</a> чтобы просматривать контент!</h3>";
    echo "<h3><a href=\"" . Url::toRoute('/user/security/login') . "\">Войдите</a> если у вас уже есть аккаунт!</h3>";
}
?>
<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Недостаточно денег.</h4>
      </div>
      <div class="modal-body">
        <p>У вас недостаточно денег для совершения покупки.</p>
        <p id="balance"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
        <button type="button" class="btn btn-primary" onclick="gotokabinet()">Пополнится</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->