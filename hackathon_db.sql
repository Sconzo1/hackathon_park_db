-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 26 2020 г., 20:23
-- Версия сервера: 10.4.13-MariaDB
-- Версия PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hackathon_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attractions`
--

CREATE TABLE `attractions` (
  `id_att` int(10) UNSIGNED NOT NULL,
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `id_model` int(11) UNSIGNED NOT NULL,
  `comm_date` date NOT NULL,
  `reg_date` date NOT NULL,
  `reg_period_month` smallint(6) NOT NULL,
  `resp` text NOT NULL,
  `id_state` tinyint(4) NOT NULL,
  `description` text NOT NULL,
  `restriction` text NOT NULL,
  `safety` text NOT NULL,
  `work_from` time NOT NULL,
  `work_to` time NOT NULL,
  `price_ch` decimal(8,2) NOT NULL,
  `price_ad` decimal(8,2) NOT NULL,
  `facilities` text NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `directors`
--

CREATE TABLE `directors` (
  `login` varchar(20) NOT NULL,
  `enc_pass` text NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `directors`
--

INSERT INTO `directors` (`login`, `enc_pass`, `name`, `surname`, `id_park`, `token`) VALUES
('Maloxolka', '$2y$14$7Rj0PQnYh4QS9w4NV8I0CecSB0qYf1DlCgDe1VauBzbMOSPRUyNn6', 'Danil', 'Senchin', 0, 'c715d40744');

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `id_gender` tinyint(3) UNSIGNED NOT NULL,
  `gender_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`id_gender`, `gender_name`) VALUES
(1, 'male');

-- --------------------------------------------------------

--
-- Структура таблицы `initiatives`
--

CREATE TABLE `initiatives` (
  `id_init` int(10) UNSIGNED NOT NULL,
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `header` int(11) NOT NULL,
  `text` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `marital_states`
--

CREATE TABLE `marital_states` (
  `id_m_status` tinyint(3) UNSIGNED NOT NULL,
  `status_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `marital_states`
--

INSERT INTO `marital_states` (`id_m_status`, `status_name`) VALUES
(1, 'not maried');

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `id_model` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id_new` int(11) UNSIGNED NOT NULL,
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id_new`, `id_park`, `text`, `date`) VALUES
(1, 0, 'test1', '2020-09-27 00:59:31'),
(2, 0, 'test2', '2020-09-27 00:59:40'),
(3, 0, 'test3', '2020-09-27 00:59:47');

-- --------------------------------------------------------

--
-- Структура таблицы `offers`
--

CREATE TABLE `offers` (
  `id_offer` int(10) UNSIGNED NOT NULL,
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `header` text NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `parks`
--

CREATE TABLE `parks` (
  `id_park` tinyint(3) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `adress` text NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `url_site` text NOT NULL,
  `url_map` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `parks`
--

INSERT INTO `parks` (`id_park`, `name`, `adress`, `latitude`, `longitude`, `url_site`, `url_map`) VALUES
(0, 'Горького', 'парк Горького', '9.999999', '9.999999', 'test', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `specials`
--

CREATE TABLE `specials` (
  `id_spec` int(10) UNSIGNED NOT NULL,
  `id_att` int(11) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `work_from` time NOT NULL DEFAULT '00:00:00',
  `work_to` time NOT NULL DEFAULT '23:59:59',
  `value` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `states`
--

CREATE TABLE `states` (
  `id_state` tinyint(4) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(8) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `email` text NOT NULL,
  `enc_pass` text NOT NULL,
  `birth_date` date NOT NULL,
  `id_m_status` tinyint(4) UNSIGNED NOT NULL,
  `children` tinyint(1) NOT NULL,
  `id_gender` tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `name`, `surname`, `email`, `enc_pass`, `birth_date`, `id_m_status`, `children`, `id_gender`) VALUES
(00000002, 'Danil', 'Senchin', 'se-dan2000@yandex.ru', 'jjj', '2000-09-19', 1, 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attractions`
--
ALTER TABLE `attractions`
  ADD PRIMARY KEY (`id_att`),
  ADD KEY `id_model` (`id_model`),
  ADD KEY `id_park` (`id_park`),
  ADD KEY `id_state` (`id_state`);

--
-- Индексы таблицы `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`login`),
  ADD KEY `id_park` (`id_park`);

--
-- Индексы таблицы `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id_gender`);

--
-- Индексы таблицы `initiatives`
--
ALTER TABLE `initiatives`
  ADD PRIMARY KEY (`id_init`),
  ADD KEY `id_park` (`id_park`);

--
-- Индексы таблицы `marital_states`
--
ALTER TABLE `marital_states`
  ADD PRIMARY KEY (`id_m_status`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id_model`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_new`),
  ADD KEY `id_park` (`id_park`);

--
-- Индексы таблицы `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id_offer`),
  ADD KEY `id_park` (`id_park`);

--
-- Индексы таблицы `parks`
--
ALTER TABLE `parks`
  ADD PRIMARY KEY (`id_park`);

--
-- Индексы таблицы `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`id_spec`),
  ADD KEY `id_att` (`id_att`);

--
-- Индексы таблицы `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id_state`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_m_status` (`id_m_status`),
  ADD KEY `id_gender` (`id_gender`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attractions`
--
ALTER TABLE `attractions`
  MODIFY `id_att` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `id_gender` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `initiatives`
--
ALTER TABLE `initiatives`
  MODIFY `id_init` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `marital_states`
--
ALTER TABLE `marital_states`
  MODIFY `id_m_status` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `id_model` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id_new` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id_offer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `specials`
--
ALTER TABLE `specials`
  MODIFY `id_spec` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attractions`
--
ALTER TABLE `attractions`
  ADD CONSTRAINT `attractions_ibfk_1` FOREIGN KEY (`id_model`) REFERENCES `models` (`id_model`),
  ADD CONSTRAINT `attractions_ibfk_2` FOREIGN KEY (`id_park`) REFERENCES `parks` (`id_park`),
  ADD CONSTRAINT `attractions_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `states` (`id_state`);

--
-- Ограничения внешнего ключа таблицы `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`id_park`) REFERENCES `parks` (`id_park`);

--
-- Ограничения внешнего ключа таблицы `initiatives`
--
ALTER TABLE `initiatives`
  ADD CONSTRAINT `initiatives_ibfk_1` FOREIGN KEY (`id_park`) REFERENCES `parks` (`id_park`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_park`) REFERENCES `parks` (`id_park`);

--
-- Ограничения внешнего ключа таблицы `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`id_park`) REFERENCES `parks` (`id_park`);

--
-- Ограничения внешнего ключа таблицы `specials`
--
ALTER TABLE `specials`
  ADD CONSTRAINT `specials_ibfk_1` FOREIGN KEY (`id_att`) REFERENCES `attractions` (`id_att`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_m_status`) REFERENCES `marital_states` (`id_m_status`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_gender`) REFERENCES `genders` (`id_gender`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
