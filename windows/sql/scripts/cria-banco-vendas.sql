/*Nome VENDAS
Prim�rio:
Nome l�gico: VENDAS
Localiza��o: F:\Bases\Vendas
Nome f�sico: VENDAS (Voc� deve, no comando, incluir a extens�o correta para este tipo de arquivo)
Tamanho inicial: 200MB
Tamanho m�ximo: 500MB
Taxa de crescimento: 50MB

Secund�rio:
Nome l�gico: VENDAS_AUX
Localiza��o: F:\Bases\Vendas
Nome f�sico: VENDAS_AUX (Voc� deve, no comando, incluir a extens�o correta para este tipo de arquivo)
Tamanho inicial: 100MB
Tamanho m�ximo: 250MB
Taxa de crescimento: 20MB

Log:
Nome l�gico: VENDAS_LOG
Localiza��o: L:\Bases\Vendas
Nome f�sico: VENDAS_LOG (Voc� deve, no comando, incluir a extens�o correta para este tipo de arquivo)
Tamanho inicial: 50MB
Tamanho m�ximo: 300MB
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