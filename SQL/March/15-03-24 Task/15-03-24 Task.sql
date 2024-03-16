use FullStack;

drop table EmpHistory
drop table EmpTbl
drop table TeamTbl
drop table DeptTbl

create table DeptTbl
(
	DeptID int primary key identity(100,1),
	DeptName varchar(30),
	TechStack varchar(50),
	BD varchar(3),
	Support_Service varchar(20) constraint CHK_DeptTbl_Support_Service check(Support_Service in ('Customer','Technical','Administrative')),
	HOD varchar(20)
);

create table TeamTbl
(
	TeamID int primary key identity(100,1),
	DeptID int,
	TeamName varchar(30),
	constraint FK_TeamTbl_DeptID foreign key (DeptID) references DeptTbl(DeptID)
);

create table EmpTbl
(
	EmpID int primary key identity(100,1),
	EmpName varchar(20),
	DeptID int not null,
	TeamID int not null,
	Probation_status varchar(20) constraint CHK_EmpTbl_Process check(Probation_status in ('Training','Probation','Permanent')),
	Job_Title varchar(40),
	DOJ date,
	Total_Experience int,
	Reporting_Manager varchar(20),
	Work_Office varchar(20),
	Emp_Status varchar(20),
	Salary money
	constraint FK_EmpTbl_DeptID foreign key (DeptID) references DeptTbl(DeptID),
	constraint FK_EmpTbl_TeamID foreign key (TeamID) references TeamTbl(TeamID)
);

create table EmpHistory
(
	EmpHistID int primary key identity(100,1),
	EmpID int,
	Date_of_Resignation date,
	Date_of_Relieving date,
	constraint FK_EmpHistory_EmpID foreign key (EmpID) references EmpTbl(EmpID)
);

-- Inserting data into DeptTbl
INSERT INTO DeptTbl (DeptName, TechStack, BD, Support_Service, HOD)
VALUES 
    ('Software Development', 'Java, Python', 'Yes', 'Technical', 'Amit Sharma'),
    ('Human Resources', NULL, 'No', 'Administrative', 'Neha Patel'),
    ('Marketing', 'Digital Marketing', 'Yes', 'Customer', 'Rajesh Singh'),
    ('Finance', 'Accounting Software', 'No', 'Administrative', 'Priya Gupta'),
    ('Operations', 'Supply Chain Management', 'Yes', 'Administrative', 'Vikram Singh');

-- Inserting data into TeamTbl
INSERT INTO TeamTbl (DeptID, TeamName)
VALUES 
    (100, 'Web Development Team'),
    (100, 'Mobile App Development Team'),
    (101, 'Recruitment Team'),
    (102, 'Marketing Campaign Team'),
    (102, 'Social Media Team'),
    (103, 'Accounting Team'),
    (103, 'Budgeting Team'),
    (104, 'Logistics Team'),
    (104, 'Procurement Team'),
    (101, 'Customer Support Team');

-- Inserting data into EmpTbl
INSERT INTO EmpTbl (EmpName, DeptID, TeamID, Probation_status, Job_Title, DOJ, Total_Experience, Reporting_Manager, Work_Office, Emp_Status, Salary)
VALUES 
    ('Ananya Singh', 100, 100, 'Permanent', 'Software Engineer', '2023-01-15', 5, 'Amit Sharma', 'Office A', 'Exit', 60000),
    ('Rahul Kapoor', 100, 101, 'Permanent', 'HR Manager', '2023-02-10', 8, 'Neha Patel', 'Office B', 'Active',70000),
    ('Neha Sharma', 101, 102, 'Permanent', 'Marketing Specialist', '2023-03-20', 6, 'Rajesh Singh', 'Office C', 'Active', 55000),
    ('Amit Patel', 102, 103, 'Permanent', 'Accountant', '2023-04-05', 7, 'Priya Gupta', 'Office D', 'Active', 65000),
    ('Priya Singh', 104, 104, 'Permanent', 'Logistics Manager', '2023-05-15', 9, 'Vikram Singh', 'Office E', 'Active', 75000),
    ('Rohan Verma', 104, 105, 'Permanent', 'Procurement Officer', '2023-06-20', 4, 'Priya Gupta', 'Office F', 'Exit',50000),
    ('Anjali Rao', 101, 106, 'Permanent', 'Customer Support Representative', '2023-07-10', 3, 'Rohan Verma', 'Office G', 'Active',45000),
    ('Vivek Singh', 100, 100, 'Permanent', 'Software Engineer', '2023-08-25', 6, 'Amit Sharma', 'Office A', 'Exit', 62000),
    ('Meera Gupta', 101, 101, 'Permanent', 'Recruiter', '2023-09-15', 5, 'Rahul Kapoor', 'Office B', 'Active',58000),
    ('Kunal Sharma', 103, 103, 'Permanent', 'Financial Analyst', '2023-10-30', 7, 'Priya Gupta', 'Office D', 'Active', 68000);

INSERT INTO EmpHistory (EmpID,Date_of_Resignation,Date_of_Relieving)
VALUES
(100,'2023-03-16','2024-06-14'),
(105,'2023-03-16','2024-06-14'),
(107,'2023-03-16','2024-06-14')

select * from DeptTbl;
select * from TeamTbl;
select * from EmpTbl;
select * from EmpHistory;

create or alter proc SPEmployeeInsert
@EmpName varchar(20),
@DeptName varchar(30),
@TeamName varchar(30), 
@Probation_status varchar(20), 
@Job_Title varchar(40),
@DOJ date, 
@Total_Experience int,
@Reporting_Manager varchar(20), 
@Work_Office varchar(20), 
@Emp_Status varchar(20),
@Salary money
as
begin
declare @DeptID int,@TeamID int
set @DeptID = (select DeptID from DeptTbl where DeptName = @DeptName)
set @TeamID = (select TeamID from TeamTbl where TeamName = @TeamName)
	if (select DeptID from TeamTbl where TeamID = @TeamID) = @DeptID 
		begin
			INSERT INTO EmpTbl 
			(EmpName, 
			DeptID, 
			TeamID, 
			Probation_status, 
			Job_Title,
			DOJ, 
			Total_Experience,
			Reporting_Manager, 
			Work_Office, 
			Emp_Status,
			Salary)
			VALUES
			(
				@EmpName,
				@DeptID, 
				@TeamID, 
				@Probation_status, 
				@Job_Title,
				@DOJ, 
				@Total_Experience,
				@Reporting_Manager, 
				@Work_Office, 
				@Emp_Status,
				@Salary
			);
		end
	else
		begin
			print 'The empoyee should be in the same department';
		end
	
end
go

exec SPEmployeeInsert
@EmpName = 'Vijay',
@DeptName = 'Marketing', 
@TeamName = 'Social Media Team', 
@Probation_status = 'Training', 
@Job_Title = 'Digital Marketing',
@DOJ = '2024-03-16', 
@Total_Experience = 0,
@Reporting_Manager = 'Aman Sharma', 
@Work_Office  = 'Office E', 
@Emp_Status = 'Active',
@Salary = 0;

select * from DeptTbl;
select * from TeamTbl;
select * from EmpTbl;
select * from EmpHistory;

create or alter proc SPEmployeeResign
@EmpName varchar(30)
as
begin
	declare @EmpID int, @Emp_Status varchar(20)
	set @EmpID =  (select EmpID from EmpTbl where EmpName = @EmpName)
	set @Emp_Status = (select Emp_Status from EmpTbl where EmpID = @EmpID);

	if  @Emp_Status not in ('Resign','Exit')
		begin
			insert into EmpHistory (EmpID,Date_of_Resignation,Date_of_Relieving)
			values (@EmpID,getdate(),DATEADD(day,90,getdate()));
	
			update EmpTbl set Emp_Status = 'Resign'
			where EmpID = @EmpID;	
		end
	else
		begin
			print 'The employee has already left.'
		end
end

exec SPEmployeeResign @EmpName = 'Meera Gupta';

select * from EmpTbl;
select * from EmpHistory;

truncate table EmpHistory;
