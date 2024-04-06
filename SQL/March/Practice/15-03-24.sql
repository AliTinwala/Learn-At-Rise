use FullStack

select * from EmpTbl
select * from DeptTbl

select sum(salary) from EmpTbl
select *, totalsrly = sum(salary) over(),
Avg_salary = avg(salary) over(),
totalcount = count(EmpID) over(),
minsalary = min(salary) over(),
max_salary = max(salary) over() from EmpTbl
order by salary desc

select *, totalsrly = sum(salary) over(partition by DeptID),
Avg_salary = avg(salary) over(partition by DeptID),
totalcount = count(EmpID) over(partition by DeptID)
from EmpTbl

