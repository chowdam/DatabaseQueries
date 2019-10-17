-- SQL Server 2019 New Features
-- Resumable online indexes

USE WideWorldImporters;
GO

-- create an online, resumable index
CREATE INDEX IX_Temp ON Application.People(PreferredName)
WITH (ONLINE = ON, RESUMABLE = ON, MAX_DURATION = 5 MINUTES);


-- if you need to pause the index creation
ALTER INDEX IX_Temp ON Application.People PAUSE;

-- you can then resume it again after an interruption
ALTER INDEX IX_Temp ON Application.People RESUME;


-- make online and resumable the default configuration for the database
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = WHEN_SUPPORTED;  -- OFF | FAIL_UNSUPPORTED
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = WHEN_SUPPORTED;  -- OFF | FAIL_UNSUPPORTED


-- columnstore indexes can also now be created while the table is online
CREATE CLUSTERED COLUMNSTORE INDEX cci
  ON <tableName>
  WITH (ONLINE = ON);

ALTER INDEX cci
  ON <tableName>
  REBUILD WITH (ONLINE = ON);