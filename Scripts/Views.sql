--Grant para autorizar a criação de views para o usuário Aluno;
GRANT ALL PRIVILEGES TO ALUNO;

--Criando uma View;
CREATE OR REPLACE VIEW  v_func_depto
AS
    SELECT  a.EMPLOYEE_ID,
       a.FIRST_NAME,
       a.SALARY,
       a.DEPARTMENT_ID,
       b.DEPARTMENT_NAME
      FROM HR.EMPLOYEES a
     INNER JOIN hr.DEPARTMENTS b ON  a.DEPARTMENT_ID=b.DEPARTMENT_ID;

--Fazendo o select
SELECT  *
 FROM v_func_depto
WHERE DEPARTMENT_ID = '20';

--Atualizando a view
CREATE OR REPLACE VIEW v_func_depto
AS
    SELECT  a.EMPLOYEE_ID,
           a.FIRST_NAME as primeiro_nome,
           a.LAST_NAME as ultimo_nome,
           a.SALARY,
           a.DEPARTMENT_ID,
           b.DEPARTMENT_NAME
    FROM HR.EMPLOYEES a
    INNER JOIN  hr.DEPARTMENTS b
    ON a.DEPARTMENT_ID=b.DEPARTMENT_ID;

--Apagando uma view
DROP VIEW v_func_depto;

--Criando outro exemplo de View
create or replace view v_pais_regiao
as
select a.COUNTRY_ID,a.COUNTRY_NAME,a.REGION_ID,b.REGION_NAME
  from HR.COUNTRIES a
  inner join HR.REGIONS b on a.REGION_ID=b.REGION_ID;

--Usando o select
select * 
  from v_pais_regiao 
where region_name <> 'Europe';

--Reutilizando a View em outra View
create  view  v_pais_local
as
select a.LOCATION_ID,a.CITY,b.COUNTRY_NAME
 from hr.locations a
 inner join v_pais_regiao b on a.COUNTRY_ID=b.COUNTRY_ID;
























