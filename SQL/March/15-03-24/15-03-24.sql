use FullStack;

create table emptbl
(
	EmpID int primary key identity(100,1),
	EmpName varchar(20),
	DeptID int not null,
	TeamID int not null,
	Process_training
)