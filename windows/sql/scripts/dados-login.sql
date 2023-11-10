SELECT * FROM MASTER.SYS.sql_logins;

SELECT name as [Usuario], LOGINPROPERTY(name, 'PasswordLastSetTime') as [Ultima troca de senha] FROM MASTER.SYS.sql_logins;

SELECT name as [Usuario], password_hash as [Senha Hash]  FROM MASTER.SYS.sql_logins;

CREATE LOGIN pedro WITH PASSWORD = 'pedro';

SELECT name FROM MASTER.SYS.sql_logins
WHERE PWDCOMPARE(name, password_hash) = 1;

CREATE LOGIN joao WITH PASSWORD = 'joao123';

SELECT name FROM MASTER.SYS.sql_logins
WHERE PWDCOMPARE(name + '123', password_hash) = 1;