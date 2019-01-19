<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use app\models\posts_vk;
use app\models\attachments_vk;
use app\models\buffer;
use app\models\Post;
use app\models\Attachment;
use yii\data\Pagination;
use app\models\account;
use app\models\user;
use app\models\user_content;


class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }
    
    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        //if (Yii::$app->user->isGuest)
	//{
        //    return $this->render('index');
        //}
        
        $query = posts_vk::find();//->where('trash=0');
        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count(), 'pageSize'=>10]);
        $posts_in_db = $query->offset($pages->offset)->limit($pages->limit)->orderBy(['date' => SORT_DESC])->all();
        $posts = array();
        
        $index_posts = 0;
        foreach ($posts_in_db as $post_in_db)
        {
            $post = new Post();
            $post->id = $post_in_db['id'];
            $post->group_id = $post_in_db['group_id'];
            $post->vk_id = $post_in_db['vk_id'];
            $post->date = $post_in_db['date'];
            $post->text = $post_in_db['text'];
            $post->likes = $post_in_db['likes'];
            $post->reposts = $post_in_db['reposts'];
            $post->views = $post_in_db['views'];
            $post->repost_text = $post_in_db['repost_text'];
            $post->owner_id = $post_in_db['owner_id'];
            $post->who_add = $post_in_db['who_add'];
            $post->trash = $post_in_db['trash'];
            
            $attachments = Array();
            $attachments_in_db = attachments_vk::find()->where('post_id='. $post_in_db['id'])->all();
            $index_attach = 0;
            foreach ($attachments_in_db as $attachment_in_db)
            {
                $attach = new Attachment();
                $attach->id = $attachment_in_db['id'];
                $attach->group_id = $attachment_in_db['group_id'];
                $attach->post_id = $attachment_in_db['post_id'];
                $attach->type = $attachment_in_db['type'];
                $attach->vk_id = $attachment_in_db['vk_id'];
                $attach->owner_id = $attachment_in_db['owner_id'];
                $attach->link = $attachment_in_db['link'];
                $attach->date = $attachment_in_db['date'];
                $attachments[$index_attach] = $attach;
                $index_attach++;
            }
            $post->Attachments = $attachments;
            $posts[$index_posts] = $post;
            $index_posts++;
        }

        /*$buffer = new buffer();
        $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
        if ($record != "")
        {
            return $this->render('index',['posts' => $posts, 'pages' => $pages,
            'korzina' => $record->korzina, 'count' => $record->count, 
                'cost' => $record->cost]);
        } else
        {*/
            return $this->render('index',['posts' => $posts, 'pages' => $pages]);
        //}
    }

    public function actionAdd()
    {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        if (Yii::$app->request->post())
        {
            $buffer = new buffer();
            $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
            if ($record == "")
            {
                $buffer->user_id = Yii::$app->user->id;
                $buffer->korzina = Yii::$app->request->post('form_');
                $buffer->count = Yii::$app->request->post('count_');
                $buffer->cost = Yii::$app->request->post('cost_');
                $buffer->save();
            } else
            {
                $record->korzina = Yii::$app->request->post('form_');
                $record->count = Yii::$app->request->post('count_');
                $record->cost = Yii::$app->request->post('cost_');
                $record->update();
            }
        }
    }
    
    public function actionDel()
    {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        if (Yii::$app->request->post())
        {
            $buffer = new buffer();
            $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
            $record->korzina = Yii::$app->request->post('form_');
            $record->count = Yii::$app->request->post('count_');
            $record->cost = Yii::$app->request->post('cost_');
            $record->update();
        }
    }
    
    public function actionCabinet()
    {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        $account = new account();
        $record = $account::findOne(['user_id' => Yii::$app->user->id]);
        $money = 0;
        if ($record == "")
        {
            $account->user_id = Yii::$app->user->id;
            $account->money = 0;
            $account->save();
        } else
        {
            $money = $record->money;
        }
         
        return $this->render('cabinet', ['money' => $money]);
    }
    
    public function actionKorzina()
    {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        
        function GetPosts()
        {
            $buffer = new buffer();
            $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
            if ($record != "")
            {
                $posts = array();
                $posts_korzina = array();

                $post_start = 0;
                $post_end = 0;

                $korzina_post_start = 0;
                $korzina_post_end = 0;
                $korzina_offset = 0;

                while(1)
                {
                    $korzina_post_end = strpos($record->korzina, '</li>', $korzina_offset);
                    if ($korzina_post_end == false)
                    {
                        break;
                    }
                    $korzina_post = substr($record->korzina, $korzina_post_start, $korzina_post_end + 5 - $korzina_post_start);
                    array_push($posts_korzina, $korzina_post);
                    $korzina_post_start = $korzina_offset = $korzina_post_end+5;

                    $post_start = strpos($korzina_post, 'Пост ');
                    $post_end = strpos($korzina_post, '</a>', $post_start);
                    $post_start+=9;
                    $post = substr($korzina_post, $post_start, $post_end - $post_start);
                    array_push($posts, $post);
                }
                return array($posts_korzina, $posts);
            } else
            {
                return "";
            }
        }
        $result = GetPosts();
        if ($result == "")
        {
            return $this->render('korzina');
        } else
        {
            $posts = array();
            $index_posts = 0;
            foreach ($result[1] as $post_num)
            {
                $post_in_db = posts_vk::findOne(['id' => $post_num]);
                $post = new Post();
                $post->id = $post_in_db['id'];
                $post->group_id = $post_in_db['group_id'];
                $post->vk_id = $post_in_db['vk_id'];
                $post->date = $post_in_db['date'];
                $post->text = $post_in_db['text'];
                $post->likes = $post_in_db['likes'];
                $post->reposts = $post_in_db['reposts'];
                $post->views = $post_in_db['views'];
                $post->repost_text = $post_in_db['repost_text'];
                $post->owner_id = $post_in_db['owner_id'];
                $post->who_add = $post_in_db['who_add'];
                $post->trash = $post_in_db['trash'];

                $attachments = Array();
                $attachments_in_db = attachments_vk::find()->where('post_id='. $post_in_db['id'])->all();
                $index_attach = 0;
                foreach ($attachments_in_db as $attachment_in_db)
                {
                    $attach = new Attachment();
                    $attach->id = $attachment_in_db['id'];
                    $attach->group_id = $attachment_in_db['group_id'];
                    $attach->post_id = $attachment_in_db['post_id'];
                    $attach->type = $attachment_in_db['type'];
                    $attach->vk_id = $attachment_in_db['vk_id'];
                    $attach->owner_id = $attachment_in_db['owner_id'];
                    $attach->link = $attachment_in_db['link'];
                    $attach->date = $attachment_in_db['date'];
                    $attachments[$index_attach] = $attach;
                    $index_attach++;
                }
                $post->Attachments = $attachments;
                $posts[$index_posts] = $post;
                $index_posts++;
            }
            return $this->render('korzina', ['posts' => $posts]);
        }
    }
    
     public function actionRemove()
     {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        
        function GetPosts()
        {
            $buffer = new buffer();
            $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
            if ($record != "")
            {
                $posts = array();
                $posts_korzina = array();

                $post_start = 0;
                $post_end = 0;

                $korzina_post_start = 0;
                $korzina_post_end = 0;
                $korzina_offset = 0;

                while(1)
                {
                    $korzina_post_end = strpos($record->korzina, '</li>', $korzina_offset);
                    if ($korzina_post_end == false)
                    {
                        break;
                    }
                    $korzina_post = substr($record->korzina, $korzina_post_start, $korzina_post_end + 5 - $korzina_post_start);
                    array_push($posts_korzina, $korzina_post);
                    $korzina_post_start = $korzina_offset = $korzina_post_end+5;

                    $post_start = strpos($korzina_post, 'Пост ');
                    $post_end = strpos($korzina_post, '</a>', $post_start);
                    $post_start+=9;
                    $post = substr($korzina_post, $post_start, $post_end - $post_start);
                    array_push($posts, $post);
                }
                return array($posts_korzina, $posts);
            } else
            {
                return "";
            }
        }
        $result = GetPosts();        
        
        if (Yii::$app->request->post())
        {
            $post_id = Yii::$app->request->post('post_id');
            
            $index = 0;
            $exist = false;
            foreach ($result[1] as $id)
            {
                if ($id == $post_id)
                {
                    $exist = true;
                    break;
                }
                $index++;
            }
            
            if ($exist)
            {
                $index1 = 0;
                $form = "";
                foreach ($result[0] as $str)
                {
                    if ($index1 != $index)
                    {
                        $form.=$str;
                    }
                    $index1++;
                }

                $buffer = new buffer();
                $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);

                if ($record->count > 1)
                {
                    $record->korzina = $form;
                    $record->count = $record->count - 1;
                    $record->cost = $record->cost - 4;
                    $record->update();
                } else
                {
                    $record->korzina = "";
                    $record->count = 0;
                    $record->cost = 0;
                    $record->update();
                }
                echo $post_id;
            }
        }
     }
     
     public function actionBuy()
     {
         return $this->render('buy');
     }
     
     public function actionPosts()
     {
         return $this->render('posts');
     }
     
     public function actionPopolnit()
     {
        $user = new user();
        $record1 = $user::findOne(['email' => $_GET['P_EMAIL']]);
        $user_id = $record1->id;
        
        $account = new account();
        $record3 = $account::findOne(['user_id' => $user_id]);
        $record3->money = $record3->money + $_GET['AMOUNT'];
        $record3->save();
        
        die('YES');
     }
     
     public function actionAll()
     {
        if (Yii::$app->user->isGuest)
        {
            return $this->render('index');
        }
        
        function GetPosts()
        {
            $buffer = new buffer();
            $record = $buffer::findOne(['user_id' => Yii::$app->user->id]);
            if ($record != "")
            {
                $posts = array();
                $posts_korzina = array();

                $post_start = 0;
                $post_end = 0;

                $korzina_post_start = 0;
                $korzina_post_end = 0;
                $korzina_offset = 0;

                while(1)
                {
                    $korzina_post_end = strpos($record->korzina, '</li>', $korzina_offset);
                    if ($korzina_post_end == false)
                    {
                        break;
                    }
                    $korzina_post = substr($record->korzina, $korzina_post_start, $korzina_post_end + 5 - $korzina_post_start);
                    array_push($posts_korzina, $korzina_post);
                    $korzina_post_start = $korzina_offset = $korzina_post_end+5;

                    $post_start = strpos($korzina_post, 'Пост ');
                    $post_end = strpos($korzina_post, '</a>', $post_start);
                    $post_start+=9;
                    $post = substr($korzina_post, $post_start, $post_end - $post_start);
                    array_push($posts, $post);
                }
                return array($posts_korzina, $posts);
            } else
            {
                return "";
            }
        }
        $result = GetPosts();
        if ($result != "")
        {
            //для всех идов в корзине если хватает денег переместить их в купленный контент
            $summ = count($result[1]) * 4;
            $account = new account();
            $record3 = $account::findOne(['user_id' => Yii::$app->user->id]);
            if ($record3->money > $summ)
            {
                $record3->money = $record3->money - $summ;
                $record3->save();

                $vozvrat = 0;
                foreach ($result[1] as $id)
                {
                    $user_content = new user_content();
                    $exist = $user_content::findOne(['post_id' => $id, 'user_id' => Yii::$app->user->id]);
                    if ($exist == "")
                    {
                        $user_content->user_id = Yii::$app->user->id;
                        $user_content->post_id = $id;
                        $user_content->published = 0;
                        $user_content->insert();
                    } else
                    {
                        $vozvrat+=4;
                    }
                }
                
                $record3->money = $record3->money + $vozvrat;
                $record3->save();
                
                echo json_encode(array(true));
            } else
            {
                echo json_encode(array(false, $record3->money, $summ, $summ - $record3->money));
            }
        }
     }
}
