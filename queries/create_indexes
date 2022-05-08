--Индекс по фамилии и имени клиента, по скольку это самый легкий способ распознать клиента
CREATE INDEX client_lastname_firstname_idx ON hotel.client(client_lastname, client_firstname);

EXPLAIN (ANALYSE )
SELECT *
FROM hotel.client AS c
WHERE c.client_lastname = 'Anuarbek' AND c.client_firstname = 'Arman';
--Индекс по фамилии и имени сотрудника, по скольку это самый легкий способ распознать клиента
CREATE INDEX employee_lastname_firstname_idx ON hotel.employee(employee_lastname, employee_firstname);

EXPLAIN(ANALYSE)
SELECT *
FROM hotel.employee AS e
WHERE e.employee_lastname = 'Casey' AND e.employee_firstname = 'Allison';
--Индекс по классу апартаментов, поскольку это самый популярный атрибут у апартоментов
CREATE INDEX apartment_class_idx ON hotel.apartment(apartment_class);

EXPLAIN(ANALYSE )
SELECT *
FROM hotel.apartment AS ap
WHERE ap.apartment_class = 'Single';

--Индекс по айди от заказов и айди от клинетов, посколько мы очень часто при джоине, используем эти столбцы
CREATE INDEX orderdetails_idorder_idclient ON hotel.orderdetails(id_order, id_client);
EXPLAIN(ANALYSE )
SELECT *
FROM hotel.orderdetails AS odet
WHERE odet.id_order = 3 AND odet.id_client = 3;
