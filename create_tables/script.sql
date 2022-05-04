CREATE SCHEMA hotel;

CREATE TABLE IF NOT EXISTS hotel.Client
(
    ID_client BIGSERIAL PRIMARY KEY ,
    client_firstname VARCHAR(50) NOT NULL,
    client_lastname VARCHAR(50) NOT NULL,
    client_mobile_phone VARCHAR(12) NOT NULL,
    client_passport VARCHAR(30) NOT NULL,
    client_email VARCHAR(200),
    client_card_number VARCHAR(50) NOT NULL,
    client_birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.Employee
(
    ID_employee BIGSERIAL PRIMARY KEY ,
    employee_firstname VARCHAR(50) NOT NULL,
    employee_lastname VARCHAR(50) NOT NULL,
    employee_mobile_phone VARCHAR(12) NOT NULL,
    employee_passport VARCHAR(30) NOT NULL,
    employee_email VARCHAR(200),
    employee_salary DECIMAL NOT NULL,
    employee_birthday DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.Hotel
(
    ID_hotel BIGSERIAL PRIMARY KEY ,
    hotel_name VARCHAR(200) NOT NULL,
    hotel_company VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.Apartment
(
    ID_apartment BIGSERIAL PRIMARY KEY ,
    apartment_room_amount INT,
    apartment_number INT NOT NULL,
    apartment_class VARCHAR(50) NOT NULL,
    apartment_is_available BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.Order
(
    ID_order BIGSERIAL PRIMARY KEY ,
    ID_client INT NOT NULL REFERENCES hotel.Client,
    ID_employee INT NOT NULL REFERENCES hotel.Employee,
    ID_hotel INT NOT NULL REFERENCES hotel.Hotel
);

CREATE TABLE IF NOT EXISTS hotel.OrderDetails
(
    ID_order_details BIGSERIAL PRIMARY KEY ,
    ID_order BIGINT NOT NULL REFERENCES hotel.Order,
    ID_apartment INT NOT NULL REFERENCES hotel.Apartment,
    order_details_arrival_time TIMESTAMP NOT NULL,
    order_details_departure_time TIMESTAMP NOT NULL,
    order_details_total_price DECIMAL NOT NULL,
    order_details_price DECIMAL NOT NULL,
    order_details_surcharge DECIMAL DEFAULT 0,
    order_details_people_amount INT NOT NULL,
    order_details_status BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.BookOrder
(
    ID_booked_order BIGSERIAL PRIMARY KEY ,
    ID_order BIGINT NOT NULL REFERENCES hotel.Order,
    booked_order_is_booked BOOLEAN NOT NULL,
    booked_order_is_canceled BOOLEAN NOT NULL,
    booked_order_status BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS hotel.PayForOrder
(
    ID_pay_for_order BIGSERIAL PRIMARY KEY ,
    ID_booked_order INT NOT NULL REFERENCES hotel.BookOrder,
    pay_for_order_is_paid BOOLEAN NOT NULL,
    pay_for_order_is_received BOOLEAN NOT NULL,
    pay_for_order_paid_sum DECIMAL NOT NULL,
    pay_for_order_remaining_sum DECIMAL NOT NULL,
    pay_for_order_payment_method VARCHAR(20),
    pay_for_order_payment_count INT NOT NULL
);

