create database AssessmentMarch2024;

use AssessmentMarch2024;

drop table student;

-- 1.	You have a table with semester – wise percent of marks. (decimal in 2 digits only)
create table student
(
	Student_ID int primary key,
	Student_Name varchar(20),
	Sem1 decimal(5,2),
	Sem2 decimal(5,2),
	Sem3 decimal(5,2),
	Sem4 decimal(5,2),
	Sem5 decimal(5,2),
	Sem6 decimal(5,2)
);

insert into student values (1,'A', 67.1,	64.3,	65.4,	66.8,	79.2,	81.4);
insert into student values (2,'B',76.1,73.3,72.1,59,57,61);
insert into student values (3,'C',67,63.2,65.1,67.6,71.4,75.2);
insert into student values (4,'D',75.3,	77.2,	75.1,	78.9,	81.5,	82);
insert into student values (5,'E',79.2,81.3,77.3,74.3,83.6,87.3);

select * from student

-- (a). Write a SQL query which provides aggregated percentage as an output for each student. 
select Student_ID,Student_Name, (Sem1 +Sem2 + Sem3 + Sem4 + Sem5 + Sem6) as 'Total Percentage'
from student

-- (b). What is the max percentage obtained by any students? 
select *,(Sem1 +Sem2 + Sem3 + Sem4 + Sem5 + Sem6) from student
where (Sem1 +Sem2 + Sem3 + Sem4 + Sem5 + Sem6) =  (select max((Sem1 +Sem2 + Sem3 + Sem4 + Sem5 + Sem6)) from student)

-- (c). Write a SQL query to find out combination of top 5% students with bottom 5% students based on sequential storage order of avg percent.
select top 5 *,avg(Sem1 +Sem2 + Sem3 + Sem4 + Sem5 + Sem6) as 'Average'
from student
group by Student_ID,Student_Name, Sem1 , Sem2 , Sem3 , Sem4 , Sem5 , Sem6
order by  'Average' desc


-- (d). Create a store procedure to find out grade as per their overall percentage by passing name of the student as input. The range of percent for grade are as follows.
-- 0-59% - unsatisfactory
-- 60-69% - need improvement
-- 70-79% - satisfactory
-- 80-89% - good
-- 90-100% - excellent
create or alter proc SP_Grade
@name varchar(10)
as
begin
	declare @total decimal(5,2)
	set @total = (select (Sem1+Sem2+Sem3+Sem4+Sem5+Sem6) from student where Student_Name = @name)
	set @total = @total / 6;
	if @total >=0 and @total <=59
		print 'unsatisfactory'
	else if @total >= 60 and @total <= 69
		print 'need improvement'
	else if @total >= 70 and @total <=79
		print 'satisfactory'
	else if @total >= 80 and @total <= 89
		print 'good'
	else if @total >= 90 and @total <= 100
		print 'excellent'
end

exec SP_Grade
@name = 'A'

-- 2.	You have a table with date of delivery of multiple products. 
create table product
(
	ProductID int,
	CustomerName varchar(20),
	Delivery_Date_PC date,
	Delivery_Date_AC date,
	Delivery_Date_Phone date
);

insert into product values(1,	'A','2022-10-19','2022-09-07','2022-12-29');
insert into product values(2,'B',	'2023-01-30',	'2022-12-26	','2022-11-30');
insert into product values(3	,'C'	,'2022-04-20	','2022-10-08',	'2022-12-26');
insert into product values(4	,'D','2022-08-14','2022-09-17','2022-12-19');
insert into product values(5	,'E',	'2022-12-30','2023-01-18',	'2022-12-13');

select * from product;

--2. (a) Write a SQL query which tells when each consumer received all the products.

select p.CustomerName,p1.ProductID,p1.Delivery_Date_AC,p1.Delivery_Date_PC,p1.Delivery_Date_Phone from product p
cross join product p1

-- 2. (b) Write a SQL query which tells when each consumer received their first product.
select p.CustomerName,p1.ProductID,p1.Delivery_Date_AC,p1.Delivery_Date_PC,p1.Delivery_Date_Phone from product p
cross join product p1
where P1.ProductID = 1;

-- 3. 3.	Mr. A, CEO of a top HR firm was passing by the corridor wen he heard one of the senior manager asking his junior about the appraisal cycle near tea machine. This made her curious about those employees who joined earlier than their reporting managers. Can you help Mr. A in finding those employee who have joined before their reporting managers?
create table emp
(
	EmpID int,
	EmpName varchar(20),
	ManagerID int,
	DOJ date
);

insert into emp values(1,'Tom',Null,'2021-02-01');
insert into emp values(2,	'Ronak',1,'2021-07-25');
insert into emp values(3,'Shreyansh',2,'2021-10-31');
insert into emp values(4,'Ravi'	,2,'2021-7-17');

select * from emp;

select e.EmpID,e.EmpName,e.DOJ from emp e
join emp m
on e.EmpID = m.ManagerID
and e.DOJ < m.DOJ

-- 4.	Create a calculator to find age of the person as per DOB pass in the input parameter 
-- (Eg.  If DOB -13-01-1990 so age get calculate 34yrs and 2months)
create or alter proc SP_DOB
@dob date
as
begin
	declare @d int,@m int, @y int,@msg varchar(50), @currentdatetime datetime
	set @currentdatetime =getdate()
	set @y = datediff(year,@dob,@currentdatetime)
	set @m = datediff(month,@dob,@currentdatetime)-(datediff(year,@dob,@currentdatetime)*12)  
	set @d = datepart(d,@currentdatetime)-datepart(d,@dob)

	declare @age date
	set @msg = concat(@y,' yrs ',@m,' months ',@d,' days ')
	print @msg
end

exec SP_DOB '1997-02-15'