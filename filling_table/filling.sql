--####################################################################################################################--
--## Client                                                                                                   ##--
--####################################################################################################################--

INSERT INTO hotel.client (client_firstname, client_lastname,
                          client_mobile_phone, client_passport, client_email,
                          client_card_number, client_birthday) VALUES
('Andrey', 'Komarov', '+79251236421', 'OnGW339KyytLF7hcNhLDTxMbw1UOyt', 'kom.a@gmail.com', '4916191820566489', '1983-06-16'),
('Arman', 'Anuarbek', '+77011532451', 'iPm7ulD7rM98E1IoG0dTHHpTVmoISc', 'killer222@gmail.com', '4631083749724329', '1999-02-11'),
('Artem', 'Veber', '+79251556435', 'A0PoQZLRKLmFcCqd0nEkBVuYK6SEl0', 'artemkek@gmail.com', '4556895455819568', '1928-03-07'),
('Bogdan', 'Zadorin', '+79250409224', 'sJDLUiI3v1cRcRrbJ2etEPTZGugxIW', 'bogdan@gmail.com', '4556764175252304', '1983-07-02'),
('Timur', 'Utsal', '+79251236421', 'WKZrg3H3rtienibLuLZQ0zqi6WGol2', 'blandit@outlook.couk', '4539871654212139', '1931-11-18'),
('Stewart', 'Garner', '1-543-843-31', 'EKADciuy3WYciFIgd1uJxcRydW9428', 'dignissim.magna.a@google.net', '4556331358382397', '1936-10-01'),
('Ashton', 'Potter', '1-735-333-75', 'lSuPdxoZlI8KREAl3LjGi055Mqf63b', 'ut.quam.vel@protonmail.ca', '4485163169047752', '1939-03-14'),
('Melissa', 'Cooper', '1-143-777-23', 'sjSt98a2llxnD9zvWzCxSrgJbHZ6gg', 'rutrum.urna@aol.couk', '4281340442356426', '1965-09-25'),
('Ulysses', 'Wyatt', '1-247-772-43', 'PmVRoDxvfxI2AhYACJR1jeVFs6xKl0', 'sed.pede@google.org', '4024007192738754', '1977-01-14'),
('Ezra', 'Cabrera', '1-381-719-63', 'TnatXA0TeX7Y4EouQQjsPnKpj89M8s', 'ultrices.vivamus@outlook.net', '4916739519585267', '1968-07-16'),
('Caldwell', 'Pittman', '1-434-832-47', 'FepN3yPzJxYFovIqcvJZAoUwtJtAgt', 'dui@google.org', '4492725845583789', '1916-06-18');

--####################################################################################################################--
--## Employee                                                                                                   ##--
--####################################################################################################################--
INSERT INTO hotel.employee (employee_firstname, employee_lastname,
                          employee_mobile_phone, employee_passport, employee_email,
                          employee_salary, employee_birthday) VALUES
('Sara', 'Gray', '+79255147421', 's8hdPAJvzSNAqJRbaojCjvVFk3DFdO', 'Sara_Gray7532@elnee.tech', '373661711396950', '1960-06-14'),
('Carissa', 'Cooper', '+72351532451', 'riYfgOJ7sD2BoM36mc2V6ESkgOs7y7', 'Carissa_Cooper4883@bretoux.com', '373710890080743', '1973-06-19'),
('Mark', 'Oliver', '+79251556905', 'uFWZWtTFzYsy10ynQx8RfLJv2Li112', 'Mark_Oliver3375@ubusive.com', '378921800604192', '1936-07-01'),
('Allison', 'Casey', '+79224409224', '5mIaOWzm9ruj1R0j6lhLKcN6z55UP7', 'Allison_Casey3360@fuliss.net', '373873106606360', '1946-04-28'),
('Ryan', 'Cunningham', '(868) 348-57', 'V62KH95lqB4GUCmcZLlSbfXBuX9p57', 'Ryan_Cunningham3632@guentu.biz', '349812871887566', '1918-03-02'),
('Alba', 'Quinnell', '1-995-338-88', 'lLUPrIsR7hc4alGjI49WJu4B8P0IoQ', 'Alba_Quinnell8259@liret.org', '378547063184802', '1964-06-20'),
('Summer', 'Evans', '1-221-611-84', 'rP4HW1jQww918f002Y2kCjToXS1047', 'Summer_Evans2921@sveldo.biz', '372070319808765', '1987-04-02'),
('Nancy', 'Shields', '(562) 864-53', 'IAGYR7Qw4wKv0TmFlpSkQUf4ENRQ7Y', 'Alessandra_Furnell9980@nimogy.biz', '343813765817806', '1971-03-15'),
('Logan', 'Needham', '(470) 849-57', 'yj4KDNq6i4G9k3CxfMTDqAyfNf9Rdn', 'Courtney_Stark8474@extex.org', '347161704115619', '1962-08-18'),
('Clint', 'Stewart', '1-262-523-49', 'gUrCSkE2gCdWf2yyuY7iOZd5YUQwHW', 'Jenna_Clarke7730@nimogy.biz', '378760529932082', '1949-09-27'),
('Carissa', 'Jenkins', '(612) 696-26', 'aGuaJJP0975AXTmG1wn8TSuKoTCDVd', 'Carissa_Jenkins6112@gembat.biz', '348962567739372', '1934-09-25');

--####################################################################################################################--
--## Order                                                                                                   ##--
--####################################################################################################################--
INSERT INTO hotel."order"(id_order, id_client, id_employee) VALUES
(1, 1, 5),
(2, 2, 8),
(3, 3, 6),
(3, 4, 6),
(3, 5, 6),
(4, 9, 2),
(5, 7, 4),
(6, 6, 7),
(7, 8, 3),
(7, 10, 3);

--####################################################################################################################--
--## Apartment                                                                                                   ##--
--####################################################################################################################--
INSERT INTO hotel.apartment(apartment_capacity, apartment_number,
                            apartment_class, apartment_price_for_night, apartment_is_available)  VALUES
(1,101,'Single',1000, true),
(NULL, 151, 'Double',1500, true),
(2, 161, 'Double',1500, false),
(1, 131, 'Queen',4000, true),
(1, 111, 'King',5200, false),
(1, 171, 'Twin', 9500, true),
(2, 112, 'King', 9000, true),
(2, 115, 'Studio',7500, true),
(7, 119, 'President Suite',14000, true),
(3, 122, 'Connecting rooms',5500, true),
(1, 155, 'Quad', 7500, true),
(1, 162, 'Triple',5000, true),
(1, 177, 'Double', 1500, false),
(NULL, 124, 'Murphy Room',2200, true);
--####################################################################################################################--
--## OrderDetails                                                                                                   ##--
--####################################################################################################################--
INSERT INTO hotel.orderdetails(id_order, id_client, id_apartment, order_details_arrival_time,
                               order_details_departure_time,order_details_people_amount,
                               order_details_is_running, order_details_prolong_count) VALUES
(1,1,1,'2022-04-25 9:30:20', '2022-05-01 10:30:20',1,false,0),
(2,2,2,'2022-03-23 11:17:05', '2022-03-29 12:17:05',1,false,0),
(3,3,12,'2022-03-22 15:24:18', '2022-03-29 16:24:18',3,false,0),
(3,4,12,'2022-03-22 15:24:18', '2022-03-29 16:24:18',3,false,0),
(3,5,12,'2022-03-22 15:24:18', '2022-03-29 16:24:18',3,false,0),
(4,9,14,'2022-03-20 03:45:29', '2022-04-22 04:45:29',1,false,0),
(5,7,6,'2022-06-01 09:45:29', '2022-06-01 10:45:29',1,true,0),
(6,6,7,'2022-06-01 09:45:29', '2022-06-01 10:45:29',1,true,0),
(7,8,11,'2022-05-20 03:45:29', '2022-05-23 04:45:29',2,true,0),
(7,10,11,'2022-05-20 03:45:29', '2022-05-23 04:45:29',2,true,0);
--####################################################################################################################--
--##BookOrder                                                                                                    ##--
--####################################################################################################################--
INSERT INTO hotel.bookorder(id_order, id_client, booked_order_is_booked,
                            booked_order_is_canceled, booked_order_status) VALUES
(1,1, true, false, false),
(1,1, false, false, true),
(2,2, true, false, false),
(2,2, false, true, true),
(3,3, true, false, false),
(3,3, false, false, true),
(4,9, true, false, false),
(4,9, false, false, true),
(5,7, true, false, true),
(6,6, true, false, true),
(7,8, true, false, true);
--####################################################################################################################--
--##PayForOrder                                                                                                    ##--
--####################################################################################################################--
INSERT INTO hotel.payfororder(id_booked_order, pay_for_order_is_paid, pay_for_order_is_received,
                              pay_for_order_paid_sum, pay_for_order_remaining_sum,
                              pay_for_order_payment_method, pay_for_order_payment_count) VALUES
(1, true, true, 1000, 0, NULL, 1),
(3, false, false, 0, 1500, 'cash', 1),
(5, true, true, 5000, 0, 'cash', 1),
(7, false, true, 1200, 1000, 'credit card', 1),
(7, true, true, 2200, 0, 'credit card', 2),
(9, true, true, 9500, 0, 'credit card', 1),
(10, true, true, 9000, 0, 'credit card', 1),
(11, true, true, 7500, 0, NULL, 1);

