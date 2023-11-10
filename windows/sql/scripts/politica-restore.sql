SELECT * FROM tb_controle_backups;

RESTORE HEADERONLY FROM
DISK = 'L:\Backups\politica_backup_20220302.bak';

USE MASTER;
ALTER DATABASE dbVendas SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE dbVendas;

RESTORE DATABASE dbVendas FROM DISK = 'L:\Backups\politica_backup_20220302.bak' WITH FILE = 1, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'L:\Backups\politica_backup_20220302.bak' WITH FILE = 9, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'L:\Backups\politica_backup_20220302.bak' WITH FILE = 10, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'L:\Backups\politica_backup_20220302.bak' WITH FILE = 11, RECOVERY;

USE dbVendas;
SELECT * FROM tb_controle_backups;