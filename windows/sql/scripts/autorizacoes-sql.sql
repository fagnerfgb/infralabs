ALTER SERVER ROLE [dbcreator] ADD MEMBER [fagner.braga];

ALTER SERVER ROLE [dbcreator] DROP MEMBER [fagner.braga];

SELECT * FROM sys.server_principals WHERE is_fixed_role = 1;

