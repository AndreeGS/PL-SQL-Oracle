SET SERVEROUTPUT ON;

<<BLOCOPRINCIPAL>>
DECLARE 
    TYPE TFuncionario IS RECORD 
    (
        nome hr.employees.first_name%TYPE,
        salario hr.employees.salary%TYPE
    );
    
    vFunc TFuncionario;

BEGIN
    SELECT a.FIRST_NAME, a.SALARY 
       INTO vFunc.nome, vFunc.salario
     FROM hr.employees a
  WHERE employee_id = &emp;
  
  DBMS_OUTPUT.PUT_LINE(
    'Nome do funcion�rio: ' || vFunc.nome || chr(10)||
    'Sal�rio: '|| vFunc.salario 
  );
  
   DECLARE
    vFunc.nome := 'Andre Guilherme'; 
    vFunc.salario := 200; 
    
    BEGIN 
        DBMS_OUTPUT.PUT_LINE(
        'Nome do primeiro funcion�rio: ' || BLOCOPRINCIPAL.vFunc.nome  || chr(10) || 
        'Sal�rio do primeiro funcion�rio: '|| BLOCOPRINCIPAL.vFunc.salario || chr(10) || 
        'Nome do funcion�rio: ' || vFunc.nome || chr(10) ||
        'Salario: ' || vFunc.salario
        );
    END;
END;
/
