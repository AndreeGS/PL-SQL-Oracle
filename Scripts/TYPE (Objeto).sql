
--Bloco anonimo aplicando o tipo de registro;
/*
    Em outras palavras, criamos um objeto TFuncionario com atributos de Nome, Depto e Salario.
    Em seguida, criamos uma variável vFunc com o tipo TFuncionario.
    Sendo assim, conseguimos acessar uma propriedade do objeto dentro da variável. 
*/

SET SERVEROUTPUT ON;
DECLARE

--Declaração do Tipo (Objeto)
    TYPE TFuncionario IS RECORD (
        Nome VARCHAR2(40),
        Depto VARCHAR2(20),
        Salario NUMBER(10,2)
    );   
    
--Declaração da variável com o Tipo do objeto
vFunc TFuncionario;

BEGIN
    SELECT a.FIRST_NAME,a.DEPARTMENT_ID,a.SALARY
    
 --Atribuindo o select para a variável
       INTO vFunc.Nome, vFunc.Depto, vFunc.Salario
     FROM hr.employees a
    WHERE employee_id = &emp;
    
    DBMS_OUTPUT.PUT_LINE(
        'Nome do Funcionário: ' || vFunc.Nome || chr(10) || 
        'Nome do departamento: ' || vFunc.Depto || chr(10)||
        'Salario: ' || TO_CHAR(vFunc.Salario)
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Usuário não encontrado!');
        
END;