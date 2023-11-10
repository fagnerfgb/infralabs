/*Nome da base: dbCustos.
Tamanho inicial da base de dados: 200 Mbytes.
Tamanho inicial da base de log: 100 Mbytes.
Localiza��o da base de dados: F:\Bases\dbCustos\
Localiza��o dos arquivos de LOG: L:\Bases\dbCustos\
Nome da base de dados: dbCustos.
Nome da base de Log: dbCustosLog.
Crescimento da base de dados e log: De 25 em 25 Mbytes.
Tamanho m�ximo das bases de log e de dados: Indefinido.*/

CREATE DATABASE [dbCustos] ON
PRIMARY (
NAME = N'dbCustos',
FILENAME = N'F:\Bases\dbCustos\dbCustos.MDF',
SIZE = 200MB,
FILEGROWTH = 25MB)
LOG ON (
NAME = N'dbCustosLog',
FILENAME = N'L:\LOGS\dbCustos\dbCustosLog.LDF',
SIZE = 100MB,
FILEGROWTH = 25MB);