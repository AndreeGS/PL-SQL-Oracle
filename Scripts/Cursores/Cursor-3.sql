SET SERVEROUTPUT ON

DECLARE
    --Declaração de variáveis
    viDFunc HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
    vNome HR.EMPLOYEES.FIRST_NAME%TYPE;
    vSalario HR.EMPLOYEES.SALARY%TYPE;
    v_posicao int default 0;
    
    --Declaração de cursores
    CURSOR cs_salario is
            SELECT a.EMPLOYEE_ID, a.FIRST_NAME, a.SALARY
            FROM HR.EMPLOYEES a
            ORDER BY a.salary DESC;
            
BEGIN
        IF NOT cs_salario%ISOPEN THEN
            OPEN cs_salario;
        END IF;
        
        LOOP
            FETCH cs_salario INTO viDFunc, vNome, vSalario;
            
            EXIT WHEN cs_salario%NOTFOUND;
        
            V_POSICAO := v_posicao +1;
            DBMS_OUTPUT.PUT_LINE( V_POSICAO || ' - ' ||ViDfUNC || ' - '  || vNome||' - ' || vSalario);
        
        END LOOP;
    CLOSE cs_salario;
END;
/
