SET SERVEROUTPUT ON;

--Declaração de variáveis
DECLARE
vCount INTEGER;

--Processamento
BEGIN

    SELECT count(*)
       INTO vCount
     FROM HR.EMPLOYEES;
     
     DBMS_OUTPUT.PUT_LINE('Existem ' || to_char(vCount) || ' Funcionários cadastrados.' );
     
--Saída se caso erro
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Não foi possível verfiicar a quantidade de funcionários cadastrados. ' );
    
END;