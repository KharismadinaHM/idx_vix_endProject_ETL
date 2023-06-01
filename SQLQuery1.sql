use DWH_Project;

Create table DimCustomer (
CustomerID int Not Null,
CustomerName varchar(100),
Age int,
Gender varchar(10),
City varchar(25),
NoHP varchar(20),
Primary Key (CustomerID));






Create table DimProduct(
ProductID int Not Null,
ProductName varchar(100),
ProductCategory varchar(100),
ProductUnitPrice int,
Primary Key (ProductID));









Create table DimStatusOrder(
StatusID int Not Null,
StatusOrder varchar(100),
StatusOrderDesc varchar(100),
Primary Key (StatusID));








Create table FactSalesOrder(
OrderID Int Not Null Primary Key,
CustomerID Int,
ProductID int,
Quantity int,
Amount int,
StatusID int,
OrderDate Date,
CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) References DimCustomer,
CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) References DimProduct,
CONSTRAINT FK_StatusID FOREIGN KEY (StatusID) References DimStatusOrder);











select * from FactSalesOrder;

select * from DimCustomer;

select * from DimProduct;

select * from DimStatusOrder;

delete from FactSalesOrder;
delete from DimCustomer;
delete from DimProduct;
delete from DimStatusOrder;



drop table DimStatusOrder;
drop table FactSalesOrder;
drop table DimCustomer;
drop table DimProduct;








use Staging;

select * from product;