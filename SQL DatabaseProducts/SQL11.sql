SELECT 
    e.LastName, 
    e.FirstName,
    (
        SELECT SUM(od.Quantity) 
        FROM Orders o 
        JOIN OrderDetails od ON o.OrderID = od.OrderID 
        WHERE o.EmployeeID = e.EmployeeID
    ) AS Unidades_Totales
FROM Employees e
WHERE 
    (
        SELECT SUM(od.Quantity) 
        FROM Orders o 
        JOIN OrderDetails od ON o.OrderID = od.OrderID 
        WHERE o.EmployeeID = e.EmployeeID
    ) < (
        SELECT AVG(TotalUnits)
        FROM (
            SELECT SUM(od.Quantity) AS TotalUnits
            FROM Orders o
            JOIN OrderDetails od ON o.OrderID = od.OrderID
            GROUP BY o.EmployeeID
        ) AS AvgSales
    );
