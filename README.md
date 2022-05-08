# DB_Project
Project for DataBase coure at MIPT

## Презентация
[Ссылка на презентацию](https://www.canva.com/design/DAE9oi53d4U/M6QDC1Ljc-5FoEFnOpiimA/view?utm_content=DAE9oi53d4U&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

## Введение
Семестровый проект по курсу Базы Данных.

## Постановка задачи
Нужно написать базу данных для администрирования отелей с применением *Postgresql*. Также можно использовать NOSQL технологии - *JSON*.

## Актуальность
Поскольку отели - это неотъемлимая часть жизни любого туриста, то проблема хранения данных для этой сферы очень акутально. Поскольку сегодня крупные компании владеют сразу несколькими отелями в популярных туристических городах, пример такой базы данных сможет полность показать все внутринее взаимодействие. 

## Что уже реализованно?
1) *Выбрана тема:* **База данных администрирования отелей**
2) *Спроектирована БД:*
  а)**Спроектирована концпетуальная модель**
  b)**Спроектирована Логическая модель**
  c)**Спроектирована Физическая модель**
3) *Подготовить DDL скрипты и создать свою базу в СУБД.*
4) *Наполнить созданную базу данными, ~10 записей в каждой таблице.*
5) *Написать не менее 10 INSERT, SELECT, UPDATE, DELETE запросов. Загуглить, что такое CRUD-запросы. Найти соответствие.*
6) *Написать правильные и нетривиальные SELECT запросы*

## Что осталось реализовать?
1) *Создать индексы для таблиц, аргументировав выбор поля, по которому будет создан индекс.*
2) *Подготовить представления*
3) *Создать процедуры*
4) *Создать триггеры*

## Концептуальная модель
![Alt text](diagramms/hotel_concept.jpg?raw=true "Concept")

### Описание отношений
1) *Отель - Заказы*: один ко многим включая один. Поскольку у отеля может быть много заказов, а один заказ привязан к конкретному отелю, то тут все понятно.
2) *Отель - Работник*: один ко многим включая один. Аналогично с заказами.
3) *Работник - Заказ*: один ко многим включая ноль. Поскольку у работника может как и не быть заказов, так и быть их несколько, в то время как заказ привязывается к определенному работнику.
4) *Апартаменты - Заказ*: многие включая один к одному. Поскольку в заказе можно указать несколько апартаментов, а конкертный апартамент привязан к заказу.
5) *Постоялец - Заказ*: один ко многим включая один. Аналогично с работником, только в данном случае, постоялец не может не сделать заказа
6) *Постоялец - Бронирование Заказа*: один ко многим включая один. Поскольку постоялец может бронировать несколько заказов.
7) *Бронирование Заказа - Заказ*: один к одному. Так как заказ можно забранировать только одним человеком.
8) *Бронирование Заказа - Оплата Заказа*: один к одному. Так как заказ забранированный заказ можно оплатить только один раз.

## Логическая модель
![Alt text](diagramms/log_diag_hotel.jpg?raw=true "Logic")

## Физическая модель
**Order Заказ**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
ID_client  | Индентификатор постояльца | INT | NOT NULL|
ID_employee |Индентификатор сотрудника  | INT | NOT NULL|
ID_hotel |Идентификатор отеля  | INT | NOT NULL|

**Hotel Отель**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_hotel |Идентификатор отеля  | INT | NOT NULL|
hotel_name | Навзание отеля  | VARCHAR(200) | NOT NULL|
hotel_company  | Компния владеющая отелем | VARCHAR(200) | NOT NULL|

**Client Постоялец**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_client  | Индентификатор постояльца | INT | NOT NULL|
client_firstname | Имя постояльца  | VARCHAR(50) | NOT NULL|
client_lastname | Фамилия постояльца  | VARCHAR(50) | NOT NULL|
client_mobile_phone | Номер моибльного телефона постояльца | VARCHAR(12) | NOT NULL|
client_passport | Номер пасспорта постояльца | VARCHAR(30) | NOT NULL|
client_email | Электронная почта постояльца | VARCHAR(200) | |
client_card_number | Кредитная карта постояльца(Для оплаты) | VARCHAR(50) | NOT NULL|
client_birthday | Дата рождения постояльца | DATE | NOT NULL|

**Employee Работник**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_employee | Индентификатор работника | INT | NOT NULL|
employee_firstname | Имя работника  | VARCHAR(50) | NOT NULL|
employee_lastname | Фамилия работника  | VARCHAR(50) | NOT NULL|
employee_mobile_phone | Номер моибльного телефона работника | VARCHAR(12) | NOT NULL|
employee_passport | Номер пасспорта работника | VARCHAR(30) | NOT NULL|
employee_email | Электронная почта работника | VARCHAR(200) | |
employee_salary | Зарплата работника | DECIMAL | NOT NULL|
employee_birthday | Дата рождения работника | DATE | NOT NULL|

**OrderDetails Детали Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
ID_apartment |Индентификатор апартоментов | INT | NOT NULL|
order_details_arrival_time | Время прибытия в отель | TIMESTAMP | NOT NULL|
order_details_departure_time | Когда отель был покинут | TIMESTAMP | NOT NULL|
order_details_total_price | Общая стоимость заказа | DECIMAL | NOT NULL|
order_details_price | Стоимость заказа | DECIMAL | NOT NULL|
order_details_surcharge | Стоимость доплаты | DECIMAL | DEFAULT 0|
order_details_people_amount | Коилчество людей проживающих в номере | INT | NOT NULL|
order_details_status | Статус заказа | BOOLEAN | NOT NULL|

**BookOrder Бронирование Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_booked_order |Индентификатор забранированного заказа  |  INT | NOT NULL|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
booked_order_is_booked  | Забронирован ли заказ | BOOLEAN | NOT NULL|
booked_order_is_canceled  | Отменен ли заказ | BOOLEAN | NOT NULL|
booked_order_status  | Статус бронирования заказа | BOOLEAN | NOT NULL|

**PayForOrder Оплата Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_pay_for_order | Индентификатор оплаченного заказа | INT | NOT NULL|
ID_booked_order | Индентификатор забранированного заказа  |  INT | NOT NULL|
pay_for_order_is_paid | Оплачен ли был заказ  | BOOLEAN | NOT NULL|
pay_for_order_is_received | Дошла ли оплата  | BOOLEAN | NOT NULL|
pay_for_order_paid_sum  | Какая сумма была оплачена | DECIMAL | NOT NULL|
pay_for_order_remaining_sum  | Какую сумму осталось заплатить | DECIMAL | NOT NULL|
pay_for_order_payment_method  | Способ оплаты | VARCHAR(20) | |
pay_for_order_payment_count  |  Количество произведенных оплат | INT | NOT NULL|

**Apartment Апартаменты**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_apartment |Индентификатор апартоментов | INT | NOT NULL|
apartment_room_amount | Количество комнат в апартаментах  | INT | |
apartment_number | Номер апартаментов | INT | NOT NULL|
apartment_class | Класс апартаментов | VARCHAR(50) | NOT NULL|
apartment_is_available  | Доступны ли апартаменты | BOOlEAN | NOT NULL|
