# SberSlovo Тестовое задание

Это тестовое задание от компании Сбер, подразделения СберСлово.

## Ресурсы

- [Макет](https://www.figma.com/file/LExydEqJS6Pp9YjWBg0ofL/%5BWeb%5D-%D0%9E%D0%BD%D0%BB%D0%B0%D0%B9%D0%BD-%D0%9F%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D1%8C?node-id=296%3A17155&t=C1vj0G0UfiVh9ka5-1)
- [API](https://sberslovo.ru/api/docs)
- [Web App](https://sberslovo.ru/wa/#/sign_in)

## Описание
Реализовать на Flutter экраны “Проверка подписи”, выложить код на Github. Выложить приложение на любой хостинг для тестирования. 

# Структура проекта
## Базовое описание

Здесь мы используем [трехуровневую архитектуру](https://ru.wikipedia.org/wiki/%D0%A2%D1%80%D1%91%D1%85%D1%83%D1%80%D0%BE%D0%B2%D0%BD%D0%B5%D0%B2%D0%B0%D1%8F_%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0) для простоты и читаемости кода. Она состоит в своей основе из слоя представления (клиента), слоя логики и слоя данных.

**Слой клиента** и **слой логики** всегда связан одинм экраном и построен по парадигме [микросервисной архитектруы](https://ru.wikipedia.org/wiki/%D0%9C%D0%B8%D0%BA%D1%80%D0%BE%D1%81%D0%B5%D1%80%D0%B2%D0%B8%D1%81%D0%BD%D0%B0%D1%8F_%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0), основной целью которой является простота добавление, удаления и изменения экрана и логики.

Сам экран и логика разделены на основе здравого смысла (что-то похожее на MVVC). Чтобы добавить гибкости мы используем такое разделение визуальной части от логики. Так мы можем изменить визуальную часть и не изменить логики работы приложения. И наоборот -- если мы поменяем логику, визуальное представление не изменится. Еще лучше было бы добавить интерфейсты для работы UI с слоем логики, чтобы при изменении логики не менялся UI.

**Слой данных** может как относиться только к данному экрану, так и быть разбит на логические подтемы. В данном случае у нас один метод используется для одного экрана. Если появится другой экран с необходимостью  использовать этот метод -- вынесем его в общую папку.

Слой данных в свою очередь использует **сетевой слой** -- утилиту, позволяющую отдавать запросы в сеть и работать с ошибками.

## Описание компонент

Согласно макетам были сделаны текстовые классы, цвета и компоненты, которые возможно переиспользовать. Svg файлы иконок хранятся в папке `/assets/`. 

## Остальное

У нас так же есть в проекте папка `/tools/` и `/configs/`, которые позволяют нам хранить классы, используемые для упрощения работы, хранения статичных данных и т.д.

## State management

Для state management'а используется пакет [`GetX`](https://pub.dev/packages/get). На его основе создается GetPage, GetController и GetBinding, который связывает два предыдущих класса. Для возможности работы с экраном необходимо добавить его в файл `main.dart`, в `GetPages`.
Другими возможными вариантами молги бы быть [`BLoC`](https://pub.dev/packages/flutter_bloc)или [`Provider`](https://pub.dev/packages/provider)

## Route management

Для route management'а также используется [`GetX`](https://pub.dev/packages/get). Выбор сделан из соображений скорости, чистоты кода и простоты.

Для перехода на другую старицу просто используется `Get.toNamed(Routes.home)`. ВАЖНО: `Routes.home` должны быть реализованы в `main.dart` файле в виде словаря (связи между скрокой / путем и страницей)

## Tests

Тесты на данный момент не написаны полностью. К сожалению, их писать оказалось дольше, чем ожидалось. 

## Build and deploy

Я для сборки использовал `flutter build web`, после чего создал проект `Firebase` и там настроил хостинг. После чего в самом терминале выполнил необходимые пиготовления, настройки и нажал `firebase deploy`
Более подробно в этом [видео](https://youtu.be/sgW_M3gfLvs)
