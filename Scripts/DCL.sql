
--Verificando o usuario 
select user from dual;

--Concedendo
grant create view, create procedure, create session, create table to aluno;

--Revogando
revoke create view, create procedure, create session, create table from aluno;

--Analisando privilégios
select * from DBA_ROLE_PRIVS WHERE GRANTEE LIKE 'ALUNO';

--Revogando 
REVOKE resource from aluno;

--Concedendo
grant resource to aluno;

--Analisando
select * from user_tab_privs where grantee like 'ALUNO';

REVOKE UPDATE ON HELP FROM ALUNO;