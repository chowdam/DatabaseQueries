-- SQL Server 2019 New Features
-- UTF-8 Support

CREATE DATABASE CollationTestDB;
GO
USE CollationTestDB;
GO

-- verify the database collation
SELECT name, collation_name
FROM sys.databases
WHERE name = 'CollationTestDB';
GO

-- create table with UTF-8 enabled collation column
CREATE TABLE CharacterData (
    myChar8 char(8),
    myVarChar varchar(8),
    myNChar nchar(8),
    myUTF8 char(8) COLLATE Latin1_General_100_CI_AS_SC_UTF8)
;

-- see what collation each column is using
SELECT name, collation_name
FROM sys.columns
WHERE name IN('myChar8', 'myVarChar', 'myNChar', 'myUTF8');

-- insert unicode text into each column
INSERT INTO CharacterData
    VALUES  (N'A', N'A', N'A', N'A'),
            (N'⪅', N'⪅', N'⪅', N'⪅'),
            (N'☃️', N'☃️', N'☃️', N'☃️')
;

-- view results
SELECT * FROM CharacterData;

SELECT  len(myChar8) AS CharLength,
        len(myVarChar) AS VarCharLength,
        len(myNChar) AS NCharLength,
        len(myUTF8) AS UTF8Length
    FROM CharacterData;

USE Master;
DROP DATABASE CollationTestDB;
GO