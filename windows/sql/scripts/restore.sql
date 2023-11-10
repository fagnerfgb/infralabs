SELECT COUNT(*) FROM tb_nota;
--3698
EXEC IncluiNotasDia '2022-03-02'

SELECT COUNT(*) FROM tb_nota;
--3784


RESTORE HEADERONLY FROM DISK = 'L:\Backups\dbVendas_2.bak';

USE MASTER;

-- ao inves de executar o comando abaixo, fazer o drop pelo Management Studio
DROP DATABASE dbVendas

RESTORE DATABASE dbVendas FROM DISK = 'L:\Backups\dbVendas_2.bak' WITH RECOVERY;
-- WITH RECOVERY - garante que tudo que foi feito no backup seja restaurado

USE dbVendas;
SELECT COUNT(*) FROM tb_nota;