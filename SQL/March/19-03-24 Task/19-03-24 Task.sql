use AdventureWorksLT2017

-- Scalar Functions
-- 1. Show the number of customers living in a country.
create or alter function FN_NoOfCustomers(@country varchar(30))
returns int
begin
	declare @count int
	select @count = count(*) from SalesLT.Customer
	join SalesLT.CustomerAddress
	on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
	join SalesLT.[Address]
	on SalesLT.CustomerAddress.AddressID = SalesLT.[Address].AddressID
	where CountryRegion = @country
	return @count
end

declare @country varchar(30)
set @country = 'United States'
select dbo.FN_NoOfCustomers(@country) as 'No of Customers'

-- 2. Count the number of products of specific colour
create or alter function FN_NoOfProductsByColour(@product varchar(30),@color varchar(20))
returns int
as
begin
	declare @count int
	select @count = count(*) from SalesLT.Product
	join SalesLT.ProductCategory
	on SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID
	where SalesLT.ProductCategory.[Name] = @product and SalesLT.Product.Color = @color
	return @count
end

select dbo.FN_NoOfProductsByColour('Road Frames','Black')

-- 3. Select average unit price of product.
create or alter function FN_AvgUnitPriceOfProduct(@product varchar(40))
returns int
as
begin
	declare @avg money
	select @avg = avg(SalesLT.SalesOrderDetail.UnitPrice) from SalesLT.SalesOrderDetail
	where SalesLT.SalesOrderDetail.ProductID in (select  ProductID from SalesLT.Product
	where SalesLT.Product.[Name] = @product)
	return @avg
end

select dbo.FN_AvgUnitPriceOfProduct('ML Road Frame-W - Yellow, 48')

-- 4. Select total cost of product.
create or alter function FN_TotalUnitPriceOfProduct(@product varchar(40))
returns int
as
begin
	declare @total money
	select @total = sum(SalesLT.SalesOrderDetail.LineTotal) from SalesLT.SalesOrderDetail
	where SalesLT.SalesOrderDetail.ProductID in (select  ProductID from SalesLT.Product
	where SalesLT.Product.[Name] = @product)
	return @total
end

select dbo.FN_TotalUnitPriceOfProduct('ML Road Frame-W - Yellow, 48')

-- 5. Find highest Subtotal value of product
create or alter function HighestBillForCustomer(@CustomerID  int)
returns Money
as
begin
    declare @subtotal money;
    select @subtotal = max(SalesLT.SalesOrderHeader.SubTotal)
    from SalesLT.SalesOrderHeader 
	where SalesLT.SalesOrderHeader.CustomerID in (select SalesLT.Customer.CustomerID from SalesLT.Customer 
	where CustomerID = @CustomerID)
	return @subtotal;
end;

select dbo.HighestBillForCustomer(29847)  as 'Highest Bill For Customer';

-- 6. Select sum of total due of a customer
create or alter function SumOfTotalDueForCustomer(@CustomerName  varchar(30))
returns money
as
begin
    declare @totaldue money;
    select @totaldue = sum(SalesLT.SalesOrderHeader.TotalDue)
    from SalesLT.SalesOrderHeader 
	where SalesLT.SalesOrderHeader.CustomerID in (select SalesLT.Customer.CustomerID from SalesLT.Customer 
	where FirstName = @CustomerName)
	return @totaldue;
end;

select FirstName from SalesLT.Customer where SalesLT.Customer.CustomerID = 29847;

declare @FirstName varchar(30)
set @FirstName = 'David';
select dbo.SumOfTotalDueForCustomer(@FirstName) as 'Sum of Total Due For Customer'

-- 7.  Select product that has quantity maximum
create or alter function GetProductNameByQuantity()
returns varchar(40)
as
begin
	declare @name varchar(30)
	select @name = SalesLT.Product.[Name] from SalesLT.Product
	where SalesLT.Product.ProductID in 
	(select SalesLT.SalesOrderDetail.ProductID from SalesLT.SalesOrderDetail 
	group by SalesLT.SalesOrderDetail.OrderQty, SalesLT.SalesOrderDetail.ProductID
	having SalesLT.SalesOrderDetail.OrderQty = max(SalesLT.SalesOrderDetail.OrderQty))
	return @name
end

select dbo.GetProductNameByQuantity() as 'Product sold maximum by Quantity'

-- Inline Functions
-- 1.  Get Product Details by Order
create or alter function GetProductDetailsByOrder(@ProductID int)
returns table 
As
return (Select SOD.ProductID , SP.Name As productName , SOD.UnitPrice As UnitPrice , SOD.OrderQty As Orderqty   From SalesLT.SalesOrderDetail SOD 
join SalesLT.Product SP on SP.ProductID = SOD.ProductID Where SP.ProductID = @ProductID)

select * from dbo.GetProductDetailsByOrder(836);

-- 2.  Get customer alongwith country
create or alter function GetCustomerCountry()
returns table
as
return(select firstname,countryregion from SalesLT.[Address] 
join SalesLT.CustomerAddress on SalesLT.[Address].AddressID = SalesLT.CustomerAddress.AddressID
join SalesLT.Customer on SalesLT.CustomerAddress.CustomerID= SalesLT.Customer.CustomerID );
 
 select * from dbo.GetCustomerCountry();

-- 3. Select names of company with total due more than 10000
create or alter function CompanyTotalDue()
returns table
as
return
(select SalesLT.Customer.[CompanyName] from SalesLT.Customer
join SalesLT.SalesOrderHeader
on SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID
where (select sum(SalesLT.SalesOrderHeader.TotalDue) from SalesLT.SalesOrderHeader) > 10000
group by SalesLT.SalesOrderHeader.TotalDue,SalesLT.Customer.[CompanyName]
)

select * from dbo.CompanyTotalDue();

-- 4.  Get Product Category by Product id
create or alter function ProductCategoryByProductId(@id int)
returns table
as
return
(select SalesLT.Product.ProductID,SalesLT.ProductCategory.[Name] as 'Product Category' from SalesLT.ProductCategory
join SalesLT.Product 
on SalesLT.ProductCategory.ProductCategoryID = SalesLT.Product.ProductCategoryID
where ProductID = @id)

select * from dbo.ProductCategoryByProductId(680)

-- 5. Details of all products
create or alter function GetAllProducts()
returns table
as
return(select * from SalesLT.Product)

select * from GetAllProducts()

-- 6. Get Customer Details who pay highest tax
create or alter function GetAllCustomers()
returns table
as
	return
	(
		select * from SalesLT.Customer
		where SalesLT.Customer.CustomerID in 
		(
			select CustomerID from SalesLT.SalesOrderHeader
			where SalesLT.SalesOrderHeader.TaxAmt = (select max(SalesLT.SalesOrderHeader.TaxAmt ) from SalesLT.SalesOrderHeader)
		)
	)

select * from GetAllCustomers()

-- 7. Get product details of maximum sold product
create or alter function GetMaximunSoldProduct()
returns table
as
return(select * from SalesLT.Product
where SalesLT.Product.ProductID in 
(select SalesLT.SalesOrderDetail.ProductID from SalesLT.SalesOrderDetail 
group by SalesLT.SalesOrderDetail.OrderQty, SalesLT.SalesOrderDetail.ProductID
having SalesLT.SalesOrderDetail.OrderQty = max(SalesLT.SalesOrderDetail.OrderQty)));

select * from dbo.GetMaximunSoldProduct();

-- Multiline Functions

-- 1. Get Customers who have bike company
create or alter function GetBikeCompaniesWithOwner()
returns @Table table (CompanyName varchar(50), FirstName varchar(30), LastName varchar(30))
as
begin
  insert into @Table
    select CompanyName, FirstName, LastName
    from SalesLT.Customer
	where CompanyName like '%Bike%'
	group by CompanyName,FirstName, LastName
  return
end

select * from GetBikeCompaniesWithOwner()

-- 2. Get all customers with their country
create or alter function GetCustomerWithCountry()
returns @Table table (FirstName varchar(50),  LastName varchar(30), CountryRegion varchar(30))
as
begin
  insert into @Table
    select FirstName, LastName, CountryRegion
    from SalesLT.Customer
	join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID  = SalesLT.CustomerAddress.CustomerID
	join SalesLT.[Address] on SalesLT.CustomerAddress.AddressID = SalesLT.[Address].AddressID
	group by CountryRegion,FirstName, LastName
  return
end

select * from GetCustomerWithCountry()

-- 3. Get customer details
create or alter function GetCustomers()
returns @Table table (FirstName varchar(50),  LastName varchar(30))
as
begin
  insert into @Table
    select FirstName, LastName
	from SalesLT.Customer
	group by FirstName, LastName
	order by FirstName
  return
end

select * from GetCustomers()

-- 4. Get Product Details whose size is L
create or alter function GetProductBySize()
returns @Table table ([Name] varchar(50),Size varchar(2),ListPrice money)
as
begin
  insert into @Table
    select [Name],Size,ListPrice
	from SalesLT.Product
	where Size = 'L'
	group by Size,[Name],ListPrice
  return
end

select * from GetProductBySize()

-- 5. Get Product details by Unit Price
create or alter function SalesDetailByUnitPrice()
returns @Table table ([Name] varchar(50),UnitPrice money)
as
begin
  insert into @Table
    select [Name],UnitPrice
	from SalesLT.Product
	join SalesLT.SalesOrderDetail on SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
	where SalesLT.SalesOrderDetail.UnitPrice > 500
	group by [Name],UnitPrice
  return
end

select * from SalesDetailByUnitPrice()

-- 6. Get product details of total sold product
create or alter function GetProductBySell()
returns @Table table ([Name] varchar(50))
as
begin
  insert into @Table
    select [Name] from SalesLT.Product
	join SalesLT.SalesOrderDetail
	on SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
	where OrderQty in (select max(SalesLT.SalesOrderDetail.OrderQty) from SalesLT.SalesOrderDetail)
	group by SalesLT.SalesOrderDetail.ProductID,[Name]
  return
end

select * from GetProductBySell()

-- 7. select all products
create or alter function GetProducts()
returns @Table table ([Name] varchar(50),  Color varchar(30))
as
begin
  insert into @Table
    select [Name], Color
	from SalesLT.Product
	group by [Name], Color
	order by [Name]
  return
end

select * from GetProducts()



