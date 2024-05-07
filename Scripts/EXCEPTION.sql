SET SERVEROUTPUT ON;

DECLARE
    v_employee_id hr.employees.employee_id%TYPE;
    v_employee_name hr.employees.first_name%TYPE;
    v_employee_salary hr.employees.salary%TYPE;
BEGIN
    SELECT employee_id, first_name, salary
    INTO v_employee_id, v_employee_name, v_employee_salary
    FROM hr.employees
    WHERE employee_id = &emp_id;

    DBMS_OUTPUT.PUT_LINE('Informações do Funcionário:');
    DBMS_OUTPUT.PUT_LINE('ID: ' || TO_CHAR(v_employee_id));
    DBMS_OUTPUT.PUT_LINE('Nome: ' || v_employee_name);
    DBMS_OUTPUT.PUT_LINE('Salário: ' || TO_CHAR(v_employee_salary));

EXCEPTION
    -- Se a exceção NO_DATA_FOUND ocorrer, exibe uma mensagem adequada
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum funcionário encontrado com o ID fornecido.');

END;
/
