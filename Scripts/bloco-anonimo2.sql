SET SERVEROUTPUT ON
DECLARE 
    v_total_sal NUMBER (10,2);
    v_depto NUMBER;
    v_qtd INT;
BEGIN 
    v_depto :=  100;
    SELECT SUM(a.salary), count(*) qtd
       INTO v_total_sal, v_qtd
     FROM  hr.employees A WHERE A.department_id = v_depto;
     
     dbms_output.put_line('Total de salario depto  '||v_depto||' � '||v_tot_sal);
    dbms_output.put_line('Total de de Colaboradores �  '||v_qtd);
    dbms_output.put_line('Media de Salario  '||round(v_tot_sal/v_qtd,2));
END;    