--Criando especificações da package
CREATE OR REPLACE PACKAGE PKG_FUNC AS
  
    PROCEDURE PROC_SIMULA(n_func_id NUMBER);
    
    FUNCTION get_nomeCompleto(n_func_id NUMBER)
      RETURN VARCHAR2;
      
    FUNCTION get_salario(n_func_id NUMBER)
      RETURN NUMBER;

  END PKG_FUNC;


--Criando o body da package
CREATE OR REPLACE PACKAGE BODY PKG_FUNC AS

    FUNCTION get_nomeCompleto(n_func_id NUMBER) RETURN VARCHAR2 IS
        v_nomeCompleto VARCHAR2(50);
    BEGIN
      SELECT a.FIRST_NAME || ',' ||  a.LAST_NAME
      INTO v_nomeCompleto
      FROM HR.EMPLOYEES a
      WHERE a.employee_id = n_func_id;
      
      RETURN v_nomeCompleto;
   
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
    WHEN TOO_MANY_ROWS THEN
      RETURN NULL;
    END; 

    FUNCTION get_salario(n_func_id NUMBER) RETURN NUMBER IS
      n_salario NUMBER(8,2);
    BEGIN
      SELECT a.SALARY
      INTO n_salario
      FROM HR.EMPLOYEES a
      WHERE a.EMPLOYEE_ID = n_func_id;
   
      RETURN n_salario;
   
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          RETURN NULL;
        WHEN TOO_MANY_ROWS THEN
          RETURN NULL;
    END;


  PROCEDURE PROC_SIMULA(n_func_id NUMBER) IS
    V_SAL_NOVO NUMBER(8,2);
    BEGIN
        SELECT a.SALARY*1.10 INTO V_SAL_NOVO FROM HR.EMPLOYEES a
        where a.EMPLOYEE_ID=n_func_id;
        dbms_output.put_line('O Novo salario é->> '||V_SAL_NOVO);
    END;
   
  END PKG_FUNC;

--Executando um objeto
SET SERVEROUTPUT ON SIZE 1000000;
  DECLARE
    n_salario NUMBER(8,2);
    v_nome   VARCHAR2(50);
    n_func_id NUMBER := &empresa_id;
BEGIN
    v_nome   := PKG_FUNC.get_nomeCompleto(n_func_id);
    IF v_nome  IS NOT NULL 
    THEN dbms_output.put_line('Funcionário: '|| v_nome);
    
    END IF;
  END;
