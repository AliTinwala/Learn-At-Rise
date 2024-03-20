use AdventureWorksLT2017

-- Scalar Functions
-- 1. Show the number of customers living in a country. (JOIN)
create or alter function FN_NoOfCustomers(@country varchar(30))
returns int
as
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

-- 2. Count the number of products of specific colour (JOIN)
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

-- 3. Select average unit price of product. (Subquery)
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

-- 4. Select total cost of product. (Subquery)
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

-- 5. Find highest Subtotal value of product using subquery
create or alter function HighestBillForProduct(@CustomerID  int)
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

select dbo.HighestBillForProduct(29847);

-- 6.
-- 7.  

-- Inline Functions
-- 1.  GetProductDetailsbyOrder
create or alter function GetProductDetailsByOrder(@ProductID int)
Returns table 
As
return (Select SOD.ProductID , SP.Name As productName , SOD.UnitPrice As UnitPrice , SOD.OrderQty As Orderqty   From SalesLT.SalesOrderDetail SOD 
join SalesLT.Product SP on SP.ProductID = SOD.ProductID Where SP.ProductID = @ProductID)

select * from dbo.GetProductDetailsByOrder(836);
-- 2. 
-- 3. 
-- 4.  
-- 5. 
-- 6. 
-- 7. 

-- Multiline Functions
-- 1. 
-- 2. 
-- 3. 
-- 4.  
-- 5. 
-- 6. 
-- 7. 


