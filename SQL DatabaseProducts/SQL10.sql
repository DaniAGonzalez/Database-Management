-- Retrieving the name of the product, the quantity and the price sold
select ProductID, 
			Quantity,
	(SELECT ProductName FROM Products WHERE OrderDetails.ProductID = Products.ProductID) as NOMBRE
FROM OrderDetails 