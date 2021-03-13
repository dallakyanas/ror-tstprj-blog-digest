# Тестовый проект. Блог с подпиской на рассылку

Рекомендуемые редакторы: Sublime Text, VS Code, Atom

https://www.railstutorial.org/book Книга по Рельсам. Можно прочитать главы 1-2 и главу про тестирование.

Установка рельсов на винду через подcистему: https://gorails.com/setup/windows/10. Если не 10-ая, то http://railsinstaller.org/ru-RU версия руби 2.3

Тестовое задание:
Разработать функционал рассылки и блога:

1. Создать базовую модель новостей (можно простым методом scaffold), записи которой необходимо рассылать – ежедневно и еженедельно в форме дайджеста.
2. Создать на базе гема Девайс (Devise) модель пользователей с авторизацией.
3. Функционал.
   1. Добавить пользователям настройку получения дайджеста ежедневного, еженедельного или отказ.
   2. По умолчанию при создании всех пользователей включать в рассылку еженедельного дайжеста
   3. Желательно написать один любой тест
   4. Рассылка должна отправляться независимо от пользователя в 7 часов утра первого дня недели или утром
каждого дня.
   5. перевести фронт часть с ERB на SLIM
   6. весь интерфейс должен быть на русском языке
   7. подключить бутстрап

Выполненная работа будет оцениваться по следующим параметрам:
* Функциональность приложения
* Подход к проектированию приложения и разработке
* Внимание к деталям
* Аккуратный и читабельный код

Код необходимо оформить в репозиторий на GitHub с краткой документацией по запуску

Доработки: Прикрутить ролевую модель(админ, автор, читатель) и комментарии к постам, комментировать могут все, писать посты только авторы. Сам блог и посты должны быть доступны к чтению без авторизации

## Установка

1. Скачать репозиторий
```
$ git clone https://github.com/dallakyanas/ror-tstprj-blog-digest.git
```
2. Выполнить
```
$ rails db:schema:load
```

3. Выполнить
```
$ rails db:seed
```
Создастся суперпользователь super@test.com с паролем "123456" (! сменить после развертывания) и ролевая модель.

4. Запустить сервер
```
$ rails s -e production
```
5. Запустить
```
    (windows)$ bundle exec crono RAILS_ENV=production
    (linux)$ bundle exec crono start RAILS_ENV=production
```

Почтовый мейлер настроен в :test реально письма никуда не отправляются
