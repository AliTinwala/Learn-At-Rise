Create Database Triggers1

Use Triggers1;

Create Table EmpTbl(
EmpID int primary key ,
empname varchar(20) not null,
salary money check(salary >= 0) not null ,
empStatus varchar(10) not null check (empStatus in ('Active' , 'Exit') )
);



------------insert, Update , Delete 
Alter Trigger trg_EmpOperation 
on  EmpTbl
For insert , Update , Delete 
As
begin

 If  Exists (select * From inserted)
	if exists(select * from deleted)
	begin
		insert into Audit_EmpDetails_UID ( [EmpID], [empname], [salary], [empStatus], [Operation])
		Select * , 'Update' from deleted
	end
	else
	 begin
	   insert into Audit_EmpDetails_UID ( [EmpID], [empname], [salary], [empStatus], [Operation])
	   Select * , 'insert' from inserted
	end
	else

	 if exists(select * From deleted)
	begin
		insert into Audit_EmpDetails_UID ( [EmpID], [empname], [salary], [empStatus], [Operation])
		Select * , 'delete' from deleted  
	end
  End


  insert into EmpTbl 
  Values (4 , 'Neha' , 10000 ,'Active')

 update EmpTbl 
set salary = 1000
where EmpID = 4

delete from EmpTbl where EmpID =3

Select * From EmpTbl
select * From Audit_EmpDetails_UID