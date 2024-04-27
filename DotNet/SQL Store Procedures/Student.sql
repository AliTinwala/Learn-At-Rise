Use  FullStack

select * from Student

Create Table Student(
S_Id int primary key identity,
S_Name varchar(20) not null,
S_Age int not null,
S_Email varchar(50) not null)


Create proc Sp_InsertStudent
(@S_Id int , 
@S_Name varchar(20),
@S_Age int ,
@S_Email varchar(20) )
As
   Begin 
          Insert into Student
		 Values (
		 @S_Name,
		 @S_Age,
		 @S_Email )
		Set @S_Id = SCOPE_IDENTITY()
	END


Create proc Sp_UpdateStudent
(@S_Id int , 
@S_Name varchar(20),
@S_Age int ,
@S_Email varchar(20) )
As
   Begin 
          Update  Student 
		  set S_Name =@S_Name,
		  S_Age = @S_Age,
		  S_Email =@S_Email
		  Where  S_Id =@S_Id

END

Create proc Sp_GetStudentDetails

as
  begin 
         Select * From Student

	END


Create proc Sp_GetStudentDetailsByID
(@S_Id int )
as
  begin 
         Select 
		 S_Name,
		 S_Age,
		 S_Email
		 From Student
		 Where S_Id = @S_Id

	END

Create proc Sp_StudentDeleteByID
(@S_Id int )
as
  begin 
         Delete 
		 From Student
		 Where S_Id = @S_Id

	END