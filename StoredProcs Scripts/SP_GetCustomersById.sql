-- Create a new stored procedure called 'SP_GetCustomersById' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'SP_GetCustomersById'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.SP_GetCustomersById
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.SP_GetCustomersById
    @param1 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param1*/
   
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    SELECT  * from dbo.Customers where CustomerId = @param1
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.SP_GetCustomersById 1 /*value_for_param1*/
GO