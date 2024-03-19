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

-- 3. Select total unit price of product category. (Subquery)
create or alter function FN_TotalUnitPriceOfProduct(@product varchar(30))
returns int
as
begin
declare @total int
select @total = sum(SalesLT.SalesOrderDetail.UnitPrice) from SalesLT.SalesOrderDetail

return @total
end

select dbo.FN_TotalUnitPriceOfProduct('Road Frames','Black')


-- 4.  
-- 5. 
-- 6. 
-- 7. 

-- Inline Functions
-- 1. 
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


