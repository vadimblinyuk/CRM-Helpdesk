**1. Создать индекс к какой-либо из таблиц вашей БД**

CREATE INDEX passenger_name_idx ON tickets (passenger_name);

**2. Прислать текстом результат команды explain,
в которой используется данный индекс**

explain
select * from tickets where passenger_name = 'TATYANA ANDREEVA';

"Bitmap Heap Scan on tickets  (cost=52.55..9018.07 rows=4145 width=120)"
"  Recheck Cond: (passenger_name = 'TATYANA ANDREEVA'::text)"
"  ->  Bitmap Index Scan on passenger_name_idx  (cost=0.00..51.51 rows=4145 width=0)"
"        Index Cond: (passenger_name = 'TATYANA ANDREEVA'::text)"

**3. Реализовать индекс для полнотекстового поиска**

CREATE INDEX gin_contact_data_idx ON tickets USING GIN (contact_data);

explain
select * from tickets where contact_data @> '{"email": "alfiya-frolova1963@postgrespro.ru"}'; 

**4. Реализовать индекс на часть таблицы или индекс на поле с функцией**

CREATE INDEX lower_passenger_name_idx ON tickets (lower(passenger_name));

explain
select * from tickets where lower(passenger_name) = 'tatyana andreeva';

**5. Создать индекс на несколько полей**

CREATE INDEX book_ref_passenger_name_idx ON tickets (book_ref, passenger_name);

explain 
select * from tickets where book_ref = 'DA7166' and passenger_name = 'NINA BELOVA';

**6. Написать комментарии к каждому из индексов**

passenger_name_idx - обычный Btree индекс
gin_contact_data_idx - GIN индекс используется для jsonb и полнотекстового поиска. В данном случае приминил к полю с типом jsonb так как в данном примере нет подходящиго поля с достаточным объемом данных 
lower_passenger_name_idx - индекс по функции, ищет имя пассажиров в нижнем регистре
book_ref_passenger_name_idx - составной индекс

**7. Описать что и как делали и с какими проблемами столкнулись**

Проблемы были с GIN индексом - долго не мог понять в чем дело, а оказывается дело в классе операторов. Изначально использовал для поиска в джейсоне ->> и индекс не работал, а когда поменял на @> - все применилось 
