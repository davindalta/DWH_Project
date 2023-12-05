CREATE PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		f.OrderId,
		c.CustomerName,
		p.ProductName,
		f.Quantity,
		s.StatusOrder
	FROM FactSalesOrder AS f
	JOIN DimCustomer c ON f.CustomerId = c.CustomerId
	JOIN DimProduct p ON f.ProductId = p.ProductId
	JOIN DimStatusOrder s ON f.StatusId = s.StatusId
	WHERE s.StatusId = @StatusID
END

EXEC summary_order_status @StatusID = 1