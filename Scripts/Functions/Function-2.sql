
--Exemplo de fun��o sem par�metros
CREATE OR REPLACE FUNCTION Fn_Nome
    RETURN varchar IS 
    V_NOME VARCHAR(20);
    
BEGIN
    SELECT a.FIRST_NAME
      INTO  V_NOME
     FROM  hr.EMPLOYEES a WHERE a.EMPLOYEE_ID = 100;
     
     RETURN V_NOME;
END;
/

--Testando a fun��o
select Fn_Nome from Dual;


--Atualizando a fun��o
CREATE OR REPLACE FUNCTION Fn_Nome(p_id in number)
    RETURN varchar IS 
    V_NOME VARCHAR(20);
    
BEGIN
    SELECT a.FIRST_NAME
      INTO  V_NOME
     FROM  hr.EMPLOYEES a WHERE a.EMPLOYEE_ID = p_id;
     
     RETURN V_NOME;
END;
/

--Testando a fun��o
select Fn_Nome(100) from Dual;













