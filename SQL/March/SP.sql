use FullStack

create or alter proc SPAdd
@a int,@b int
as
begin
	declare @total int

	set @total = @a + @b

	print concat(@a, ' + ',@b,' = ',@total)
end

exec SPAdd @a= 10, @b=20

/*
create or alter proc findAge
@dob date
as
begin
	declare @d int,@m int,@y int,@curdate date
	set @curdate = getdate()
	set @y = datediff(year,@dob,@curdate)
	set @m = datediff(month,@dob,@curdate) - @y * 12
	set @d = DATEPART(d,@curdate) - DATEPART(d,@dob)

	print concat(@y,' yr(s) ',@m,' month(s) ',@d,' day(s)')

end

exec findAge
@dob = '1997-08-06'
*/

create or alter function FN_findAge(@dob date)
returns varchar(30)
as
begin
	declare @d int,@m int,@y int,@curdate date
	set @curdate = getdate()
	set @y = datediff(year,@dob,@curdate)-1
	set @m = datediff(month,@dob,@curdate) % 12
	set @d = DATEPART(d,@curdate) - DATEPART(d,@dob)

	return concat(@y,' yr(s) ',@m,' month(s) ',@d,' day(s)')
end

select dbo.FN_findAge('1997-08-06') as [age]