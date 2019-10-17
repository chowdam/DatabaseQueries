-- SQL Server 2019 New Features
-- Persistent Memory

-- Check status of Hybrid Buffer Pool
DBCC TRACESTATUS (809);

-- To enable Hybrid Buffer Pool Globally, 
-- add the -T809 startup parameter in SSCM