CREATE DATABASE Trg_BankingSystem

use Trg_BankingSystem

drop table txntbl

create table txntbl
(
	id int identity(1,1) constraint PK_id primary key,
	acc_id int not null,
	dateoftxn date not null default(getdate()),
	typeoftxn char(2) not null check (typeoftxn in ('Cheque','CW','CD')),
	txn_amt money not null
)

create table or alter acc_mastertbl
(
	acc_id int identity(1,1) not null,
	acc_holder_name varchar(20) not null,
	netbalance money,
	acc_status varchar(20) not null constraint chk_status check(acc_status in ('Active','Inactive'))
)

insert into acc_mastertbl values('Ali',0,'Active')
GO

select * from acc_mastertbl
go

drop trigger trg_balanceUpdates
go

select acc_id,dateoftxn,count(*) from txntbl where typeoftxn = 'CW' and acc_id = 1 GROUP BY acc_id,dateoftxn

go
create or alter trigger trg_balanceUpdates
on txntbl
after insert,update,delete
as
begin

	declare @id int,
	@status varchar(20),
	@typeoftxn varchar(20),
	@dateoftxn datetime,
	@amount money,
	@netbalance money,
	@countdate int,
	@totalamt money
	set @countdate = 0

	print @countdate

	set @totalamt = 0

	select @id = acc_id , @typeoftxn = typeoftxn, @amount = txn_amt,@dateoftxn = dateoftxn from inserted

	select @status = acc_status from acc_mastertbl where acc_id = @id

	if(@status = 'Inactive')
	begin
		print 'Account is closed'
		rollback
	end
	else
	begin
		if(@typeoftxn = 'CD')
		begin
			update acc_mastertbl
			set netbalance = netbalance + @amount
			where acc_id = @id
		end
		else if (@typeoftxn = 'CW')
		begin
			set @countdate = (select count(*) from txntbl where typeoftxn = 'CW' and acc_id = @id GROUP BY acc_id,dateoftxn)
			set @totalamt = @totalamt + @amount
			print @totalamt
			if(@countdate <= 3 and @totalamt <= 40000)
			BEGIN
				print @countdate
				update acc_mastertbl
				set netbalance = netbalance - @amount
				where acc_id = @id
			END
			else if(@totalamt between 40001 and 100000 and @countdate = 1)
			BEGIN
				print @countdate
				update acc_mastertbl
				set netbalance = netbalance - (@amount + (@amount * 0.1))
				where acc_id = @id
			END
			ELSE
			BEGIN
				print @countdate
				print 'You cannot withdraw total more than 40000 more than 3 times a day'
				ROLLBACK
			END
		end
	end
end

select * from acc_mastertbl
select * from txntbl

insert into acc_mastertbl values('Ali',0,'Active')
insert into acc_mastertbl values('Het',0,'Active')

insert into txntbl (acc_id,typeoftxn,txn_amt) values(1,'CD',100000)
insert into txntbl (acc_id,typeoftxn,txn_amt) values(2,'CD',100000)
	
insert into txntbl (acc_id,typeoftxn,txn_amt)values(1,'CW',41000)
insert into txntbl (acc_id,typeoftxn,txn_amt)values(2,'CW',41000)

select count(*) from txntbl where typeoftxn = 'CW' and acc_id = 1 GROUP BY acc_id,dateoftxn

truncate table txntbl
truncate table acc_mastertbl