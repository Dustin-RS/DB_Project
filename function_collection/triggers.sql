--########
--## №1 ##
--########

--Функция для триггера
--Удаляем записи в зависимой таблице от bookorder
CREATE OR REPLACE FUNCTION delete_pay_for_order_() RETURNS TRIGGER AS
    $$
    BEGIN
        DELETE
        FROM hotel.payfororder AS pay
        WHERE pay.id_booked_order = OLD.id_booked_order;

        RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

--Создание триггера
--ПЕРЕД удалением записи из bookorder, удалит запись из payfororder
CREATE TRIGGER delete_pay_for_order BEFORE DELETE
    ON hotel.bookorder
FOR EACH ROW
    EXECUTE PROCEDURE delete_pay_for_order_();

DROP TRIGGER delete_pay_for_order ON hotel.bookorder;


--Функция для триггера
--Удаляем записи во всех зависимых таблицах: orderdetails, bookorder
CREATE OR REPLACE FUNCTION delete_order_before_() RETURNS TRIGGER AS
    $$
    BEGIN
        DELETE
            FROM hotel.orderdetails AS odet
            WHERE odet.id_order = OLD.id_order AND odet.id_client = OLD.id_client;
        DELETE
            FROM hotel.bookorder AS bord
            WHERE bord.id_order = OLD.id_order AND bord.id_client = OLD.id_client;

        RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

--Создаем триггер
--ПЕРЕД удалением записи из order, удалит записи из зависимых таблиц
CREATE TRIGGER delete_order_before BEFORE DELETE
    ON hotel."order"
FOR EACH ROW
    EXECUTE PROCEDURE delete_order_before_();

--Функция для триггера
--После удаления заказа, удалем клиентов, которые были привязаны к этому заказу
CREATE OR REPLACE FUNCTION delete_order_after_() RETURNS TRIGGER AS
    $$
    BEGIN
        DELETE
            FROM hotel.client AS c
            WHERE c.id_client = OLD.id_client;

        RETURN OLD;
    END;
    $$ LANGUAGE plpgsql;

--Создаем триггер
CREATE TRIGGER delete_order_after AFTER DELETE
    ON hotel."order"
FOR EACH ROW
    EXECUTE PROCEDURE delete_order_after_();
--DROP TRIGGER delete_order ON hotel."order";

--Вставка
INSERT INTO hotel.client(client_firstname, client_lastname, client_mobile_phone,
                         client_passport, client_email, client_card_number, client_birthday)
VALUES ('Yvonne', 'Ball', '1-513-882-76', 'Fep272rGstYFovIKcvJZAoUwtJtAgt',
       'congue.a@protonmail.net', '4492725845784789', '1956-05-18');

INSERT INTO hotel."order"(id_order, id_client, id_employee)
VALUES (10,14,1);

INSERT INTO hotel.orderdetails(id_order, id_client, id_apartment, order_details_arrival_time,
                               order_details_departure_time, order_details_people_amount, order_details_is_running)
VALUES (10,14,12,'2022-05-20 13:45:29', '2022-06-10 14:45:29',1,true);

INSERT INTO hotel.bookorder(id_order, id_client, booked_order_is_booked,
                            booked_order_is_canceled, booked_order_status)
VALUES(10,14,true,false,true);

INSERT INTO hotel.payfororder(id_booked_order, pay_for_order_is_paid, pay_for_order_is_received, pay_for_order_paid_sum,
                              pay_for_order_remaining_sum, pay_for_order_payment_method, pay_for_order_payment_count)
VALUES(15,false, false, 0, 5000, 'cash', 0);

--Использование триггера
DELETE FROM hotel."order" AS ord
WHERE ord.id_order = 10 AND ord.id_client = 14;

--Select
SELECT * FROM hotel."order" AS ord
WHERE ord.id_order = 10;

SELECT * FROM hotel.orderdetails AS odet
WHERE odet.id_order = 10;

SELECT * FROM hotel.bookorder AS bord
WHERE bord.id_order = 10;

SELECT * FROM hotel.client AS c
WHERE c.id_client = 14;

--########
--## №2 ##
--########

--Функция для триггера
--Проверяем, не заняты ли апартаменты
CREATE OR REPLACE FUNCTION check_if_apartment_available_() RETURNS TRIGGER AS
    $$
    BEGIN
        IF OLD.apartment_is_available = false AND NEW.apartment_is_available = false
            THEN RAISE EXCEPTION 'Apartments currently occupied';
        END IF;

        RETURN NEW;
    END;
    $$LANGUAGE plpgsql;


--Создание триггера
CREATE TRIGGER check_if_apartment_available
    BEFORE UPDATE
    ON hotel.apartment
    FOR EACH ROW
    EXECUTE PROCEDURE check_if_apartment_available_();

UPDATE hotel.apartment SET apartment_is_available = false WHERE id_apartment = 13;

