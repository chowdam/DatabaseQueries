-- SQL Server 2019 New Features
-- Intelligent Query Processing

USE WideWorldImporters;  
GO

SELECT compatibility_level  
FROM sys.databases WHERE name = 'WideWorldImporters';  
GO

ALTER DATABASE WideWorldImporters  
SET COMPATIBILITY_LEVEL = 150;  
GO