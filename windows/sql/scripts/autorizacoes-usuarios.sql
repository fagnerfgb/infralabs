CREATE LOGIN [natalia.paz] WITH PASSWORD = '123@senac';
USE dbVendas;
CREATE USER [natalia.paz] FOR LOGIN [natalia.paz];
EXEC sp_addrolemember 'db_datareader','natalia.paz';
EXEC sp_addrolemember 'db_datawriter','natalia.paz';



