use FullStack

create or alter procedure SPSimpleInterest 
@principal money,
@roi money,
@tenure int
as
begin
	declare @p money,@r money,@count int,@si decimal,@total_amount decimal;
	select @r = @roi * 0.01;
	select @p = @principal * 12;
	select @count = 1;
	print concat('Year',' ','Principal',' ','Amount Received');
	while @count <= @tenure
	begin
		select @si = (@p * @r * @tenure) * 0.01;
		select @total_amount = @p + @si;
		print concat(@count,' ',@p,' ',@total_amount);
		select @p = @p + @total_amount;
		select @count = @count + 1;
	end
end
go

exec SPSimpleInterest
@principal = 5000,
@roi = 10,
@tenure = 15
