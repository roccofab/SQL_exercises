USE sql_store;
-- creating a table archived_orders copyed from the table orders and then truncate table
create table orders_archived as 
select * from orders;
  
-- after you truncate table orders_archived then enter in it only orders that has a date value < 2024-04-12
insert into orders_archived
select *
from orders
where order_date < '2024-04-12';
