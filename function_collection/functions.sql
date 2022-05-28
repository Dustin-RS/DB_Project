--1
--Список клиентов, которые въехали в указанную дату
CREATE OR REPLACE FUNCTION client_arrival_date(d TIMESTAMP)
    RETURNS TABLE (id_client BIGINT, client_lastname VARCHAR(50), client_firstname VARCHAR(50), client_mobile_phone VARCHAR(12),
     client_passport VARCHAR(30), client_email VARCHAR(200), client_card_number VARCHAR(50), client_birthday DATE) AS
    $$
    BEGIN
        RETURN query(
            SELECT c.id_client, c.client_lastname, c.client_firstname, c.client_mobile_phone,
                   c.client_passport, c.client_email, c.client_card_number, c.client_birthday
            FROM hotel.client AS c
                     LEFT JOIN hotel."order" AS ord ON ord.id_client = c.id_client
                     LEFT JOIN hotel.orderdetails AS odet ON odet.id_client = ord.id_client AND odet.id_order = ord.id_order
            WHERE odet.order_details_arrival_time = d
        );
    END;
    $$ LANGUAGE plpgsql;

--Пример использования
SELECT client_arrival_date('2022-03-22 15:24:18');

--DROP FUNCTION client_arrival_date;

--2
--Информация о конкретном апартаменте
CREATE OR REPLACE FUNCTION apartment_client_pay(ap_num INT)
    RETURNS TABLE(id_client BIGINT, client_lastname VARCHAR(50), client_firstname VARCHAR(50), client_mobile_phone VARCHAR(12),
     client_passport VARCHAR(30), client_email VARCHAR(200), client_card_number VARCHAR(50), client_birthday DATE,
     id_pay_for_order BIGINT, id_booked_order INT, pay_for_order_is_paid BOOLEAN, pay_for_order_is_received BOOLEAN, pay_for_order_paid_sum DECIMAL,
     pay_for_order_remaining_sum DECIMAL, pay_for_order_payment_method VARCHAR(20), pay_for_order_payment_count INT) AS
    $$
    BEGIN
        RETURN query(
          SELECT DISTINCT c.id_client, c.client_lastname, c.client_firstname, c.client_mobile_phone, c.client_passport,
                 c.client_email, c.client_card_number, c.client_birthday,
                pay.id_pay_for_order, pay.id_booked_order, pay.pay_for_order_is_paid, pay.pay_for_order_is_received,
                pay.pay_for_order_paid_sum, pay.pay_for_order_remaining_sum, pay.pay_for_order_payment_method,
                pay.pay_for_order_payment_count
          FROM hotel."order" AS ord
          INNER JOIN hotel.orderdetails AS odet ON odet.id_client = ord.id_client AND odet.id_order = ord.id_order
          LEFT JOIN hotel.client AS c ON c.id_client = ord.id_client
          LEFT JOIN hotel.bookorder AS bord ON bord.id_order = ord.id_order AND bord.id_client = ord.id_client
          LEFT JOIN hotel.payfororder AS pay ON pay.id_booked_order = bord.id_booked_order
          LEFT JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
          WHERE ap.apartment_number = ap_num AND odet.order_details_is_running = true
        );
    END;
    $$ LANGUAGE plpgsql;

--Пример использования
SELECT apartment_client_pay(101);

--DROP FUNCTION apartment_client_pay;
