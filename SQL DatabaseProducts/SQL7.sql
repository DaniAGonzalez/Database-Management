SELECT SupplierID, round(avg(Price) ) as Promedio FROM Products
GROUP BY SupplierID
ORDER BY Promedio ASC