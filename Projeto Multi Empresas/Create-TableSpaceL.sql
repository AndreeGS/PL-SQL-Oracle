--Criando um usu�rio em teste
CREATE USER PROJETO_TST
            IDENTIFIED BY PROJETO_TST
            DEFAULT TABLESPACE ERP_MULT_TST
            TEMPORARY TABLESPACE TEMP;
            
--DROP USER PROJETO    

--Dando privil�gios
GRANT ALL PRIVILEGES TO PROJETO_TST; 

--Alterando o Limite de cota para o usu�rio
ALTER USER PROJETO_TST QUOTA UNLIMITED ON ERP_MULT_TST;

--Criando um TableSpace em Teste
CREATE TABLESPACE ERP_MULT_TST
                        DATAFILE
                        'C:\oraclexe\app\oracle\oradata\XE\ERP_MULT_TST.dbf' 
                        SIZE 100M AUTOEXTEND ON NEXT 50M MAXSIZE 500M
                        ONLINE
                        PERMANENT
                        EXTENT MANAGEMENT LOCAL AUTOALLOCATE
                        SEGMENT SPACE MANAGEMENT AUTO;



--Criando o TableSpace em Produ��o
CREATE TABLESPACE ERP_MULT_PRD
                        DATAFILE
                        'C:\oraclexe\app\oracle\oradata\XE\ERP_MULT_PRD.dbf' 
                        SIZE 100M AUTOEXTEND ON NEXT 50M MAXSIZE 500M
                        ONLINE
                        PERMANENT
                        EXTENT MANAGEMENT LOCAL AUTOALLOCATE
                        SEGMENT SPACE MANAGEMENT AUTO;
                        
--Criando um usu�rio para o projeto em produ��o
CREATE USER PROJETO_PRD
            IDENTIFIED BY PROJETO_TST
            DEFAULT TABLESPACE ERP_MULT_TST
            TEMPORARY TABLESPACE TEMP;
            
 --Dando privil�gios           
GRANT ALL PRIVILEGES TO PROJETO_PRD; 

--Alterando o Limite de cota para o usu�rio
ALTER USER PROJETO_PRD QUOTA UNLIMITED ON ERP_MULT_TST;
