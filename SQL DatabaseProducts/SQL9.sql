
SELECT ProductID,  sum(Quantity) as total_vendido,
				(SELECT Price FROM Products where ProductID= OrderDetails.ProductID) as Price,
				(SELECT ProductName from Products WHERE Products.ProductID==OrderDetails.ProductID) as Name,
				(sum(Quantity) * (Select Price FROM Products WHERE ProductID = OrderDetails.ProductID)) as total_recaudado	
FROM OrderDetails
group by ProductID
ORDER BY total_recaudado ASC