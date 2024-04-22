USE sql_store;
-- insert one row in the table customers
insert into customers values(default, 'Mark', 'Joshua', '1997-02-17', '718-549-6353', '753 Trail', 'Chicago', 'IL', 750);

-- insert two rows in the table shippers
insert into shippers(name) values('High Affairs'), ('Glass Brothers'), ('Bros Partners');

-- insert two rows in the table orders 
insert into orders values(default, 11, '2024-04-15', default, null, null, null); 
insert into orders values(default, 7, '2024-01-23', default, null, null, null);
delete from orders  -- delete row
where order_id = 11 and customer_id = 11;
delete from orders  -- delete row
where order_id = 16 and customer_id = 11;
delete from orders  -- delete row
where order_id = 19 and customer_id = 7;


-- insert three rows in the table products
insert into products values(default, 'Biscuits-Oreo', 100, 1.20);
insert into products values(default, 'Heinz-Spaghetti', 73, 1.05);
insert into products values(default, 'Baked Beans-DR pepper', 34, 3.20);

-- insert rows in multiple tables: orders and order_items
insert into orders(customer_id, order_date, status)
 values(7, '2024-04-12', 1);
 insert into order_items values(last_insert_id(), 10, 7, 1.09);
 


