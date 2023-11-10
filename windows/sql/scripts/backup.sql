SELECT COUNT(*) FROM tb_nota;

BACKUP DATABASE dbVendas TO DISK = 'L:\Backups\dbVendas.bak';

EXEC IncluiNotasDia '2022-03-01'

SELECT COUNT(*) FROM tb_nota;

BACKUP DATABASE dbVendas TO DISK = 'L:\Backups\dbVendas_2.bak';