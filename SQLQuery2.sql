CREATE OR REPLACE PROCEDURE summary_order_status @StatusID int
AS
Begin
	Select
		f.OrderID,
		dc.CustomerName,
		dp.ProcedureName,
		f.Quantity,
		dso.StatusOrder
	From FactSalesOrder f
	Join DimCustomer dc ON f.CustomerID = dc.CustomerID
	Join DimCustomer dp ON f.ProductID = dp.ProductID
	Join DimStatusOrder dso ON f.StatusID = dso.StatusID
	Where f.StatusID = @StatusID
END;


CREATE OR ALTER PROCEDURE summary_order_status (@StatusID int)
AS
BEGIN
    SELECT f.OrderID,
           dc.CustomerName,
           dp.ProductName,
           f.Quantity,
           dso.StatusOrder
    FROM FactSalesOrder f
    JOIN DimCustomer dc ON f.CustomerID = dc.CustomerID
    JOIN DimProduct dp ON f.ProductID = dp.ProductID
    JOIN DimStatusOrder dso ON f.StatusID = dso.StatusID
    WHERE f.StatusID = @StatusID;
END;


EXEC dbo.summary_order_status @StatusID = 3;