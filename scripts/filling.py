import psycopg2
import random as rd

con = psycopg2.connect(
  database="postgres",
  user="postgres",
  password="postgres",
  host="127.0.0.1",
  port="5432"
)
cursor = con.cursor()

ap_capacity = range(7)
ap_class = ['Single', 'Double', 'Queen', 'King', 'Twin', 'Studio', 'President Suite',
            'Connecting rooms', 'Quad', 'Murphy Room']
ap_price = [1000, 1500, 4000, 5200, 9500, 9000, 7500, 14000, 5500, 7500, 5000, 1500, 2200]

def ins_client(*args):
    cursor.execute(f'''INSERT INTO hotel.client (client_firstname, client_lastname,
                          client_mobile_phone, client_passport, client_email,
                          client_card_number, client_birthday) VALUES ('{args[0]}', '{args[1]}', 
                          '{args[2]}', '{args[3]}', '{args[4]}', '{args[5]}', '{args[6]}');''')


def ins_employee(*args):
    cursor.execute(f'''INSERT INTO hotel.employee (employee_firstname, employee_lastname,
                          employee_mobile_phone, employee_passport, employee_email,
                          employee_salary, employee_birthday) VALUES ('{args[0]}', '{args[1]}', 
                          '{args[2]}', '{args[3]}', '{args[4]}', '{args[5]}', '{args[6]}');''')


def ins_order(*args):
    cursor.execute(f'''INSERT INTO hotel.order(id_order, id_client, id_employee) VALUES ('{args[0]}', 
    '{args[1]}', '{args[2]}');''')


def ins_apartment(*args):
    cursor.execute(f'''INSERT INTO hotel.apartment(apartment_capacity, apartment_number,
                            apartment_class, apartment_price_for_night, apartment_is_available) 
                            VALUES ('{args[0]}', '{args[1]}', '{args[2]}', '{args[3]}', '{args[4]}');''')


def ins_orderdetails(*args):
    cursor.execute(f'''INSERT INTO hotel.orderdetails(id_order, id_client, id_apartment, order_details_arrival_time,
                               order_details_departure_time,order_details_people_amount,
                               order_details_is_running, order_details_prolong_count) 
                               VALUES ('{args[0]}', '{args[1]}', '{args[2]}', '{args[3]}', '{args[4]}',
                                '{args[5]}', '{args[6]}', '{args[7]}');''')


def ins_bookorder(*args):
    cursor.execute(f'''INSERT INTO hotel.bookorder(id_order, id_client, booked_order_is_booked,
                            booked_order_is_canceled, booked_order_status) 
                            VALUES ('{args[0]}', '{args[1]}', '{args[2]}', '{args[3]}', '{args[4]}');''')


def ins_payfororder(*args):
    cursor.execute(f'''INSERT INTO hotel.payfororder(id_booked_order, pay_for_order_is_paid, pay_for_order_is_received,
                              pay_for_order_paid_sum, pay_for_order_remaining_sum,
                              pay_for_order_payment_method, pay_for_order_payment_count) 
                              VALUES ('{args[0]}', '{args[1]}', '{args[2]}',
                               '{args[3]}', '{args[4]}', '{args[5]}', '{args[6]}');''')


ins_client('Andrey', 'Komarov', '+79251236421', 'OnGW339KyytLF7hcNhLDTxMbw1UOyt', 'kom.a@gmail.com',
           '4916191820566489', '1983-06-16')
ins_client('Arman', 'Anuarbek', '+77011532451', 'iPm7ulD7rM98E1IoG0dTHHpTVmoISc', 'killer222@gmail.com',
           '4631083749724329', '1999-02-11')
ins_client('Artem', 'Veber', '+79251556435', 'A0PoQZLRKLmFcCqd0nEkBVuYK6SEl0', 'artemkek@gmail.com',
           '4556895455819568', '1928-03-07')
ins_client('Bogdan', 'Zadorin', '+79250409224', 'sJDLUiI3v1cRcRrbJ2etEPTZGugxIW', 'bogdan@gmail.com',
           '4556764175252304', '1983-07-02')
ins_client('Timur', 'Utsal', '+79251236421', 'WKZrg3H3rtienibLuLZQ0zqi6WGol2', 'blandit@outlook.couk',
           '4539871654212139', '1931-11-18')
ins_client('Stewart', 'Garner', '1-543-843-31', 'EKADciuy3WYciFIgd1uJxcRydW9428', 'dignissim.magna.a@google.net',
           '4556331358382397', '1936-10-01')
ins_client('Ashton', 'Potter', '1-735-333-75', 'lSuPdxoZlI8KREAl3LjGi055Mqf63b', 'ut.quam.vel@protonmail.ca',
           '4485163169047752', '1939-03-14')
ins_client('Melissa', 'Cooper', '1-143-777-23', 'sjSt98a2llxnD9zvWzCxSrgJbHZ6gg', 'rutrum.urna@aol.couk',
           '4281340442356426', '1965-09-25')
ins_client('Ulysses', 'Wyatt', '1-247-772-43', 'PmVRoDxvfxI2AhYACJR1jeVFs6xKl0', 'sed.pede@google.org',
           '4024007192738754', '1977-01-14')
ins_client('Ezra', 'Cabrera', '1-381-719-63', 'TnatXA0TeX7Y4EouQQjsPnKpj89M8s', 'ultrices.vivamus@outlook.net',
           '4916739519585267', '1968-07-16')
ins_client('Caldwell', 'Pittman', '1-434-832-47', 'FepN3yPzJxYFovIqcvJZAoUwtJtAgt', 'dui@google.org',
           '4492725845583789', '1916-06-18')

con.commit()
cursor.execute('SELECT * FROM hotel.client')
records = cursor.fetchall()
clientID = []

for i in records:
    clientID.append(i[0])
print(*records, sep="\n")


ins_employee('Sara', 'Gray', '+79255147421', 's8hdPAJvzSNAqJRbaojCjvVFk3DFdO', 'Sara_Gray7532@elnee.tech',
             '373661711396950', '1960-06-14')
ins_employee('Carissa', 'Cooper', '+72351532451', 'riYfgOJ7sD2BoM36mc2V6ESkgOs7y7', 'Carissa_Cooper4883@bretoux.com',
             '373710890080743', '1973-06-19')
ins_employee('Mark', 'Oliver', '+79251556905', 'uFWZWtTFzYsy10ynQx8RfLJv2Li112', 'Mark_Oliver3375@ubusive.com',
             '378921800604192', '1936-07-01')
ins_employee('Allison', 'Casey', '+79224409224', '5mIaOWzm9ruj1R0j6lhLKcN6z55UP7', 'Allison_Casey3360@fuliss.net',
             '373873106606360', '1946-04-28')
ins_employee('Ryan', 'Cunningham', '(868) 348-57', 'V62KH95lqB4GUCmcZLlSbfXBuX9p57', 'Ryan_Cunningham3632@guentu.biz',
             '349812871887566', '1918-03-02')
ins_employee('Alba', 'Quinnell', '1-995-338-88', 'lLUPrIsR7hc4alGjI49WJu4B8P0IoQ', 'Alba_Quinnell8259@liret.org',
             '378547063184802', '1964-06-20')
ins_employee('Summer', 'Evans', '1-221-611-84', 'rP4HW1jQww918f002Y2kCjToXS1047', 'Summer_Evans2921@sveldo.biz',
             '372070319808765', '1987-04-02')
ins_employee('Nancy', 'Shields', '(562) 864-53', 'IAGYR7Qw4wKv0TmFlpSkQUf4ENRQ7Y', 'Alessandra_Furnell9980@nimogy.biz',
             '343813765817806', '1971-03-15')
ins_employee('Logan', 'Needham', '(470) 849-57', 'yj4KDNq6i4G9k3CxfMTDqAyfNf9Rdn', 'Courtney_Stark8474@extex.org',
             '347161704115619', '1962-08-18')
ins_employee('Clint', 'Stewart', '1-262-523-49', 'gUrCSkE2gCdWf2yyuY7iOZd5YUQwHW', 'Jenna_Clarke7730@nimogy.biz',
             '378760529932082', '1949-09-27')
ins_employee('Carissa', 'Jenkins', '(612) 696-26', 'aGuaJJP0975AXTmG1wn8TSuKoTCDVd', 'Carissa_Jenkins6112@gembat.biz',
             '348962567739372', '1934-09-25')

con.commit()
cursor.execute('SELECT * FROM hotel.employee')
records = cursor.fetchall()
employeeID = []
for i in records:
    employeeID.append(i[0])
print(*records, sep="\n")

cl_ord_id = []
for i in range(1, 9):
    ins_order(i, i, i)

con.commit()
cursor.execute('SELECT * FROM hotel.order')
records = cursor.fetchall()

print(*records, sep="\n")

for i in range(12):
    ins_apartment(rd.choice(ap_capacity), i, rd.choice(ap_class), rd.choice(ap_price), rd.choice([True, False]))

con.commit()
cursor.execute('SELECT * FROM hotel.apartment')
records = cursor.fetchall()

print(*records, sep="\n")

ins_orderdetails(1, 1, rd.choice(range(1, 12)), '2022-04-25 9:30:20', '2022-05-01 10:30:20', 1, False, 0)
ins_orderdetails(2, 2, rd.choice(range(1, 12)), '2022-03-23 11:17:05', '2022-03-29 12:17:05', 1, False, 0)
ins_orderdetails(3, 3, rd.choice(range(1, 12)), '2022-03-22 15:24:18', '2022-03-29 16:24:18', 1, False, 0)
ins_orderdetails(4, 4, rd.choice(range(1, 12)), '2022-03-22 15:24:18', '2022-03-29 16:24:18', 1, False, 0)
ins_orderdetails(5, 5, rd.choice(range(1, 12)), '2022-03-22 15:24:18', '2022-03-29 16:24:18', 1, False, 0)
ins_orderdetails(6, 6, rd.choice(range(1, 12)), '2022-03-20 03:45:29', '2022-04-22 04:45:29', 1, False, 0)
ins_orderdetails(7, 7, rd.choice(range(1, 12)), '2022-06-01 09:45:29', '2022-06-01 10:45:29', 1, False, 0)
ins_orderdetails(8, 8, rd.choice(range(1, 12)), '2022-06-01 09:45:29', '2022-06-01 10:45:29', 1, False, 0)

con.commit()

cursor.execute('SELECT * FROM hotel.orderdetails')
records = cursor.fetchall()

print(*records, sep="\n")

ins_bookorder(1, 1, True, False, False)
ins_bookorder(1, 1, False, False, True)
ins_bookorder(2, 2, True, False, False)
ins_bookorder(2, 2, False, True, True)
ins_bookorder(3, 3, True, False, False)
ins_bookorder(3, 3, False, False, True)
ins_bookorder(4, 4, False, False, True)
ins_bookorder(5, 5, False, False, True)
ins_bookorder(6, 6, False, False, True)
ins_bookorder(7, 7, False, False, True)
ins_bookorder(8, 8, False, False, True)

con.commit()

ins_payfororder(1, True, True, 1000, 0, 'cash', 1),
ins_payfororder(3, False, False, 0, 1500, 'cash', 1),
ins_payfororder(5, True, True, 5000, 0, 'cash', 1),
ins_payfororder(7, True, True, 2200, 0, 'credit card', 1),
ins_payfororder(8, True, True, 9500, 0, 'credit card', 1),
ins_payfororder(9, True, True, 9000, 0, 'credit card', 1),
ins_payfororder(10, True, True, 7500, 0, 'credit card', 1)
ins_payfororder(11, True, True, 5500, 0, 'credit card', 1)
con.commit()

cursor.close()
con.close()

