create database LibraryManagementSystem

use LibraryManagementSystem

drop table Category
-- Book Categories:- Business,Language & Communication, Soft Skill, Technology
create table Category
(
	category_id int primary key identity(1,1),
	category_name varchar(40)
)
insert into Category values('Business'),('Language & Communication'),('Soft Skill'),('Technology')

select * from Category

drop table Student_Details

create table Student_Details
(
	enrolment_id int identity(1,1) primary key,
	student_name varchar(20),
	dept_id int not null,
	contact_details varchar(10),
	date_of_admission date default(getdate()),
	email_id varchar(20),
	student_status varchar(20) check(student_status in('Active','Inactive'))
)

insert into Student_Details(student_name,dept_id,contact_details,student_status) values ('Ali',1,'9099076397','Active')
insert into Student_Details(student_name,dept_id,contact_details,student_status) values ('Het',2,'9825741754','Active')
insert into Student_Details(student_name,dept_id,contact_details,student_status) values ('Shravan',3,'9876543215','Inactive')
insert into Student_Details(student_name,dept_id,contact_details,student_status) values ('Sunita',4,'6589123045','Active')

select * from Student_Details

truncate table Student_Details

go
create or alter trigger Student_email
on Student_Details
after insert,update,delete
as
begin 
	declare @id int
	set @id = (select enrolment_id from inserted)
	update Student_Details set email_id = student_name where enrolment_id = @id
end
go

drop table Book_Details

create table Book_Details
(
	book_id int identity(1,1) primary key,
	book_name varchar(20),
	author varchar(40),
	publisher varchar(40),
	edition int not null default(1),
	category_id int not null,
	available_stock int not null default(0)
)
-- 1 Business
-- 2 Language & Communication
-- 3 Soft Skill
-- 4  Technology

insert into Book_Details (book_name,author,publisher,category_id,available_stock) 
values ('Shoe Dog','Phil Knight','Phil Knight',1,7),
('Lean Startup','Eric Ries','Eric Ries',1,5),
('Talk like TED','Carmine Gallo','Carmine Gallo',2,10),
('Just Listen','Mark Goulston','Mark Goulston',2,6),
('The Soft Skills','Dan White','Dan White',3,4),
('Soft Skills','John Sonmez','John Sonmez',3,2),
('Digital Minimalism','Cal Newport','Cal Newport',4,7),
('Steve Jobs','Walter Isaacson','Walter Isaacson',4,10)

select * from Book_Details

drop table Book_Issuing_Details

create table Book_Issuing_Details
(
	txn_id int primary key identity(1,1),
	book_id int not null,
	student_id int not null,
	date_of_issue date not null default(getdate()),
	penalty int not null default(0),
	issue_status varchar(20) check(issue_status in('Issued','Returned')) default('Issued')
)

go

-- Date of return  - 15 days after issuing date
-- after 15 day at 10'o clock if book is not returned charge 1 Rs per day(including Sat & Sun)
-- can issue max 3 books in total per student
-- student must return any one book from 3 books issued then, he/she can issue another book
-- change status to returned when book is returned
-- make a table of books issued by student in 180 days.

create or alter trigger Trg_Student
on  Book_Issuing_Details
after insert,update,delete
as
begin
	declare @b_id int,@s_id int,@doi date,@penalty int,@status varchar(20)

	select @b_id = book_id,@s_id = student_id,@doi = date_of_issue,@penalty = penalty,@status = issue_status from Book_Issuing_Details
	
	print concat(@b_id ,' ',@s_id,' ',@doi,' ',@penalty,' ',@status)
end
go

insert into Book_Issuing_Details(book_id,student_id,date_of_issue) 
values(1,1,GETDATE())

select * from Book_Issuing_Details
