USE sql_invoicing;
-- update single row(payment_total, payment_date)
update invoices
set payment_total = 20.50, payment_date = '2019-01-23'
where invoice_id = 1;

update invoices
set payment_total = 72.90, payment_date = '2019-06-20'
where invoice_id = 3;

update invoices
set payment_total = 31.19, payment_date = '2019-01-28'
where invoice_id = 4;

update invoices
set payment_total = 100.99, payment_date = due_date
where invoice_id = 5;


update invoices   -- update multiple rows(payment_total,payment_date)
set payment_total = invoice_total * 0.5,
payment_date = due_date
where invoice_id in(7,8,9,10,11,16,19);

-- create a table archived_invoices copy of tables invoices and clients, i only select some attributes of the tables 
create table archived_invoices as
select 
   i.invoice_id,
   i.number,
   c.name as client_name,
   i.invoice_total,
   i.payment_total,
   i.invoice_date,
   i.payment_date,
   i.due_date
from sql_invoicing.invoices i
join sql_invoicing.clients c using(client_id)  -- alternative: on i.client_id = c.client_id
where payment_date is not null;   -- delete rows that has payment-date value NULL