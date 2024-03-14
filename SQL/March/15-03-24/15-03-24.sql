use FullStack;

drop table TeamTbl
drop table EmpHistory
drop table DeptTbl
drop table EmpTbl

create table EmpTbl
(
	EmpID int primary key identity(100,1),
	EmpName varchar(20),
	DeptID int not null,
	TeamID int not null,
	Probation_status varchar(20) constraint CHK_EmpTbl_Process check(Probation_status in ('Training','Probation','Permanent')),
	Job_Title varchar(30),
	DOJ date,
	Total_Experience int,
	Reporting_Manager varchar(20),
	Work_Office varchar(20),
	Emp_Status varchar(20),
	Date_of_Resignation date,
	Date_of_Relieving date,
	Salary money
);

create table DeptTbl
(
	DeptID int primary key identity(100,1),
	DeptName varchar(20),
	TechStack varchar(20),
	BD varchar(3),
	Support_Service varchar(20) constraint CHK_DeptTbl_Support_Service check(Support_Service in ('Customer','Technical','Administrative')),
	HOD varchar(20)
);

create table EmpHistory
(
	EmpHistID int primary key identity(100,1),
	DeptID int,
	EmpID int,
	Date_of_Resignation date,
	Date_of_Relieving date
	constraint FK_EmpHistory_DeptID foreign key (DeptID) references DeptTbl(DeptID),
	constraint FK_EmpHistory_EmpID foreign key (EmpID) references EmpTbl(EmpID)
);

create table TeamTbl
(
	TeamID int primary key identity(100,1),
	DeptID int,
	TeamName varchar(20),
	constraint FK_TeamTbl_DeptID foreign key (DeptID) references DeptTbl(DeptID)
);

INSERT INTO EmpTbl (EmpName, DeptID, TeamID, Probation_status, Job_Title, DOJ, Total_Experience, Reporting_Manager, Work_Office, Emp_Status, Date_of_Resignation, Date_of_Relieving, Salary)
VALUES 
('Alice Johnson', 101, 1, 'Probation', 'Software Engineer', '2023-01-15', 2, 'Jane Smith', 'Headquarters', 'Active', NULL, NULL, 60000),
('Bob Williams', 102, 2, 'Probation', 'Software Engineer', '2023-02-20', 1, 'John Doe', 'Branch Office', 'Active', NULL, NULL, 55000),
('Charlie Brown', 101, 1, 'Permanent', 'Senior Software Engineer', '2021-05-10', 5, 'Jane Smith', 'Headquarters', 'Active', NULL, NULL, 70000),
('David Miller', 103, 3, 'Probation', 'Software Developer', '2023-03-18', 2, 'Alice Johnson', 'Headquarters', 'Active', NULL, NULL, 60000),
('Emily Davis', 101, 1, 'Training', 'Intern', '2024-01-20', 0, 'Charlie Brown', 'Branch Office', 'Active', NULL, NULL, 40000),
('Frank Johnson', 104, 4, 'Probation', 'Junior Developer', '2023-04-25', 1, 'David Miller', 'Headquarters', 'Active', NULL, NULL, 50000),
('Grace Wilson', 101, 1, 'Permanent', 'Senior Developer', '2020-07-10', 6, 'Charlie Brown', 'Headquarters', 'Active', NULL, NULL, 80000),
('Henry Clark', 105, 5, 'Probation', 'Software Engineer', '2023-05-30', 2, 'Frank Johnson', 'Branch Office', 'Active', NULL, NULL, 60000),
('Ivy Martinez', 102, 2, 'Training', 'Intern', '2024-02-20', 0, 'Bob Williams', 'Headquarters', 'Active', NULL, NULL, 40000),
('Jackie Young', 106, 6, 'Probation', 'Software Engineer', '2023-06-15', 1, 'Henry Clark', 'Branch Office', 'Active', NULL, NULL, 55000);

select * from EmpTbl;
select * from DepttBL;

if select [name] from sys.tables = 'DeptTbl'
	begin
		print
	end
else
	begin
	end

select * from sys.tables;