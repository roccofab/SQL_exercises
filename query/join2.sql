USE sql_store;
-- query 1 on the table orders and customers(database sql_store)
select *
from orders o
join customers c on o.customer_id = c.customer_id;  -- explicit join between the order table columns and the customer table columns

-- query 2 on the table orders and customers
select *
from orders o, customers c
where o.customer_id = c.customer_id;  -- implicit join between the order table columns and the customer table columns: it return the same result as query 1

-- query 3 on the table orders and customers(LEFT JOIN)
select 
   c.customer_id,
   c.first_name,
   o.order_id,
   o.order_date
from customers c
left join orders o on c.customer_id = o.customer_id
order by c.customer_id;   -- return all customers id included those who have no orders(null): LEFT JOIN returns all the records of the left table(customers) whether or not the condition in the ON clause is true(customers.customer_id=orders.customer_id)

-- query 4 on the table orders and customers(RIGHT JOIN)
select 
   c.customer_id,
   c.first_name,
   o.order_id,
   o.order_date
from customers c
right join orders o on c.customer_id = o.customer_id
order by c.customer_id;  -- return all customers id excluded those who have no orders(null): RIGHT JOIN returns all the records of the right table(orders)

-- query 5 on the table orders and customers(RIGHT JOIN)
select 
   c.customer_id,
   c.first_name,
   o.order_id,
   o.order_date
from orders o
right join customers c on c.customer_id = o.customer_id
order by c.customer_id;  -- return all customers id included those who have no orders(null): this query is as query 4 but i've inverted the order of the tables customers and orders

-- query 6 on the table order_items and products(LEFT JOIN)
select 
   p.product_id,
   p.name,
   oi.quantity
from order_items oi
left join products p on oi.product_id = p.product_id
order by oi.product_id;  -- return all the products excluded null

-- query 7 on the table order_items and products(RIGHT JOIN)
select 
   p.product_id,
   p.name,
   oi.quantity
from order_items oi
right join products p on oi.product_id = p.product_id
order by oi.product_id;   -- return all the products included null

-- query 8 on the table order_items and products(LEFT JOIN)
select 
   p.product_id,
   p.name,
   oi.quantity
from products p
left join order_items oi on oi.product_id = p.product_id
order by oi.product_id;  -- return all the products included null: this query is as query 7(right join) but i've inverted the order of the tables order_items and products

-- query 9 on the table order_items and products(RIGHT JOIN)
select 
   p.product_id,
   p.name,
   oi.quantity
from products p
right join order_items oi on oi.product_id = p.product_id
order by oi.product_id;  -- return all the products excluded NULL: this query is as query 6(left join) but i've inverted the order of the tables order_items and products 

-- query 10 on the table orders, customers and shippers(OUTER JOIN and INNER JOIN): the result is a table with customer_id/first_name/last_name(from customers table), order_id(from orders table) and shipper name (from shippers table)
select 
   c.customer_id,
   c.first_name,
   c.last_name,
   o.order_id,
   s.name as shipper_name
from customers c
left join orders o on c.customer_id = o.customer_id  -- return all the customers with order included null
left join shippers s on o.shipper_id = s.shipper_id;  -- return all shippers name as shipper_name included null

-- query 11 on tables: orders, customers,shippers, order_statuses: the result is a table with order_date and order_id and the corresponding customer that made the order(first_name and id), the corresponding shipper who send the order(name) and the status of the order
select 
   o.order_date,
   o.order_id,
   c.first_name,
   c.customer_id,
   s.name as shipper_name,
   os.name as order_status
from orders o
join customers c on o.customer_id = c.customer_id
left join shippers s on o.shipper_id = s.shipper_id
join order_statuses os on o.status = os.order_status_id;



-- query 12 on the table employees(database sql_hr)
select 
   e.employee_id,
   e.first_name,
   e.last_name,
   m.first_name as manager
from sql_hr.employees e
left join sql_hr.employees m on e.reports_to = m.employee_id;  -- return a table with employee_id,their corresponding name and last name, a column with the name manager for any employee(NULL for the same manager)

-- query 13 on the tables orders and customers(JOIN tables orders/customers/shippers using clause USING)
select 
   o.order_id,
   c.first_name,
   c.last_name,
   s.name as shipper_name
from sql_store.orders o
join sql_store.customers c using(customer_id)
left join sql_store.shippers s using(shipper_id);

-- query 14 from the tables order_items and order_items_notes: order_items has compound primary key(compound join)
select *
 from sql_store.order_items oi
 join sql_store.order_item_notes oin on oi.order_id = oin.order_Id  
    and oi.product_id = oin.product_id;
    
-- query 15 from the tables order_items and order_items_notes: the result is as query 15, but the query is simplified by the USING clause
select * 
from sql_store.order_items oi
join sql_store.order_item_notes oin using(order_id, product_id);

-- query 16 from tables payments, payment_methods,clients(database sql_invoicing)
select 
   p.date,
   c.name as client_name,
   p.amount,
   pm.name as payment_method
from sql_invoicing.payments p
join sql_invoicing.clients c using(client_id)
join sql_invoicing.payment_methods pm on p.payment_method = pm.payment_method_id;   -- JOIN table payments/clients(client_id), and table payments/payment_methods using the condition on p.payment_method = pm.payment_method_id

-- query 17 from tables customers and products: JOIN two tables using no condition( explicit CROSS JOIN)
select *
from sql_store.customers c
cross join sql_store.products p;

-- query 18 from tables customers and products: the result is as query 17, but syntax is easier(implicit CROSS JOIN)
select *
from sql_store.customers, sql_store.products; 

-- query 19 from tables products and shippers using implicit CROSS JOIN
select *, shippers.name as shipper_name
from sql_store.products, sql_store.shippers;

-- query 20 from tables products and shippers using explicit CROSS JOIN
select *, shippers.name as shipper_name
from sql_store.products
cross join sql_store.shippers;

-- query 21 from table orders: add rows and union between two query
select 
   order_id,
   order_date,
   'Archived' as status   -- add new column status with rows 'Archived' for the archived orders and 'Lost' for the lost orders
from sql_store.orders
where order_date < '2019-01-30'
union   -- UNION operator can combine records from multiple query of same tables or different tables and combine the result in one result set, the most important thing is that the number of columns in each query is the same 
select
   order_id,
   order_date,
   'Lost' as status   -- add 'Lost' in the row of status column relating to the date 2019-01-30
   from sql_store.orders
   where order_date = '2019-01-30';
   
-- query 22 from tables customers and shippers: combine customer's name and shipper's name using UNION operator
select first_name
from sql_store.customers
union
select name
from sql_store.shippers;  -- the result is a single column first_name that contain customer's name and shipper's name, the number of columns in each query must be the same!

-- query 23 from table customers: create a new column named type and add rows 'Bronze'(points < 2000), 'Silver'(points BETWEEN 2000 and 3000), 'Gold'(points > 3000)  using UNION operator
select 
  customer_id,
  first_name,
  points,
  'Bronze' as type 
from sql_store.customers
where points < 2000   -- bronze for points < 2000
union
select
   customer_id,
   first_name,
   points,
   'Silver' as type
from sql_store.customers
where points between 2000 and 3000   -- silver for points between 2000 and 3000
union
select
   customer_id,
   first_name,
   points,
   'Gold' as type
from sql_store.customers
where points > 3000  -- gold for points > 3000
order by first_name;

-- query 24 from

   





