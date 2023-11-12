USE dbVendas;
SELECT DISTINCT [data] FROM tb_nota order by [data] DESC;
--2022-03-02

CREATE TABLE tb_controle_backups 
([ID] INTEGER, [NOME] VARCHAR(100), [NUMERO NOTAS] INTEGER);

-- 1 DA MANHA - FULL (DATABASE WITH INIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota; 
INSERT INTO tb_controle_backups VALUES (1, 'BACKUP FULL 1 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP DATABASE dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH INIT;

-- 4 DA MANH� - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (2, 'BACKUP INCREMENTAL 4 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 6 DA MANH� - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (3, 'BACKUP INCREMENTAL 6 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 8 DA MANH� - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (4, 'BACKUP INCREMENTAL 8 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 9 DA MANH� - FULL (DATABASE WITH DIFFERENTIAL)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (5, 'BACKUP DIFFERENTIAL 9 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP DATABASE dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH DIFFERENTIAL;

-- 10 DA MANH� - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (6, 'BACKUP INCREMENTAL 10 AM', @NUM_NOTAS); 
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 12 DA MANH� - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (7, 'BACKUP INCREMENTAL 12 AM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 2 DA TARDE - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (8, 'BACKUP INCREMENTAL 2 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 2 DA TARDE - FULL (DATABASE WITH DIFFERENTIAL)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (9, 'BACKUP DIFFERENTIAL 2 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP DATABASE dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH DIFFERENTIAL;

-- 3 DA TARDE - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (10, 'BACKUP INCREMENTAL 3 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 5 DA TARDE - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (11, 'BACKUP INCREMENTAL 5 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 7 DA NOITE - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (12, 'BACKUP INCREMENTAL 7 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

-- 9 DA NOITE - INCREMENTAL (LOG WITH NOINIT)
EXEC IncluiNotasDia '2022-03-02';
DECLARE @NUM_NOTAS INTEGER;
SELECT @NUM_NOTAS = COUNT(*) FROM tb_nota;
INSERT INTO tb_controle_backups VALUES (13, 'BACKUP INCREMENTAL 9 PM', @NUM_NOTAS);
SELECT * FROM tb_controle_backups;

BACKUP LOG dbVendas TO DISK = 'L:\Backups\politica_backup_20220302.bak' WITH NOINIT;

SELECT * FROM tb_controle_backups;