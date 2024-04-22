USE sql_store;
-- statement to give any customer born before 1990 50 points extra
update customers
set points = points + 50
where birth_date < '1991-01-01';

-- enter comment 'Gold Client' in the column comments(table orders) for any customer_id who has points>3000(table customers)
update orders
set comments = 'Gold Client'
where customer_id in(
              select customer_id
              from customers
			  where points > 3000);