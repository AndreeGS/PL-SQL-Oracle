--Criando a tabela
CREATE TABLE CADASTRO
(
    NOME VARCHAR2(50) NOT NULL,
    DOCTO VARCHAR2(20) NOT NULL
);

-- Realizando carga
INSERT INTO CADASTRO VALUES ('Andre','12341244');
INSERT INTO CADASTRO VALUES ('Joao','12341248');
INSERT INTO CADASTRO VALUES ('Pedro','12341246');

--Verificando a carga
select * from cadastro;

--Realizando a reversão, retornando a tabela para o estado anterior
ROLLBACK;

--Realizando o save
COMMIT;


--Outros exemplos
--Realizando carga com savepoints
INSERT INTO CADASTRO VALUES ('Andre','12341244');
SAVEPOINT P1;
INSERT INTO CADASTRO VALUES ('Joao','12341248');
SAVEPOINT P2;
INSERT INTO CADASTRO VALUES ('Pedro','12341246');
SAVEPOINT P3;

--Verificando cargas
select * from cadastro;

--Retorna a tabela para o estado anterior do begin transaction
ROLLBACK TO SAVEPOINT P2;


--Realizando o save
COMMIT;

DELETE FROM CADASTRO;





