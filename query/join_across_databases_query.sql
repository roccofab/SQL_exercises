USE sql_inventory;
-- joining across databases
-- query 1 from the table order_items(database sql_store) and the table products(database sql_inventory)
select *
from sql_store.order_items oi 
join products p on oi.product_id = p.product_id;   -- linking table order_items to products 

-- query 2 from the table employees(database sql_hr)
select *
from sql_hr.employees e
join sql_hr.employees m
 on e.reports_to = m.employee_id;  -- linking employees with their manager
 
 -- query 2 from the table employees(database sql_hr)
 select 
	e.employee_id,
    e.first_name,
    m.employee_id as manager_id,
    m.first_name as manager_name
from sql_hr.employees e
join sql_hr.employees m
 on e.reports_to = m.employee_id;  -- linking column employee_id and first name of employees to id and name of the manager
 
 -- query 3 from the tables of database sql_store: orders, customers, order_statuses
 select *
 from sql_store.orders o
 join sql_store.customers c on o.customer_id = c.customer_id
 join sql_store.order_statuses os on o.status = os.order_status_id;  -- linking tables orders to customers(customer_id) and status (table orders) with order_status_id(table order_status)
 
-- query 3 from the tables of database sql_store: orders, customers, order_statuses
select 
   o.order_id,
   o.customer_id,
   c.first_name,
   c.last_name,
   os.name
 from sql_store.orders o
 join sql_store.customers c on o.customer_id = c.customer_id
 join sql_store.order_statuses os on o.status = os.order_status_id; -- get a table composed of order_id and customer_id(from table orders), first_name and last_name(from table customers) and name(from table order_statuses)
 
 -- query 4 from the tables: clients, payments, payments_methods
 select 
    p.date,
    c.client_id,
    c.name,
	pm.name,
    p.payment_id
 from sql_invoicing.payments p
 join sql_invoicing.payment_methods pm on p.payment_id = pm.payment_method_id
 join sql_invoicing.clients c on p.client_id = c.client_id;   -- get a table composed of data payment/client-id/client name(from table clients and payments), name of the payment method/payment_id(from table payments and payments_methods)
 
 -- query 5 from the tables order_items and order_items_notes: order_items has compound primary key
 select *
 from order_items oi
 join order_item_notes oin on oi.order_id = oin.order_Id  -- first condition of the compound join based on the columns order_id (table order_items) and order_id(table order_item_notes)
    and oi.product_id = oin.product_id;  -- second condition of the compound join based on the columns product_id(table order_items) and product_id(table order_item_notes)
    
    
    
 