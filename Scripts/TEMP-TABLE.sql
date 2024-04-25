--EXEMPLO 1
--Criando uma tabela temporária, que ao fazer commit, as linhas sejam excluidas
CREATE GLOBAL TEMPORARY TABLE tabela_temp (
        id NUMBER,
        name VARCHAR2(20)
    ) 
    ON COMMIT DELETE ROWS;

-- Inserindo dados na tabela
INSERT INTO tabela_temp VALUES (1,'Teste1');
INSERT INTO tabela_temp VALUES (2, 'Teste2');
INSERT INTO tabela_temp VALUES (3, 'Teste3');

--Visualizando o conteúdo
SELECT * FROM tabela_temp;

SELECT COUNT(*) FROM tabela_temp;

--Realizando o commit para verificar a exclusão em seguida
COMMIT;

--EXEMPLO 2
--Criando uma tabela temporária com outra clásula para que persista mesmo após o commit;
CREATE GLOBAL TEMPORARY TABLE tabela_temp2(
        id NUMBER,
        nome VARCHAR2(20)
    )
    ON COMMIT PRESERVE ROWS;

-- Inserindo dados na tabela
INSERT INTO tabela_temp2 VALUES (1, 'Teste1');
INSERT INTO tabela_temp2 VALUES (2, 'Teste2');
INSERT INTO tabela_temp2 VALUES (3, 'Teste3');

--Visualizando o conteúdo
SELECT * FROM tabela_temp2;

SELECT COUNT(*) FROM tabela_temp2;

--Realizando o Commit
COMMIT;

--Realizando o teste de desconexão e reconexão

--EXEMPLO 3
CREATE global temporary TABLE empregados_temp
    (
          EMPLOYEE_ID NUMBER(6, 0) NOT NULL 
        , FIRST_NAME VARCHAR2(20 BYTE) 
        , LAST_NAME VARCHAR2(25 BYTE) NOT NULL 
        , COMMISSION_PCT NUMBER(2, 2) 
    ) 
    ON COMMIT DELETE ROWS; 

--Inserindo dados na tabela
INSERT INTO empregados_temp 
        SELECT a.EMPLOYEE_ID,a.FIRST_NAME,a.LAST_NAME,a.COMMISSION_PCT
         FROM HR.EMPLOYEES a; 

--Visualizando o conteúdo
SELECT * FROM empregados_temp;

SELECT COUNT(*) FROM empregados_temp;

--Realizando o commit;
COMMIT;

--Apagando as tabelas
drop table  tabela_temp2;
drop table tabela_temp;
drop table empregados_temp;



















