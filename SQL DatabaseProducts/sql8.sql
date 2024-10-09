select ProductID, round(AVG( Quantity)) AS PROMEDIOS from OrderDetails
group by ProductID
HAVING Promedios > 3