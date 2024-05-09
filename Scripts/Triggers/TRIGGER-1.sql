--Desabilitar ou Habilitar
alter trigger trg_salario_aud disable;
alter trigger trg_salario_aud enable;


--PREPARANDO O AMBIENTE
CREATE TABLE EMPREGADOS
(
    CODIGO INT NOT NULL PRIMARY KEY,
    NOME VARCHAR2(20),
    SALARIO DECIMAL(10,2)
);

CREATE TABLE LOG_SALARIO
(
    CODIGO INT,
    SALARIO_ANTERIOR DECIMAL (10,2),
    SALARIO_ATUAL DECIMAL(10, 2),
    DATA_ALTERACAO DATE,
    USUARIO VARCHAR(20),
    OPERACAO VARCHAR2(10)
);

--TRIGGER EACH ROW
CREATE OR REPLACE TRIGGER trg_salario_aud

after INSERT ON EMPREGADOS

FOR EACH ROW

BEGIN
INSERT INTO log_salario 
                   (codigo,salario_anterior,salario_atual,data_alteracao,usuario,operacao) 
      VALUES      (:NEW.codigo,:OLD.SALARIO,:NEW.SALARIO,SYSDATE,USER,'');
END;

--Teste insert
INSERT INTO EMPREGADOS VALUES (1,'Peter',2999);
INSERT INTO EMPREGADOS VALUES (2,'john',3499);

--Visualizando o resultado
select * from EMPREGADOS;
select * from log_salario;

--Outro exemplo

CREATE OR REPLACE TRIGGER trg_salario_aud
    after INSERT OR DELETE OR UPDATE ON EMPREGADOS
    FOR EACH ROW
    DECLARE
        p_oper VARCHAR2(10);
BEGIN
    IF inserting then
        p_oper := 'insere';
        INSERT INTO log_salario 
                            (codigo,salario_anterior,salario_atual,data_alteracao,usuario,operacao) 
        VALUES      (:NEW.codigo, NULL, :NEW.SALARIO, SYSDATE, USER, p_oper);
    
    ELSIF updating then 
        p_oper := 'atualiza';
        INSERT INTO log_salario 
                            (codigo,salario_anterior,salario_atual,data_alteracao,usuario,operacao) 
        VALUES      (:NEW.codigo,:OLD.SALARIO,:NEW.SALARIO,SYSDATE,USER,p_oper);
        
    ELSIF deleting then
        p_oper := 'deleta';
        INSERT INTO log_salario 
                           (codigo,salario_anterior,salario_atual,data_alteracao,usuario,operacao) 
        VALUES      (:old.codigo,:OLD.SALARIO,NULL,SYSDATE,USER,p_oper); 
    END IF; 
END;

--Realizando as operações
INSERT INTO EMPREGADOS VALUES (5,'Lennon',3499);
UPDATE empregados SET salario=salario*1.05 WHERE codigo='1';
DELETE FROM EMPREGADOS WHERE codigo='3';

--Visualizando resultados
select * from EMPREGADOS;
select * from log_salario;














