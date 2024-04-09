create database PizzaBookingSystem

use PizzaBookingSystem

-- [customer_tbl]
-- customer_id
-- customer_name
-- contact details
-- email_id

create table customer_tbl
(
	customer_id int primary key identity(1,1),
	customer_name varchar(30),
	contact_details varchar(10),
	email_id varchar(30)
)

insert into customer_tbl(customer_name,contact_details,email_id)
values
('Ali','9099076397','Ali')

select * from customer_tbl

-- [category_tbl]
-- cid
-- c_type

create table category_tbl
(
	category_id int primary key identity(1,1),
	category_type varchar(20)
)
-- c_types are veg and non-veg pizza


--[product_tbl]
-- pid 
-- pname
-- price
-- cid

create table product_tbl
(
	product_id int primary key identity(1,1),
	product_name varchar(20),
	product_price money not null default(0),
	category_id int not null
)

-- [size_tbl]
-- size_id
-- size

create table pizza_size
(
	size_id int primary key identity(1,1),
	size varchar(20) check(size in ('S','M','L','Small','Medium','Large'))
)

-- [order_tbl]
-- oid
-- cid
-- pid
-- size_id
-- qty
-- tax
-- total_price
-- payment_id

create table order_tbl
(
	order_id int primary key identity(1,1),
	customer_id int not null,
	product_id int not null,
	size_id int not null,
	quantity int not null default(1),
	tax money not null default(0),
	total_price money not null default(0),
	payment_id int not null
)

-- Create trigger for follwing conditions
-- Mon,Tue,Thu - only one pizza -> no discount
-- Mon,Tue,Thu - min 2 orders -> 50% discount on lowest amount

-- Wed,Fri - size S - No discount
-- Wed,Fri - size M - 1 Buy + 1 Free
 
-- discount on online orders on 2nd pizza 50% discount.

-- Create a trigger for all the above conditions
go
create or alter trigger PizzzaBookingManagement
on order_tbl
after insert,update,delete
as
begin
	declare @dayoftheweek varchar(20)
	set @dayoftheweek = (select datename(dw,getdate()))
	print @dayoftheweek
end

insert into order_tbl(customer_id,product_id,size_id,quantity,tax,total_price,payment_id) 
values(1,1,1,1,10,101,1)