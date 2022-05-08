--1
--Сколько людей живет и в каких аппартаментах
SELECT ap.apartment_number, ap.apartment_class,COUNT(ord.id_client) AS how_many_people_live
FROM hotel."order" AS ord
INNER JOIN hotel.orderdetails AS odet ON ord.id_order=odet.id_order AND ord.id_client=odet.id_client
INNER JOIN hotel.apartment AS ap ON odet.id_apartment = ap.id_apartment
GROUP BY ord.id_order, ap.apartment_class,ap.apartment_number;

--2
--Какой сотрудник отвечает за какие аппартаменты
SELECT DISTINCT e.employee_firstname, e.employee_lastname, ap.apartment_number, ap.apartment_class FROM hotel.employee AS e
INNER JOIN hotel."order" AS ord ON ord.id_employee = e.id_employee
INNER JOIN hotel.orderdetails AS odet ON odet.id_order = ord.id_order
INNER JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
ORDER BY ap.apartment_number;

--3
--Какой сотрудник обслуживает какого клиента
SELECT c.client_firstname, c.client_lastname, employee_firstname, e.employee_lastname FROM hotel."order" AS ord
INNER JOIN hotel.client AS c ON c.id_client = ord.id_client
INNER JOIN hotel.employee AS e ON e.id_employee = ord.id_employee;

--3.1
--Выбрать перые три свободных номера
WITH AP_NUM AS (SELECT ap.apartment_number, ap.apartment_class, ROW_NUMBER() OVER (ORDER BY ap.apartment_number) iter
                FROM hotel.apartment AS ap
                WHERE ap.apartment_is_available = true)
SELECT apartment_number, apartment_class
FROM AP_NUM
WHERE iter <=3;

--4
--Кто где живет и с кем
WITH ORD_NUM AS (SELECT ord.id_order, ord.id_client, ROW_NUMBER() OVER (PARTITION BY ord.id_order) iter
                FROM hotel.order AS ord)
SELECT DISTINCT c.client_firstname, c.client_lastname, ap.apartment_number, ap.apartment_class
FROM ORD_NUM AS o
INNER JOIN hotel.client AS c ON c.id_client = o.id_client
INNER JOIN hotel.orderdetails AS odet ON odet.id_client = o.id_client AND odet.id_order = o.id_order
INNER JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
ORDER BY ap.apartment_number;

--5
--Какие из забронированных заказов были отменены
WITH BOOK_NUM AS (SELECT bord.id_client,bord.id_order,
                         LEAD(bord.booked_order_is_canceled) OVER (PARTITION BY bord.id_order, bord.id_client) AS b_stat
                  FROM hotel.bookorder AS bord
)
SELECT c.client_firstname AS firstname,c.client_lastname AS lastname, ap.apartment_number, ap.apartment_class, 'cancled' AS status FROM BOOK_NUM AS bn
INNER JOIN hotel.orderdetails AS odet ON odet.id_client = bn.id_client AND odet.id_order = bn.id_order
INNER JOIN hotel.apartment AS ap ON ap.id_apartment = odet.id_apartment
INNER JOIN hotel.client AS c ON c.id_client = odet.id_client
WHERE bn.b_stat = true
;

--6
--Кто и сколько заплатил и за какое количество итераций
WITH PAID_NUM AS (SELECT p.id_booked_order, p.pay_for_order_payment_method, p.pay_for_order_paid_sum,
                         p.pay_for_order_remaining_sum, DENSE_RANK() OVER (ORDER BY p.pay_for_order_remaining_sum) AS pay_iter
                  FROM hotel.payfororder AS p WHERE p.pay_for_order_payment_method NOTNULL AND p.pay_for_order_paid_sum > 0)

SELECT pay_iter,c.client_firstname, c.client_lastname, pn.pay_for_order_paid_sum, pn.pay_for_order_payment_method, pn.pay_for_order_remaining_sum
FROM PAID_NUM AS pn
INNER JOIN hotel.bookorder AS bord ON bord.id_booked_order = pn.id_booked_order
INNER JOIN hotel.client AS c ON c.id_client = bord.id_client
GROUP BY pn.pay_iter,c.client_firstname, c.client_lastname, pn.pay_for_order_paid_sum, pn.pay_for_order_payment_method,  pn.pay_for_order_remaining_sum
ORDER BY c.client_firstname, c.client_lastname,pn.pay_iter
;


