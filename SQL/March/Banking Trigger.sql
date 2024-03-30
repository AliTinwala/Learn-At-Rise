CREATE DATABASE Trg_BankingSystem

use Trg_BankingSystem

create table txntbl
(
	id int identity(1,1) constraint PK_id primary key,
	acc_id int not null,
	dateoftxn datetime not null default(getdate()),
	typeoftxn char(2) not null check (typeoftxn in ('Cheque','CW','CD')),
	txn_amt money not null
)

create table acc_mastertbl
(
	acc_id int identity(1,1) not null,
	acc_holder_name varchar(20) not null,
	netbalance money,
	acc_status varchar(20) not null constraint chk_status check(acc_status in ('Active','Inactive'))
)

create table daily_txntbl
(
	acc_id int not null,
	dateoftxn datetime default(getdate()),
	countofCW int default 0
)

insert into acc_mastertbl values('Ali',0,'Active')

select * from acc_mastertbl

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
	@netbalace money,
	@countdate int,
	@totalamt money

	set @countdate = 1
	set @totalamt = 0

	select @id = acc_id , @typeoftxn = typeoftxn, @amount = txn_amt,@dateoftxn = dateoftxn   from inserted

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
			print ''	
		end
end

select * from acc_mastertbl
select * from txntbl
select * from daily_txntbl

insert into acc_mastertbl values('Ali',0,'Active')

insert into txntbl (acc_id,typeoftxn,txn_amt) values(1,'CD',100000)

insert into txntbl (acc_id,typeoftxn,txn_amt)values(1,'CW',41000)

truncate table txntbl
truncate table acc_mastertbl