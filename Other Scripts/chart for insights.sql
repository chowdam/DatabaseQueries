select top 10 OrderDate, COUNT(OrderID) as [No of Orders]
from Sales.Orders
group by OrderDate
order by OrderDate DESC