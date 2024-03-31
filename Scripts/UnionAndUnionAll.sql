
--Operador Union/Union all

--Union all desconsidera se o valor j� existe ou n�o;
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
ORDER BY 1;

--Union n�o traz valores repetidos, realizando o distinct;
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
ORDER BY 1;

--Simulando um erro 1, diferen�a na quantidade de colunas; ORA-01789
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION
SELECT EMPLOYEE_ID, FIRST_NAME FROM HR.EMPLOYEES
ORDER BY 1;

--Simulando um erro 2, diferen�a na posi��o das colunas; ORA-01790
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION
SELECT EMPLOYEE_ID, SALARY, FIRST_NAME FROM HR.EMPLOYEES
ORDER BY 1;

--Campos diferentes mas mesmos tipos;
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
UNION
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM HR.EMPLOYEES
ORDER BY 1;


--Outras varia��es de
    -- Erro ORA-01790
    SELECT '1','1','ABC' FROM DUAL
        UNION
    SELECT 'A', 2 FROM DUAL;

    --Unio all
    SELECT 'A' AS CAMPO1,'B' AS CAMPO2 FROM DUAL
        UNION ALL
    SELECT 'A' AS CAMPO3, 'B' AS CAMPO4 FROM DUAL;

    --Union
    SELECT 'A' AS CAMPO1,'B' AS CAMPO2 FROM DUAL
        UNION 
    SELECT 'A' AS CAMPO3, 'B' AS CAMPO4 FROM DUAL;



  SELECT ESTADO
    FROM SENSO
   WHERE ANO = '2014'
     AND COD_UF = '11'
UNION
  SELECT ESTADO
    FROM SENSO
   WHERE ANO = '2015'
     AND COD_UF = '11'



