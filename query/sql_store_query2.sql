
USE sql_store;
-- inner join operator

-- query 1 on the table orders and on the table customers
select *
from orders
join customers on orders.customer_id = customers.customer_id;  -- linking each column of the orders table with each column of the customers table

-- query 2 on the table orders and on the table customers
select order_id, orders.customer_id, first_name, last_name
from orders
join customers on orders.customer_id = customers.customer_id;  -- linking column order_id and customer_id from orders table with column first_name and last_name from customers table

-- query 3 on the table orders and on the table customers
 select order_id, o.customer_id, first_name, last_name
from orders o  -- assign o as new temporary name to orders table
join customers c on o.customer_id = c.customer_id;   -- assign c as new temporary name to customers table, this query return the same result of the query 2

-- query 4 on the table order_items and on the table products
select *
from order_items oi
join products p on oi.product_id = p.product_id;  -- linking each column of order_items table with each column of products table

-- query 5 on the table order_items and on the table products
select order_id, oi.product_id, quantity, oi.unit_price
from order_items oi
join products p on oi.product_id = p.product_id;   -- linking the column product_id from table products to columns order_id, quantity and unit_price from table order_items

