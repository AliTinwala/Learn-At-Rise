CREATE DATABASE BankingSystem

use BankingSystem

drop table txntbl

create table txntbl
(
	id int identity(1,1) constraint PK_id primary key,
	acc_id int not null,
	dateoftxn date not null default(getdate()),
	typeoftxn char(2) not null check (typeoftxn in ('Cheque','CW','CD')),
	txn_amt money not null
)

drop table acc_mastertbl

create table acc_mastertbl
(
	acc_id int identity(1,1) not null,
	acc_holder_name varchar(20) not null,
	netbalance money not null default(0),
	unclear_balance money not null,
	acc_status varchar(20) not null constraint chk_status check(acc_status in ('Active','Inactive'))
)

insert into acc_mastertbl values('Ali',0,'Active')

select * from acc_mastertbl

drop trigger trg_balanceUpdates

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

	set @countdate = 1

	set @totalamt = 0

	select @id = acc_id , @typeoftxn = typeoftxn, @amount = txn_amt, @dateoftxn = dateoftxn from inserted

	select @status = acc_status from acc_mastertbl where acc_id = @id

	set @countdate = (select count(*) from txntbl where typeoftxn = 'CW' and acc_id = @id GROUP BY acc_id,dateoftxn)

	set @totalamt = (select sum(txn_amt) from txntbl where acc_id = @id and typeoftxn = 'CW' GROUP BY acc_id,dateoftxn) 

	set @netbalance = (select netbalance from acc_mastertbl where acc_id = @id)

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
			if(@totalamt <= 40000 and @totalamt <= @netbalance)
			BEGIN
				--print '<=40000'
				--print @countdate
				if(@countdate <= 3)
				begin
					print @totalamt
					update acc_mastertbl
					set netbalance = netbalance - @amount
					where acc_id = @id
				end
				else
				begin
					print ('Cannot withdraw total amount <= 40000 more than 3 times in a day')
					rollback
				end
			END
			else if((@totalamt >= 40001 and @totalamt <=100000) and @totalamt <= @netbalance)
			BEGIN
				--print '>=40000 and <=100000'
				--print @countdate
				if(@countdate = 1)
				begin
					print @totalamt
					update acc_mastertbl
					set netbalance = netbalance - (@amount + (@amount * 0.1))
					where acc_id = @id
				end
				else
				begin
					print ('Can withdraw total amount between 40,001 and 1,00,000 only once in a day')
					rollback
				end
			END
			ELSE
			BEGIN
				--print @countdate
				--print 'Error'
				--print @totalamt
				print concat('Cannot withdraw ',@amount,' from ',' account no. ',@id)
				rollback
			END
		end
		else if(@typeoftxn = 'Cheque')
		begin
			print 'Cheque'
			if(@netbalance <= @amount)
			begin
				update acc_mastertbl
				set unclear_balance = unclear_balance + @amount
				where acc_id = @id	
			end
		end
	end
end

select * from acc_mastertbl
select * from txntbl

insert into acc_mastertbl (acc_holder_name,netbalance,unclear_balance,acc_status) values('Ali',0,0,'Active')
insert into acc_mastertbl (acc_holder_name,netbalance,unclear_balance,acc_status) values('Het',0,0,'Active')
insert into acc_mastertbl  (acc_holder_name,netbalance,unclear_balance,acc_status) values('Hetvi',0,0,'Inactive')

insert into txntbl (acc_id,typeoftxn,txn_amt) values(1,'CD',100000)
insert into txntbl (acc_id,typeoftxn,txn_amt) values(2,'CD',100000)
insert into txntbl (acc_id,typeoftxn,txn_amt) values(3,'CD',100000)
	
insert into txntbl (acc_id,typeoftxn,txn_amt)values(1,'CW',1000) 
insert into txntbl (acc_id,typeoftxn,txn_amt)values(2,'CW',40500)
insert into txntbl (acc_id,typeoftxn,txn_amt)values(2,'CW',100500)
insert into txntbl(acc_id,typeoftxn,txn_amt)values(3,'CW',10000)

select acc_id,dateoftxn,count(*) from txntbl where typeoftxn = 'CW' and acc_id = 1 GROUP BY acc_id,dateoftxn

truncate table txntbl
truncate table acc_mastertbl