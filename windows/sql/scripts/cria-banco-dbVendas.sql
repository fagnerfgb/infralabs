/*A base de dados e de log devem estar em diretórios diferentes
Tamanho inicial de 100 MB
Tamanho máximo dos arquivos de 200 MB
Taxa de crescimento de 50 MB*/

CREATE DATABASE [dbVendas] ON 
PRIMARY (
NAME = N'dbVendas',
FILENAME = N'F:\BASES\dbVendas\dbVendas.MDF',
SIZE = 100MB,
MAXSIZE = 200MB,
FILEGROWTH = 50MB )
LOG ON (
NAME = N'dbVendasLOG',
FILENAME = N'L:\Logs\dbVendas\dbVendasLOG.LDF',
SIZE = 100MB,
MAXSIZE = 200MB,
FILEGROWTH = 50MB);