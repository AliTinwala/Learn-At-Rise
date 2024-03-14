use FullStack;

create table emptbl
(
	EmpID int primary key identity(100,1),
	EmpName varchar(20),
	DeptID int not null,
	TeamID int not null,
	Process varchar(20) constraint CHK_Process check( Process in ('Permanent Employee','Training','Probation')),

)