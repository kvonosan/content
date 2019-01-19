<?php

use yii\widgets\LinkPager;
use yii\helpers\Url;

$this->title = 'Контент для Catpost';

if (!Yii::$app->user->isGuest)
{
    echo "<p id=\"back-top\">";
    echo "<a href=\"#top\"><span></span>Прокрутить наверх</a>";
    echo "</p>";

    if (isset($korzina))
    {
        if ($korzina == "" || $count == 0)    
        {
            echo "<div class=\"cd-cart-container empty\">";
        } else
        {
            echo "<div class=\"cd-cart-container\">";
        }
    } else
    {
        echo "<div class=\"cd-cart-container empty\">";
    }


    echo "   <a href=\"#0\" class=\"cd-cart-trigger\">";
    echo "        Cart";
    echo "        <ul class=\"count\">";
    echo "            <li>"; 
    if (isset($count))
    {
        echo $count;
    }
    echo "</li>";
    echo "<li>";
    if (isset($count))
    {
        if ($count == 0)
        {
            echo 0;
        } else
        {
            echo $count+1;    
        }
    }
    echo "    </li>";
    echo "        </ul>";
    echo "    </a>";
    echo "    <div class=\"cd-cart\">";
    echo "           <div class=\"wrapper\">";
    echo "                    <header>";
    echo "                            <h2>Корзина</h2>";
    echo "                            <span class=\"undo\">Продукт удален. <a href=\"#0\">Отменить</a></span>";
    echo "                    </header>";

    echo "                   <div class=\"body\">";
    echo "                           <ul>";
    if (isset($korzina))
        echo $korzina;
    echo "                            </ul>";
    echo "                    </div>";

    echo "                    <footer>";
    echo "                            <a href=\"" . Url::toRoute('/site/korzina') . "\" class=\"checkout btn\"><em>Оформить - <span>";
    if (isset($cost))
        { echo $cost.".00";}
        else {echo "0";}
    echo "   </span>₽</em></a>";
    echo "                    </footer>";
    echo "            </div>";
    echo "    </div>";
    echo "</div>";

    foreach ($posts as $post)
    {
        echo "<div class=\"panel panel-default\"><div class=\"panel-body text-center\">";
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
        echo "<main><a href=\"#\" class=\"cd-add-to-cart\" data-id=" . $post['id'] . " data-price=\"4.00\">Добавить в корзину(4 рубля)</a></main>";
        echo "</div></div>";
    }

    echo "<div align=center>";
    echo LinkPager::widget([
        'pagination' => $pages,
    ]);
    echo "</div>";            
} else
{
    //echo "<h3><a href=\"" . Url::toRoute('/user/registration/register') . "\">Зарегистрируйтесь</a> чтобы просматривать контент!</h3>";
    //echo "<h3><a href=\"" . Url::toRoute('/user/security/login') . "\">Войдите</a> если у вас уже есть аккаунт!</h3>";
    echo "<p id=\"back-top\">";
    echo "<a href=\"#top\"><span></span>Прокрутить наверх</a>";
    echo "</p>";
    foreach ($posts as $post)
    {
        echo "<div class=\"panel panel-default\"><div class=\"panel-body text-center\">";
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
        echo "<main><a href=\"#\" class=\"cd-add-to-cart\" data-id=" . $post['id'] . " data-price=\"4.00\">Добавить в корзину(4 рубля)(доступно после регистрации)</a></main>";
        echo "</div></div>";
    }

    echo "<div align=center>";
    echo LinkPager::widget([
        'pagination' => $pages,
    ]);
    echo "</div>";

}
?>
