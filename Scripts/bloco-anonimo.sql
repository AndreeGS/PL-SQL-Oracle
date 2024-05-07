SET SERVEROUTPUT ON;

--Declara��o de vari�veis
DECLARE
vCount INTEGER;

--Processamento
BEGIN

    SELECT count(*)
       INTO vCount
     FROM HR.EMPLOYEES;
     
     DBMS_OUTPUT.PUT_LINE('Existem ' || to_char(vCount) || ' Funcion�rios cadastrados.' );
     
--Sa�da se caso erro
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('N�o foi poss�vel verfiicar a quantidade de funcion�rios cadastrados. ' );
    
END;