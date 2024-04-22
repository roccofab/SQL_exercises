-- Basic Operations
USE sql_store;
-- query 1 on the table customers
SELECT *, points + 10 AS 'factor' 
FROM customers;

-- query 2 on the table orders
select *
from orders
where order_date = '2019-01-30' AND status = 1;

-- query 3 on the table products
select *
from products
where not(quantity_in_stock < 30 or unit_price >3.00);

-- query 4 on the table order_items
select *, unit_price * quantity as total
from order_items
where order_id = 6 and unit_price * quantity > 20;

-- query 5 on the table customers
select*
from customers
where state in('TX','FL','CO');

-- query 6 on the table customers
select*
from customers
where state not in('TX','FL','CO');

-- query 7 on the table products
select *
from products
where quantity_in_stock in(49, 38, 72);

-- query 8 on the table customers
select *
from customers
where points between 1000 and 3000;   -- alternative is: where points >= 1000 and points <= 3000

-- query 9 on the table customers
select *
from customers
where birth_date between '1990-01-01' and '2000-01-01';

-- query 10 on the table customers
select *
from customers
where last_name like 'b%_y';  -- get customers who have 'b' as first letter of their surname and 'y' as last letter

-- query 11 on the table customers
select *
from customers
where address like '%Trail' or address like '%Avenue';  -- get customer's address that contain 'Trail' at the end of the address 'Avenue' at the end of the address

-- query 12 on the table customers
select *
from customers 
where phone like '%9';  -- get customer's phone that has 9 at the end

-- query 13 on the table customer
select *
from customers
where phone not like '%9';   --  get customer's phone not has 9 at the end

-- query 14 on the table customers
select *
from customers
where birth_date like '%04%';  --  get customer's birth_date that contains 04

-- query 15 on the table customers
select *
from customers
where last_name regexp 'field';   -- get customer's last name that contain the string field, an alternative is: where last_name like '%field%'

-- query 16 on the table customers
select *
from customers
where last_name regexp 'field|Caffrey|seby';  -- get customer's last names that contain 'field' or 'Caffrey' or 'seby'

-- query 17 on the table customers
select *
from customers
where last_name regexp '[fre]y';  -- get customer's last name that contain one letter between 'f','r','y' before y

-- query 18 on the table
select *
from customers
where last_name regexp '[a-h]e';  -- get customer's last name that contain any letter from 'a' to 'h' before 'e'

-- query 19 on the table customers
select *
from customers
where first_name = 'Elka';

-- query 20 on the table customers
select *
from customers
where last_name regexp 'EY$|ON$';  -- get customer's last name that contain 'EY' or 'ON' at the end

-- query 21 on the table customers
select *
from customers
where last_name regexp '^MY' or last_name regexp 'SE';  -- get customer's last name that start with 'MY' and last name that contain 'SE'

-- query 22 on the table customers
select *
from customers
where last_name regexp 'B[R|U]';  -- get customer's last name that contain 'B' followed by 'R' or 'U'

-- query 23 on the table
select *
from customers
where phone is null;   -- get customers who have NULL phone field

-- query 23 on the table customers
select *
from customers
where phone is not null;  -- get customers who have not null phone field

-- query 24 on the table orders 
 select *
 from orders
 where shipped_date is null;  -- get orders that are not shipped
 
 -- query 25 on the table customers
 select *
 from customers
 order by first_name;   -- order by first name(default is ascending order)
 
 -- query 26 on the table customers
 select *
 from customers
 order by first_name desc;  -- order by first name in descending order
 
 -- query 27 on the table
 select *
 from customers
 order by state desc, first_name;  -- order by state in descending order and first name in ascending order(default)
 
 -- query 28 on the table order_items
 select *, quantity * unit_price as total_price
 from order_items
 order by total_price desc;  -- get a new temporary column total_price(quantity * unit_price) and then order the column(total_price) in descending order
 
 -- query 29 on the table customers
 select first_name, last_name
 from customers
 limit 5;  -- get the first 5 first names and last names from the columns first_name and last_name
 
 -- query 30 on the table customers
 select *
 from customers
 limit 5;  -- get the first 5 nnuple from the table customers
 
 -- query 31 on the table customers
 select *
 from customers
 limit 6, 4;  -- get the last 4 nnuples
 
 -- query 32 on the table customers
 select *
 from customers
 order by points desc
 limit 3;   -- get the first 3 customers having highest score
 
 



