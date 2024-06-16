
--Criando o tablespace SistemaBancario
create tablespace SistemaBancario
datafile 
    'C:\oraclexe\app\oracle\oradata\XE\SistemaBancario.dbf'
                                size 100m autoextend on next 50m maxsize 500m
                                online
                                permanent
                                extent management local autoallocate
                                segment space management auto;
                                
--Criando um usuário para o projeto
CREATE OR REPLACE USER admSistemaBancario
    IDENTIFIED BY admSistema
    DEFAULT TABLESPACE SistemaBancario
    TEMPORARY TABLESPACE TEMP;
    
-- Atualizando a senha
ALTER USER admSistemaBancario IDENTIFIED BY 12345;

--Permissão para o admSistemaBancario
GRANT CREATE SESSION, CONNECT, RESOURCE TO admSistemaBancario;

-- Removendo as limitações do admSistemaBancario
ALTER USER admSistemaBancario QUOTA UNLIMITED ON SistemaBancario;













