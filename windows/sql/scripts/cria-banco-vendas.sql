/*Nome VENDAS
Primário:
Nome lógico: VENDAS
Localização: F:\Bases\Vendas
Nome físico: VENDAS (Você deve, no comando, incluir a extensão correta para este tipo de arquivo)
Tamanho inicial: 200MB
Tamanho máximo: 500MB
Taxa de crescimento: 50MB

Secundário:
Nome lógico: VENDAS_AUX
Localização: F:\Bases\Vendas
Nome físico: VENDAS_AUX (Você deve, no comando, incluir a extensão correta para este tipo de arquivo)
Tamanho inicial: 100MB
Tamanho máximo: 250MB
Taxa de crescimento: 20MB

Log:
Nome lógico: VENDAS_LOG
Localização: L:\Bases\Vendas
Nome físico: VENDAS_LOG (Você deve, no comando, incluir a extensão correta para este tipo de arquivo)
Tamanho inicial: 50MB
Tamanho máximo: 300MB
Taxa de crescimento: 40MB*/

CREATE DATABASE [VENDAS] ON
PRIMARY (
NAME = N'VENDAS',
FILENAME = N'F:\Bases\Vendas\VENDAS.MDF',
SIZE = 200MB,
MAXSIZE = 500MB,
FILEGROWTH = 50MB ),
(NAME = N'VENDAS_AUX',
FILENAME = N'F:\Bases\Vendas\VENDAS_AUX.NDF',
SIZE = 100MB,
MAXSIZE = 250MB,
FILEGROWTH = 20MB)
LOG ON (
NAME = N'VENDAS_LOG',
FILENAME = N'L:\LOGS\Vendas\VENDAS_LOG.LDF',
SIZE = 50MB,
MAXSIZE = 300MB,
FILEGROWTH = 40MB);