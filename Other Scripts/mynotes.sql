-- SQL Snippets - quick queries here

SELECT TOP (1000) [CityID]
      ,[CityName]
      ,[StateProvinceID]
      ,[Location]
      ,[LatestRecordedPopulation]
      ,[LastEditedBy]
  FROM [WideWorldImporters].[Application].[Cities]


  SELECT  [CityName] ,[StateProvinceID]      
  FROM [WideWorldImporters].[Application].[Cities]


-- Find 10 most frequent city names
SELECT  top (20) [CityName] , COUNT([StateProvinceID])  as Frequency
from [WideWorldImporters].[Application].[Cities] --37940 rows affected
GROUP BY CityName
order by Frequency desc;

select top (1000) StockItemID, StockItemName, UnitPrice, RecommendedRetailPrice
from WideWorldImporters.Warehouse.StockItems
where StockItemID = 224

SELECT TOP (1000)  *   FROM [WideWorldImporters].[Website].[Customers]



select compatibility_level 
from sys.databases where name = 'WideWorldImporters'

--ALTER DATABASE WideWorldImporters  
--SET COMPATIBILITY_LEVEL = 150;  
--GO

--DBCC TRACESTATUS (809);

--select SERVERPROPERTY ('IspolyBaseInstalled') as IspolyBaseInstalled

---- Enable poly base
--exec sp_configure 'polybase enabled';

-- exec sp_configure @configname = 'polybase enabled', @configvalue = 1;
-- RECONFIGURE;


--query for custom insights wizard
select top 10 OrderDate, COUNT(OrderID) as [No of Orders]
from Sales.Orders
group by OrderDate
order by OrderDate DESC

-- {"name":"My-Widget","gridItemConfig":{"sizex":2,"sizey":1},"widget":{"insights-widget":{"type":{"horizontalBar":{"dataDirection":"vertical","columnsAsLabels":true,"labelFirstColumn":false,"legendPosition":"none","yAxisLabel":"Order Date","xAxisLabel":"Number of Orders","xAxisMin":1}},"queryFile":"d:\\Lakshmi\\sample learnign projects\\Sql Server 2019\\SampleScripts\\Other Scripts\\chart for insights.sql"}}}
