--DROP VIEW CLIENT_VIEW
--1
--Таблица представления клиентов и детали их заказов
CREATE VIEW CLIENT_ORDER_VIEW
AS
    SELECT DISTINCT
        c.id_client,
        c.client_lastname,
        c.client_firstname,
        c.client_birthday,
        CONCAT(SUBstr(c.client_card_number, 1, 4),'********',SUBstr(c.client_card_number, 13, 4)) AS card_number,
        c.client_email,
        c.client_mobile_phone,
        CONCAT(SUBSTR(c.client_passport,1,5),'*******************',SUBSTR(c.client_passport,25,5)) AS passport,
        ord.id_order,
        ord.id_employee,
        odet.id_order_details,
        odet.id_apartment,
        odet.order_details_arrival_time,
        odet.order_details_departure_time,
        odet.order_details_surcharge,
        odet.order_details_people_amount,
        odet.order_details_is_running,
        odet.order_details_prolong_count
    FROM
        hotel.client AS c,
        hotel."order" AS ord
    INNER JOIN hotel.orderdetails AS odet ON odet.id_client = ord.id_client AND odet.id_order = ord.id_order;

SELECT * FROM CLIENT_ORDER_VIEW;

--2
--Таблица представления клиентов и их апартаментов
CREATE VIEW CLIENT_APARTMENT_VIEW
AS
    SELECT DISTINCT
        c.id_client,
        c.client_lastname,
        c.client_firstname,
        c.client_birthday,
        CONCAT(SUBstr(c.client_card_number, 1, 4),'********',SUBstr(c.client_card_number, 13, 4)) AS card_number,
        c.client_email,
        c.client_mobile_phone,
        CONCAT(SUBSTR(c.client_passport,1,5),'*******************',SUBSTR(c.client_passport,25,5)) AS passport,
        ap.id_apartment,
        ap.apartment_capacity,
        ap.apartment_number,
        ap.apartment_class,
        ap.apartment_price_for_night,
        ap.apartment_is_available
    FROM
        hotel.client AS c,
        hotel."order" AS ord
    INNER JOIN hotel.orderdetails AS odet ON odet.id_client = ord.id_client AND odet.id_order = ord.id_order
    INNER JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment;

SELECT * FROM CLIENT_APARTMENT_VIEW;

--3
--Таблица представлений сотрудников и какие аппартаменты они обслуживают
--DROP VIEW EMPLOY_APARTMENT_VIEW;
CREATE VIEW EMPLOY_APARTMENT_VIEW
AS
    SELECT DISTINCT
        e.id_employee,
        e.employee_firstname,
        e.employee_lastname,
        e.employee_mobile_phone,
        CONCAT(SUBSTR(e.employee_passport,1,5),'*******************',SUBSTR(e.employee_passport,25,5)) AS passport,
        e.employee_email,
        e.employee_salary,
        e.employee_birthday,
        ap.id_apartment,
        ap.apartment_capacity,
        ap.apartment_number,
        ap.apartment_class,
        ap.apartment_price_for_night,
        ap.apartment_is_available
    FROM
        hotel.employee AS e,
        hotel."order" AS ord
    INNER JOIN
        hotel.orderdetails AS odet ON ord.id_order = odet.id_order
    INNER JOIN
        hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
    WHERE e.id_employee = ord.id_employee;

SELECT * FROM EMPLOY_APARTMENT_VIEW;

--4
--Таблица представления клиентов и какие заказы за ними забронированы
CREATE VIEW EMPLOY_APARTMENT_VIEW
AS
    SELECT DISTINCT
        c.id_client,
        c.client_lastname,
        c.client_firstname,
        c.client_birthday,
        CONCAT(SUBstr(c.client_card_number, 1, 4),'********',SUBstr(c.client_card_number, 13, 4)) AS card_number,
        c.client_email,
        c.client_mobile_phone,
        CONCAT(SUBSTR(c.client_passport,1,5),'*******************',SUBSTR(c.client_passport,25,5)) AS passport,
        bord.id_booked_order,
        bord.id_order,
        bord.booked_order_is_booked,
        bord.booked_order_is_canceled,
        bord.booked_order_status
    FROM
        hotel.client AS c,
        hotel."order" AS ord
    INNER JOIN
        hotel.bookorder AS bord ON bord.id_order = ord.id_order AND bord.id_client = ord.id_client;

--5
--Таблица представления клиентов
CREATE VIEW CLIENT_VIEW
AS
    SELECT DISTINCT
        c.id_client,
        c.client_lastname,
        c.client_firstname,
        c.client_birthday,
        CONCAT(SUBstr(c.client_card_number, 1, 4),'********',SUBstr(c.client_card_number, 13, 4)) AS card_number,
        c.client_email,
        c.client_mobile_phone,
        CONCAT(SUBSTR(c.client_passport,1,5),'*******************',SUBSTR(c.client_passport,25,5)) AS passport
    FROM
        hotel.client AS c;
--6
--Таблица представления сотрудников
CREATE VIEW EMPLOY_APARTMENT_VIEW
AS
    SELECT DISTINCT
        e.id_employee,
        e.employee_firstname,
        e.employee_lastname,
        e.employee_mobile_phone,
        CONCAT(SUBSTR(e.employee_passport,1,5),'*******************',SUBSTR(e.employee_passport,25,5)) AS passport,
        e.employee_email,
        e.employee_salary,
        e.employee_birthday
    FROM
        hotel.employee AS e;
--
