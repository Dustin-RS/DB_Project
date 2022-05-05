-- CRUD - запросы

--| Буква | Значение | Соответствие ключевому слову |
--| C     | Create   | Insert                       |
--| R     | Read     | Select                       |
--| U     | Update   | Update                       |
--| D     | Delete   | Delete                       |

--INSERT begin
--1.1
INSERT INTO hotel.client(client_firstname, client_lastname, client_mobile_phone,
                         client_passport, client_email, client_card_number, client_birthday) VALUES
('Damian', 'Komarov', '+79251236431', 'OnGW339r2fbLF7hcNhLDTxMbw1UOyt',
 'ornare.egestas.ligula@google.couk', '4916191820566454', '1983-06-16'),
('Brenden', 'Cooper', '1-143-657-23', 'sjSt98a2llxx2dabWzCxSrgJbHZ6gg',
 'nunc.sed.libero@google.org', '4241670442356426', '1965-09-25');

--1.2
INSERT INTO hotel.employee(employee_firstname, employee_lastname, employee_mobile_phone,
                           employee_passport, employee_email, employee_salary, employee_birthday) VALUES
('Charlotte', 'Hamilton', '+79431236431', 'Oxtw339r2fbLF7hcNhLDTxMbwf2Oyt',
 'convallis.dolor.quisque@protonmail.org', '4916165820566454', '1983-04-16'),
('Sopoline', 'Mcleod', '1-143-645-23', 'sjSt98a2llxty265WzCxSrgJbHZ6gg',
 'vitae.aliquet.nec@protonmail.net', '4241574442356426', '1965-09-27');

--1.3
INSERT INTO hotel.order(id_client, id_employee) VALUES
(12, 7),
(13, 8);

INSERT INTO hotel.orderdetails(id_order, id_apartment, order_details_arrival_time,
                               order_details_departure_time, order_details_total_price, order_details_price, order_details_surcharge,
                               order_details_people_amount, order_details_status) VALUES
(8, 2, '2017-03-24 10:30:20', '2017-04-10 11:30:20', 8000, 8000, 0, 1, true),
(9, 1, '2018-07-23 10:30:20', '2018-07-25 11:30:20', 1500, 1500, 0, 1, true);
--INSERT end

--UPDATE begin
--2.0(Обновления к предущей вставке)
UPDATE hotel.apartment SET apartment_is_available = false WHERE id_apartment = 1;
UPDATE hotel.apartment SET apartment_is_available = false WHERE id_apartment = 2;

--2.1
UPDATE hotel.apartment SET apartment_is_available = true WHERE ID_apartment = 3;

--2.2
UPDATE hotel.bookorder SET booked_order_status = false WHERE id_order = 7;

INSERT INTO hotel.bookorder(id_order, booked_order_is_booked,
                            booked_order_is_canceled, booked_order_status) VALUES
(7, false, false, true);


--2.3
UPDATE hotel.orderdetails SET order_details_status = false WHERE id_order = 9;

INSERT INTO hotel.orderdetails(id_order, id_apartment, order_details_arrival_time,
                               order_details_departure_time, order_details_total_price, order_details_price, order_details_surcharge,
                               order_details_people_amount, order_details_status) VALUES
(9, 1, '2018-07-23 10:30:20', '2018-07-29 11:30:20', 2500, 1500, 1000, 1, true);

--2.4
UPDATE hotel.bookorder SET booked_order_status = false WHERE id_order = 1;

INSERT INTO hotel.bookorder(id_order, booked_order_is_booked,
                            booked_order_is_canceled, booked_order_status) VALUES
(1,false, true, true);
--UPDATE end

--SELECT begin
--Кто где живет
SELECT c.client_firstname, c.client_lastname, ap.apartment_number, ap.apartment_class
FROM hotel.client AS c, hotel.order AS ord
INNER JOIN hotel.orderdetails AS odet ON odet.id_order = ord.id_order
INNER JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
WHERE c.id_client = ord.id_client AND odet.order_details_status = true;

--Кто оплатил заказ
SELECT c.client_firstname, c.client_lastname FROM hotel.client AS c, hotel.order AS ord
INNER JOIN hotel.bookorder AS bord ON bord.id_order = ord.id_order
INNER JOIN hotel.payfororder AS pay ON pay.id_booked_order = bord.id_booked_order
WHERE pay.pay_for_order_is_paid = true AND c.id_client = ord.id_client
AND bord.booked_order_is_booked = true AND bord.booked_order_status = true;
--Кто отменил бронирование
SELECT c.client_firstname, c.client_lastname FROM hotel.client AS c, hotel.order AS ord
INNER JOIN hotel.bookorder AS bord ON bord.id_order = ord.id_order
WHERE bord.booked_order_is_canceled = true AND c.id_client = ord.id_client;

--На сколько дней остановились
SELECT c.client_firstname, c.client_lastname,
       DATE_PART('day', odet.order_details_departure_time::timestamp - odet.order_details_arrival_time::timestamp)
FROM hotel.client AS c, hotel.order AS ord
INNER JOIN hotel.orderdetails AS odet ON odet.id_order = ord.id_client
WHERE c.id_client = ord.id_client AND odet.order_details_status = true;
--SELECT end

--DELETE begin
--Удалить всех клиентов, на которых никогда не было заказов
DELETE FROM hotel.client AS c
WHERE c.id_client NOT IN (
        SELECT id_client
        FROM hotel.order
      );
--DELETE end
