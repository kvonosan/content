-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 19 2019 г., 14:59
-- Версия сервера: 10.2.21-MariaDB
-- Версия PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `catpost_content_vk`
--

-- --------------------------------------------------------

--
-- Структура таблицы `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `account`
--

INSERT INTO `account` (`id`, `user_id`, `money`) VALUES
(5, 38, 1176),
(6, 41, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `attachments_vk`
--

CREATE TABLE `attachments_vk` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `vk_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `buffer`
--

CREATE TABLE `buffer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `korzina` text NOT NULL,
  `count` int(11) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `buffer`
--

INSERT INTO `buffer` (`id`, `user_id`, `korzina`, `count`, `cost`) VALUES
(106, 38, '', 0, 0),
(107, 41, ' ', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `groups_and_users`
--

CREATE TABLE `groups_and_users` (
  `id` int(11) NOT NULL,
  `vk_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tag` varchar(150) DEFAULT NULL,
  `scanned` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `groups_and_users`
--

INSERT INTO `groups_and_users` (`id`, `vk_id`, `type`, `name`, `tag`, `scanned`) VALUES
(1, 308699902, 'user', 'https://vk.com/id308699902', 'Блог Елены Мишениной', 480),
(2, 51048597, 'group', 'https://vk.com/thelurk', 'Лурк', 25501),
(3, 147086895, 'group', 'https://vk.com/frederickmesser', 'Фредерик Мессер', 83),
(4, 265633775, 'user', 'https://vk.com/id265633775', 'Блог Дмитрия Стрельцова', 112),
(5, 42763042, 'group', 'https://vk.com/roundtheworld1', 'Вокруг света', 17317),
(6, 28950133, 'group', 'https://vk.com/in.humour', 'Интеллектуальный юмор', 65915),
(7, 46638176, 'group', 'https://vk.com/moikrug', 'Мой круг — работа в ИТ-индустрии', 18457),
(8, 89846550, 'group', 'https://vk.com/liveplanettv', 'Живая Планета', 4241),
(9, 29599237, 'group', 'https://vk.com/pravoslavnie_hristiane', 'Верую † Православие', 21585),
(10, 139567880, 'group', 'https://vk.com/zhdun', 'Ждун', 395),
(11, 29937606, 'group', 'https://vk.com/bwart', 'Чёрно-белая фотография', 10639),
(12, 85462593, 'group', 'https://vk.com/det_podelki', 'Детские поделки', 18583),
(13, 23170931, 'group', 'https://vk.com/velikieslova', 'Великие Слова | Цитаты и Афоризмы', 22468),
(14, 132260444, 'group', 'https://vk.com/club132260444', 'Вселенная', 3916),
(15, 31478728, 'group', 'https://vk.com/successful_thoughts', 'Психология о жизни', 64489),
(16, 35486195, 'group', 'https://vk.com/zerofat', '0% жирности', 75815),
(17, 26439766, 'user', 'https://vk.com/id26439766', 'Блог Тани Вишенко', 3437),
(18, 270613935, 'user', 'https://vk.com/id270613935', 'Блог Lorrie Wallens', 2346),
(19, 89237741, 'group', 'https://vk.com/ammomals', 'Животные с оружием', 68),
(20, 14897324, 'group', 'https://vk.com/interestplanet_ru', 'Интересная планета - путешествия, туризм', 53531),
(21, 42365455, 'group', 'https://vk.com/goodtravels', 'Путешествия | Интересные факты', 40368),
(22, 35238813, 'group', 'https://vk.com/tripdiary', 'Открой планету заново | Путешествия по миру', 27883),
(23, 49092080, 'group', 'https://vk.com/intelligenttravel', 'Intelligent travel', 5010),
(24, 54566161, 'group', 'https://vk.com/dharma_bums', 'Бродяги Дхармы', 21940),
(25, 25813425, 'group', 'https://vk.com/twitart', 'АРТ искусство', 53528),
(26, 5425797, 'group', 'https://vk.com/iphotolove', 'Фотошкола - i love photo', 35526),
(27, 75193314, 'group', 'https://vk.com/the_ardor', 'A R D O R', 15862),
(28, 34168005, 'group', 'https://vk.com/probizportal', 'Бизнес Портал', 56212),
(29, 119320808, 'group', 'https://vk.com/club119320808', 'Другая красота', 14181);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1502710042),
('m140209_132017_init', 1502710052),
('m140403_174025_create_account_table', 1502710052),
('m140504_113157_update_tables', 1502710053),
('m140504_130429_create_token_table', 1502710053),
('m140830_171933_fix_ip_field', 1502710054),
('m140830_172703_change_account_table_name', 1502710054),
('m141222_110026_update_ip_field', 1502710054),
('m141222_135246_alter_username_length', 1502710054),
('m150614_103145_update_social_account_table', 1502710055),
('m150623_212711_fix_username_notnull', 1502710055),
('m151218_234654_add_timezone_to_profile', 1502710055),
('m160929_103127_add_last_login_at_to_user_table', 1502710055);

-- --------------------------------------------------------

--
-- Структура таблицы `posts_vk`
--

CREATE TABLE `posts_vk` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `vk_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `likes` int(11) NOT NULL,
  `reposts` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL,
  `repost_text` text DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `who_add` int(11) NOT NULL,
  `trash` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(39, 'XK1BnKpoTkI-TnKljXMQaMqErWOW7ei6', 1504622460, 0),
(40, 'sHOBYI5NIjOrDfR7Z6gTvkR9zabCrWhe', 1504792774, 0),
(41, '9i-tw8FC2ZJQE4V7VqTIono2mz0uX9zM', 1505451504, 0),
(42, 'hedlSHhN1k8krLOmazXsIyDB7FFE-qm_', 1505916446, 0),
(43, 'p_kxPnpUeD9mLPZ8PLpQqfFl7tE9IhGe', 1515364343, 0),
(44, 't2wTYAlqLHrxX0KfdUUnc70vbaEjX2Zr', 1522545876, 0),
(45, 'A348T47gpNI0IBs0BPJGnw15QJXj2TUt', 1525084726, 0),
(46, 'ur4u0NtPAjJ1iaHNDjG76gjjaxtkVIjR', 1525123470, 0),
(47, 'wHbz_VdRP8GVQLj81KFUDblONiRWjepB', 1525404593, 0),
(48, 'aMvzfX7SEY6WJAO73ttWcF-3E0C39vpO', 1525796289, 0),
(49, 'gs634rE8yRce0WYGaY8MWWM28hWLc-fa', 1525899026, 0),
(50, 'vGt_c_IAr36Srn0SGRpISfD4qYyrIwQr', 1525925367, 0),
(51, 'MfuxKUacvUHitUd5Von-XJC_2pLuC3-N', 1525931813, 0),
(52, 'qPt5q2jEZRRCINaOxI-i5GaupJPp-nBI', 1526027321, 0),
(53, 'L_-oTWB09SQdgqd7Uf2pZptXzQ9F2glS', 1526061052, 0),
(54, 'mQTYPPG6eI4MFu4i5F4nFvoK9ft7J-8G', 1526074545, 0),
(55, 'LPbi7NuHVRE2Hvp1JHzANK8TmwPJQOrc', 1526346817, 0),
(56, 'skvHxkoshh0y_WOFyE6OZC-c7WrfAfky', 1526453884, 0),
(57, 'M_vAGtaNunMbdOMab8Jx_ewIZHLWmg1a', 1526611655, 0),
(58, 'YKqWqUJuh3aAMMNXRpAzu_4afI95z8OW', 1526975035, 0),
(59, 'Km1DlzBCfaQ5Ee0w8t_sk3AkaMOkTdZU', 1527022179, 0),
(60, '4Cc1kWD8ujaULDHuYDtCMxZcRU8ZccnF', 1527289494, 0),
(61, 'FZHnr8SgKqyGgn6gp23sJfI5zqxRfftm', 1527339448, 0),
(62, 'a6oS6zUqLlklHd5GIjxzpZAL7hrg-cqV', 1527443163, 0),
(63, 'omO6W30KQucCt0F3ha6YmbEnSTT95Dbr', 1527527933, 0),
(64, 'zWT1OYklASJopY7QGPnJKYoRwTqArGOp', 1527563357, 0),
(65, 'n7V5DlPku1eNMmXIqt0EPnJWo3dBag4G', 1527697402, 0),
(66, '2ympNYKdCoNk1_ZIXWVPPfqaQjipU81T', 1529131340, 0),
(67, 'bTNdkxM917EDlHOnsSwncHXcJhTFjIPs', 1530114880, 0),
(68, 'Jq7GcMXo5xRFEpn7EAs96XidmTWps8RS', 1530239869, 0),
(69, 'pI6mbuVNoafmU91ZYlPT7efN9eRcFSCn', 1530247039, 0),
(70, 'qY07DL8rB8PayWLsvxNXcPMBWB10GFY-', 1530666528, 0),
(71, 'Cl71tOq4g0yms35uM6FGrIu1YVz0k82Z', 1530828481, 0),
(72, '6TCPg8MJyEAI3WFTdC0tC4SrxEeGwF-A', 1530957690, 0),
(73, 'jt2h6P2n7rPip_e7ramVStUMHHeGhOMa', 1532032555, 0),
(74, 'h6IPJ9wcPGLQFMvFfwMdVNUpHOOWbn6j', 1533130303, 0),
(75, 'ZZ3AsyKy3HfHRHp8LBxcnmln0-vHf49E', 1533829657, 0),
(76, 'gqUvnJhuNOGw6hT_Jk3yNKZq1uLzybKZ', 1534783469, 0),
(77, '_XGl3POVB-hcME9pRr9D2ftz85nJwKd1', 1534975872, 0),
(78, 'gKJ2rA_UUi-XZCg1nUUIgyp4-06uh5tO', 1535724769, 0),
(79, 'ufmzj5HoAurSFw1A4uF-JtItsIMq6nkm', 1539011031, 0),
(80, 'zx9R18MM_ph93GUhZUgCn4JU6APBvSFc', 1540651779, 0),
(81, 'PssE29-M8Gj7HMRv8yHeXcoJvPoBNWR6', 1540680970, 0),
(82, 'kHPmpyLhNrZ4xI7sNRyxPgCvR-vIdXMf', 1541091257, 0),
(83, 'pnbBjnjv4NTUlAGIMUiVwcFtWZE4Ru-s', 1541922400, 0),
(84, 'GLdAtwWdXMVT__Uehw28Q3G-AaL4ixtX', 1543344691, 0),
(85, '2AvFNkJAMDv-lk-Qg2mgYwjx2_gWqjHL', 1543814799, 0),
(86, 'tvM-CJm9c1jacPqMbVLheF_KuXHq5kU6', 1547726526, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(34, 'tomnolane', 'medvedev.alexandr88@yandex.ru', '$2y$12$B0n/LgeRuxbFzSp3O.amMuTBgbaJFwYNGM4RYvQYXmsJuNpgwEOdW', 'xJmLbWKLzybhYJdWxpuf76pWLtw9FtC7', 1502733652, NULL, NULL, '82.145.220.252', 1502726016, 1502726016, 0, 1502726031),
(39, 'test', 'test@test.ru', '$2y$12$H8wJUQZe3FaHI.w8kWEYceRSO7lE1pG.0obb9n.BnxObFINQpe4KC', '6sUEd4EmaBaykaH5Mdh0DNHxJkWJ8zIT', NULL, NULL, NULL, '185.18.109.130', 1504622460, 1504622460, 0, 1504622472),
(40, 'y.gorbachev', 'y.gorbachev@homeme.ru', '$2y$12$wfzQiDiWecM5GVglVGs.6OTzlEQwSZsf0X/M85ltZrKmhwWrQEfpO', 'hTe8FuL2w3mcIB27EIBsMXvWn6khu3eK', NULL, NULL, NULL, '212.248.126.194', 1504792774, 1504792774, 0, NULL),
(41, 'kvonosan', 'kvonosan@rambler.ru', '$2y$12$YWfcSdJdE2qAuVfSmI3ZUOzJmgJRvXtpVEG9ZJO6BqWFe91kXe1m2', '9B--D1xlFVIYC2fEZboHi732iI--iLx_', NULL, NULL, NULL, '37.205.48.116', 1505451503, 1505451503, 0, 1534705043),
(42, '123123', '123@123123.ru', '$2y$12$1OdPO/Ra0gHKtr7G8DbFP.loh0J5v.D3eCBNZLeEXsABSF.3tQcy.', 'emnCVxQqaUduTKm32Q6x0ZwGsbD-621P', NULL, NULL, NULL, '31.173.82.14', 1505916446, 1505916446, 0, 1505916456),
(43, 'AndryFluok', 'pooc@2.zzuma.ru', '$2y$12$qBrc1.tYG/dAfAhAPvX4aOOXH3hpAZoeN7sFPPcrIPEGCQm//81cG', 'uyTGc7HUKDNlw10o71ivcwadSCStnmxo', NULL, NULL, NULL, '37.147.108.24', 1515364343, 1515364343, 0, NULL),
(44, 'DwightZet', 'dina.progina@mail.ru', '$2y$12$KxIpg./Aepwj4x78rgqRku1j9XJC3MP0iLYDjywk1cIi/PFVMccSO', '88VCjkcDciXGthmKANTUtsZsxPk7Atfm', NULL, NULL, NULL, '188.165.4.128', 1522545875, 1522545875, 0, 1524080300),
(45, 'JanSLidA', 'buxvalov2019@mail.ru', '$2y$12$k0UrOBKE6TwW3lm1zD4XcujBhtwf5w.mZylP4kNxwkG0v5ahyJzb.', 'CyrmGpy-f4dh0fUvuAzR0qxWu8xcXgFj', NULL, NULL, NULL, '46.161.9.39', 1525084726, 1525084726, 0, NULL),
(46, 'Warnerjed', 'kirya.color.pristavkin@mail.ru', '$2y$12$Jd.TIgjsLk.NESdqIWXD0uxSK8ykkQUQ5jKVXUncHBzbfth5D14VO', 'Z0F29FxNioQqp5uWPAmSr-D-uZiHEyJc', NULL, NULL, NULL, '46.161.9.39', 1525123468, 1525123468, 0, 1525865950),
(47, 'DonaldNer', 'sarra.dorodnikova@mail.ru', '$2y$12$H5Y27uapYE1FkHwTFCdkCeSG9nNVQAiFpAmEXmUx0eKcwxB0u3WV2', 'jCPimzSuD-V90SEpmeikKTHaZ9_20luZ', NULL, NULL, NULL, '46.161.9.39', 1525404593, 1525404593, 0, NULL),
(48, 'DanielWEX', 'alkakPeeplemuBnut@grek1.ru', '$2y$12$5WfO9711nm3pT3zS.1VlMedIRx1UgO.NYfCu01UUcAghnYdZL45vG', 'vRAhXbCExY7P_qJAANH9MGdvdG60RIDC', NULL, NULL, NULL, '188.165.4.128', 1525796285, 1525796285, 0, 1525796303),
(49, 'taxi-vovrema.info', 'arni799@interia.pl', '$2y$12$o6a64aVu1gJ7CTjHZ8BXo.IdGj2ZxBTLSbnyKOfL4rystE2D.YlyS', 'IapVJ5a1qMxz7qlC2PJizQoJEwLx23bs', NULL, NULL, NULL, '176.31.9.175', 1525899025, 1525899025, 0, NULL),
(50, 'mebel_caw', 'kaki.jm@orange.fr', '$2y$12$wEqqdOwz5xDI6r8tiA2wj.kUovvUHA.BiqGvhak46cXon9l2JaP.C', 'oVVqf90LFbBRHa8-ooSqiUji9tkAyqRQ', NULL, NULL, NULL, '176.31.208.220', 1525925367, 1525925367, 0, NULL),
(51, 'WalterBuire', 'nikolaj.takoev.89@mail.ru', '$2y$12$n4iR1hn.2Zjqv0/tFD6OF.SVzA644jl59vh8cUW8YH8yhOZUlWSYm', 'O-KJkfiyJxYvlKs7AGy078XtoZ8TxChj', NULL, NULL, NULL, '46.161.9.39', 1525931813, 1525931813, 0, NULL),
(52, 'WilliamGrert', 'poluektova.anelya@mail.ru', '$2y$12$/GorUnN8m2dZevJtlH729.uSBAQI.7kROAQj9BuyCpTdxRwLMcwmm', 'WvNHOvj3wmDCE8JJuKas-moFyQ5Wd8nv', NULL, NULL, NULL, '46.161.9.39', 1526027321, 1526027321, 0, NULL),
(53, 'Caseylib', 'osztengemhol@freemail.hu', '$2y$12$QU.qEjnjq6BkmZsC5wstIORxL1YfkQpGqiGYiMOYldaVjoseV1Wcy', '7d1yqNsiQ8SShCGMZ4ewHnU1X1wYZ-Tv', NULL, NULL, NULL, '176.31.208.220', 1526061052, 1526061052, 0, NULL),
(54, 'gepatitu-c.net', 'stefano_loreto@virgilio.it', '$2y$12$7QzUEiYdHDJZNAEm5pecnulXLNeg8fMbIoXpdnjLwjTIs5RJUREqi', '3WnSD0_hGnUNOuykGmg1M06hWyxkAHxQ', NULL, NULL, NULL, '176.31.9.175', 1526074545, 1526074545, 0, NULL),
(55, 'Lincolnbiz', 'serafima.pobedonosceva.76@mail.ru', '$2y$12$tJZ8kKbE6ytdQWkhgg/.vOhk3zAc.v5WyA0.SD4BmpaA7R0WH2vUi', 'Vb0grmS1eiZvS86-inDDwpTyLpgWMpH3', NULL, NULL, NULL, '46.161.9.39', 1526346817, 1526346817, 0, NULL),
(56, 'MichaelVenny', 'taira.waistcoat.gorshechnikova@mail.ru', '$2y$12$81I/TB8GLRJg/dbcZUX.5uFY5lEmGq9aA/9vfdYExvc80RDVsgBW6', '3VjR51x02-FaFxPpZY6RLjTyplRsmZDI', NULL, NULL, NULL, '46.161.9.39', 1526453883, 1526453883, 0, NULL),
(57, 'Davidgob', 'semisotov.n@mail.ru', '$2y$12$WW/5whpXKdZNlDlG./jxnePujj5Hc2BytlckQjhpjafqE66qVtIsK', 'q4sgrUnvqMgKyjnL0lEshjAAoIBmJ41-', NULL, NULL, NULL, '46.161.9.39', 1526611655, 1526611655, 0, 1541189288),
(58, 'Georgekax', 'vlad.commerce.kutafin@mail.ru', '$2y$12$0nKbOLvhpu5MnpRtfSVyreY04yXDiF3his1yXXbkabrqPuoUgFjtC', 'Ar8MYkXWl20obhRmH2QhLCTB_o9xUT__', NULL, NULL, NULL, '46.161.9.39', 1526975035, 1526975035, 0, NULL),
(59, 'abba-trans.com', 'osteora@ckpiz.info', '$2y$12$JM/k/rIiToqbQ/hq1hF5K.ABcJC7RLEGGLcI7hryo9jisaiCshmIS', 'vJ7uguLyYnQ8HoP8jbM1Ikq1A4O4xP_Y', NULL, NULL, NULL, '188.165.229.75', 1527022179, 1527022179, 0, NULL),
(60, 'Dennisimams', 'l_kalganskaya@mail.ru', '$2y$12$YmeUQOkYTnMWC7H5Twbey.FgRLXXP8UDl66jcgz/pbxlEY7bitEk6', 'VoZQzwtcTR-Hm8Po0q8EBiRtW57YH_co', NULL, NULL, NULL, '46.161.9.39', 1527289494, 1527289494, 0, NULL),
(61, 'Nikitenkokt50', 'zjzggpjof@bloggering.ru', '$2y$12$A0jsZQG7mlhcu3XCWIBINOvZ6WamlMcrG5AvzXUq9f860ZYmfwj8O', '5-WH5stYIngKoeIVG_ptQBWGbKKzMk1R', NULL, NULL, NULL, '80.93.187.57', 1527339448, 1527339448, 0, NULL),
(62, 'Sergeykt48', 'cnycigniy@bloggering.ru', '$2y$12$bGX9Mn/A4.1ap1K9/r21G.tUoTZKKNqX6gaKP1bdZeZlCuKH.3Xsi', '7AXBG9lfSVILSexWuMdFZQRUEbFu5I84', NULL, NULL, NULL, '80.93.187.57', 1527443163, 1527443163, 0, NULL),
(63, 'Andrewtat', 'ostap.promise.meshalkin@mail.ru', '$2y$12$fugsh2bo4208zL.Kk9weyuAM3t0nz09eLpA0Etvc3YYFf.M7.vKb6', 'xTwDeEmdKNtCU74iOVWFytO0f9xmh8lk', NULL, NULL, NULL, '80.93.187.57', 1527527933, 1527527933, 0, 1527658370),
(64, 'Mishakt52', 'zazadwilf@bloggering.ru', '$2y$12$PNfrQSjrWdMU8M44NszmgexIWB99oNcuaw12Zr9ZmHGxsPRLnAaqW', 'HxLVuNeNi5KIJ2Xtk_AzsWFGUTdFq8Sv', NULL, NULL, NULL, '80.93.187.57', 1527563357, 1527563357, 0, NULL),
(65, 'Alexkt44', 'l-vixoreva@mail.ru', '$2y$12$pnubpRYLWbb1c8YyS/RO0OvVKgXtL7/B4KMZCVl8sSI0StlIO8u9W', 'wDbYQ5W3KstozBUENk_VIpdAhNnx5B7s', NULL, NULL, NULL, '80.93.187.57', 1527697402, 1527697402, 0, NULL),
(66, 'CesarRed', 'neverova.faiza@mail.ru', '$2y$12$Q6tP3nnvR5mjm9lgJixTpusY0veLtG7iK28e9J9//oH2ljEyYkMUq', 'UJH3wyfbkrX9guOQU9vVHr9qIsYDuKg1', NULL, NULL, NULL, '10.10.1.1', 1529131340, 1529131340, 0, NULL),
(67, 'Antonovsnm', 'stavskij1979@mail.ru', '$2y$12$n6qHUB3PcirgHCvllca8C.aa.0yE.VpNzH.r3a8r6yHmemIRyIPX2', 'txCxnj783pFp5T83ay63nndoATh8fCfN', NULL, NULL, NULL, '173.249.24.45', 1530114880, 1530114880, 0, NULL),
(68, 'Chaweb-model.info', 'fdiunrelia@web-model.info', '$2y$12$nh2P2VpuLDwss.9j.z7SB.jUX328XT4dgJtx02Iv7FEAkJ2IWNaDC', 'CPEx4n9tg4fsp6dUiSO8b9BpNNwdicaj', NULL, NULL, NULL, '188.165.229.75', 1530239869, 1530239869, 0, NULL),
(69, 'MichaelDip', 'jerry.jerry.75@mail.ru', '$2y$12$d/iB9Gy/UPCsvYEqjPh37e.xVCZBoX7.Li8Ois2oAiE5yzidFtOtm', 'kHHmvoz1dPUEG-6VJGbEmHBwO4_DgzTv', NULL, NULL, NULL, '173.249.24.45', 1530247039, 1530247039, 0, 1530247040),
(70, 'Kovalenkokt46', 'volodixina.agata@mail.ru', '$2y$12$v/nGi3SOhIZV4GVryexj.e/eWv4fYco73P7i.x6guPAZX4b8Giy/a', '6sEPhIDFvy7Owh3N7Val3oKflQNodXwi', NULL, NULL, NULL, '173.249.24.45', 1530666528, 1530666528, 0, NULL),
(71, 'Jasonfrons', 'y_dolbilov@mail.ru', '$2y$12$Rm/OH/kNsdaClR3tCI22quNNGwv0vPd6.IID5cKRBNtH1cTHrdfK.', 'fBHwtBDT1_OLhlq-khNEDU_1cQIAQRcM', NULL, NULL, NULL, '173.249.24.45', 1530828481, 1530828481, 0, 1532860984),
(72, 'RosaliaHype', 'RosaliaHype@x5tjmrzx.xzzy.info', '$2y$12$zZzIKz1X.BweonG5TDTl1O3R0qwlPE/iOPbo6W3WOZpqZtdaBEB.u', 'kVVjUQqdlzJbb-ZYU96gQeBIO8HI4Xzd', NULL, NULL, NULL, '188.72.96.12', 1530957690, 1530957690, 0, NULL),
(73, 'ElmerGaf', 'robins.robins@mail.ru', '$2y$12$6zWAfL6sF7CoZAQcX3GxJeNrWqr8pXtvgXzjZiR6l7T4Dm8cF5ME.', 'qmVHK_ikJT3qLx4nfKrXgP9oOc52D7C9', NULL, NULL, NULL, '178.238.233.160', 1532032555, 1532032555, 0, 1532178563),
(74, 'WilliamSause', 'anna_popova1969@mail.ru', '$2y$12$IKmOsbFVGwHl.klopiUa3u6YDZszvIF5t0lAOEUx76BFkwduyYeDu', 'GDsnBSM6sA1HvkUhavmpn4UMgNW3TBPy', NULL, NULL, NULL, '173.249.24.45', 1533130303, 1533130303, 0, 1539861715),
(75, 'Brianswame', 'xariton.petrov.75@mail.ru', '$2y$12$Om.2EX/AOduq/HqSFzOZ3.rYkgJoVdxg0UAnwvNsmEpffcP3CGCqC', '9n0dZ8DxLt0OKUpE-tMO7pFMHpvQDJBO', NULL, NULL, NULL, '173.249.24.45', 1533829657, 1533829657, 0, 1535099270),
(76, 'Arthurdus', 'sergei.popov8080@mail.ru', '$2y$12$KBgo/93u93McSHxvhPa6FuHPSGmYwsiIXHgED7sm4ft8gOgcCufFO', 'i2hZR_v3VndUvggzjb40BXY76VVxr90C', NULL, NULL, NULL, '5.188.210.44', 1534783469, 1534783469, 0, 1534783471),
(77, 'EmilyMensink', 'vicewerty265@gmail.com', '$2y$12$QzXxZp30QuO7568omy534.miQM5C.Tsr0iAPiukvivSn/6vW.N0EG', '5OIbZQ8792v9auCiKQi-1v_nCaZJ5T8v', NULL, NULL, NULL, '185.232.21.117', 1534975872, 1534975872, 0, NULL),
(78, 'DonaldPrake', 'kokokokokoko.2018@mail.ru', '$2y$12$vrBXtR4CpUDShSayx7fESus/FKEcnqfIYgsIF.vHlxEphcc5zYcfm', 'MIIUM0eJRYhhtrigDj4UxyJSuL2ymO1U', NULL, NULL, NULL, '5.188.210.44', 1535724769, 1535724769, 0, 1536121078),
(79, 'IvanTuh', 'vanechka.somov.1999@mail.ru', '$2y$12$DrqpRbRtZreErYYXL.GuFOQ5UOlkhWFbh1Ol8NHlOU7uKJGpuTprC', '_PpAHEpYO6NUyTaQfLzqS0NwQRbwthCg', NULL, NULL, NULL, '5.188.210.53', 1539011031, 1539011031, 0, 1539011043),
(80, 'MatthewBat', 'kralupysomov@mail.ru', '$2y$12$xD6hPQ01ZdKYAafky.TqrOUo.B04IpLnV0t/ThSj4GzFV4LyvIvSK', 'Cugd-UxxgjCP-M4bcyvkrT1SGnCS9t40', NULL, NULL, NULL, '5.188.210.44', 1540651775, 1540651775, 0, 1540651788),
(81, 'MichaelHar', 'sergejzho88@mail.ru', '$2y$12$OeDCYwyeef1Ht6mdHPUue.8SsSNrLtRnoCay/LwXnsP/5eg0sn4jW', 'xRRi6hwwu2BG_xx2--T8ak5IWh-PBxH9', NULL, NULL, NULL, '5.188.210.51', 1540680970, 1540680970, 0, 1540680976),
(82, 'Jamesanget', 'ghjrte@mail.ru', '$2y$12$JJvd8w23zbNtoc3Wx/9mr.gmX4A7QTFmvMD.bX9zeWrPT1.M6nsS2', 'HEGwxThW0FOdH42bAmwWUqZQcwIUbWBz', NULL, NULL, NULL, '95.152.7.153', 1541091257, 1541091257, 0, 1541091261),
(83, 'volchicca', 'derevjagina@mail.ru', '$2y$12$qupUOWcL6INkU9Z63SaE/O7ZU76GIDv1jbhfPBbhMb1WG/gtf205y', 'r3MoKdxR6Zlit1_puk1IVXZc4JUviDF6', NULL, NULL, NULL, '77.222.100.94', 1541922400, 1541922400, 0, NULL),
(84, 'kolyasEffow', 'katewzx@gmail.com', '$2y$12$FzwWmsWPQP0ZgKszIk0/muGY4y3J0aOVEeUqM5Dca7nl3Mzmt/PNK', 'ArOeyP0VDditk6vdoDn5Vb1cyLsmw4jS', NULL, NULL, NULL, '46.151.43.80', 1543344691, 1543344691, 0, NULL),
(85, 'AndreyHar', 'kira.svetlova.1976@mail.ru', '$2y$12$kxIGJOAFAlAASrYCq1GEuujNjfdatTfx0FWIL29smiU/O./wzCbKm', 'YYyGiZASqVYi47OKQxqQKFwi33lEZ8ES', NULL, NULL, NULL, '5.188.210.53', 1543814799, 1543814799, 0, 1544417312),
(86, 'megafon-015l', 'shamrykenkokatya@gmail.com', '$2y$12$D4UUXhTvrjemn2k5xPJO5OsEQvpreywpmhDN9fL0JpiQjnfFd21VO', 'Lg4_ebrkH2mWc5GvPfxrUPeXABrJOh7D', NULL, NULL, NULL, '176.36.21.189', 1547726526, 1547726526, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_content`
--

CREATE TABLE `user_content` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `published` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_content`
--

INSERT INTO `user_content` (`id`, `user_id`, `post_id`, `published`) VALUES
(1, 38, 607979, 0),
(2, 38, 609072, 0),
(3, 38, 609631, 0),
(4, 38, 609450, 0),
(5, 38, 608062, 0),
(6, 38, 608790, 0),
(7, 38, 609630, 0),
(8, 38, 608355, 0),
(9, 38, 609071, 0),
(10, 38, 608238, 0),
(11, 38, 608875, 0),
(12, 38, 609352, 0),
(13, 38, 609845, 0),
(14, 38, 610137, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attachments_vk`
--
ALTER TABLE `attachments_vk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`vk_id`);

--
-- Индексы таблицы `buffer`
--
ALTER TABLE `buffer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `groups_and_users`
--
ALTER TABLE `groups_and_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `posts_vk`
--
ALTER TABLE `posts_vk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vk_id` (`vk_id`,`date`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Индексы таблицы `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- Индексы таблицы `user_content`
--
ALTER TABLE `user_content`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `attachments_vk`
--
ALTER TABLE `attachments_vk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `buffer`
--
ALTER TABLE `buffer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT для таблицы `groups_and_users`
--
ALTER TABLE `groups_and_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `posts_vk`
--
ALTER TABLE `posts_vk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT для таблицы `user_content`
--
ALTER TABLE `user_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
