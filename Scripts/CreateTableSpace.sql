
-- CRIANDO UM TABLESPACE
create tablespace estudo
 datafile
   'C:\oraclexe\app\oracle\oradata\XE\estudo.dbf' 
		size 100m autoextend on next 50m maxsize 500m
   online
   permanent
   extent management local autoallocate
   segment space management auto;
   
   
-- Criando um usuário
   create user aluno
          identified by aluno
          default tablespace estudo
          temporary tablespace TEMP;
          
--Permissão para aluno
    grant create session, connect, resource to aluno;
    
--Retirar as limitações do Aluno
    alter user aluno quota unlimited on estudo
    
-- Apagando usuario
    drop user aluno;
    
-- Apagando um tablespace
    drop tablespace curso
    including contents and datafiles
    cascade constraints
    
    
    
    
    
    