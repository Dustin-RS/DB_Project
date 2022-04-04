# DB_Project
Project for DataBase coure at MIPT


## Физическая модель
**Order Заказ**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
ID_client  | Индентификатор постояльца | INT | NOT NULL|
ID_employee |Индентификатор сотрудника  | INT | NOT NULL|
ID_hotel |Идентификатор отеля  | INT | NOT NULL|
ID_apartment |Идентификатор апартоментов  | INT | NOT NULL|

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
ID_employee | Индентификатор работника | INT | NOT NULL|
employee_firstname | Имя работника  | VARCHAR(50) | NOT NULL|
employee_lastname | Фамилия работника  | VARCHAR(50) | NOT NULL|
employee_mobile_phone | Номер моибльного телефона работника | VARCHAR(12) | NOT NULL|
employee_passport | Номер пасспорта работника | VARCHAR(30) | NOT NULL|
employee_email | Электронная почта работника | VARCHAR(200) | |
employee_salary | Зарплата работника | DECIMAL | NOT NULL|
employee_birthday | Дата рождения работника | DATE | NOT NULL|

**Order_Details Детали Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
ID_apartment |Индентификатор апартоментов | INT | NOT NULL|
duration_of_residence | Длительность прибывания в отеле | INT | NOT NULL|
price  | Общая стоимость заказа | DECIMAL | NOT NULL|

**Book_Order Бронирование Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_booked_ord |Индентификатор забранированного заказа  |  INT | NOT NULL|
ID_order |Индентификатор заказа  |  INT | NOT NULL|
is_booked  | Забронирован ли заказ | BOOLEAN | NOT NULL|
is_canceld  | Отменен ли заказ | BOOLEAN | NOT NULL|

**Order_Payment Оплата Заказа**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_booked_ord |Индентификатор забранированного заказа  |  INT | NOT NULL|
is_paid | Оплачен ли был заказ  | BOOLEAN | NOT NULL|
paid_sum  | Какая сумма была оплачена | DECIMAL | NOT NULL|
payment_method  | Способ оплаты | VARCHAR(20) | NOT NULL|

**Apartment Апартаменты**
Название |Описание | Тип данных | Ограничение|
------ | ------|------|------|
ID_apartment |Индентификатор апартоментов | INT | NOT NULL|
room_amount | Количество комнат в апартаментах  | INT | |
apartment_number | Номер апартаментов | INT | NOT NULL|
is_avaliable  | Доступны ли апартаменты | BOOlEAN | NOT NULL|
