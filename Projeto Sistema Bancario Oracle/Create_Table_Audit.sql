--Tabela AuditConta
CREATE TABLE AUDIT_CONTA
(
    auditoria_conta_id INT NOT NULL,
    conta_id INT NOT NULL,
    numero_conta VARCHAR2(12),
    tip_conta_id INT NOT NULL,
    saldo_inicial DECIMAL(10,2),
    saldo_anterior DECIMAL(10,2),
    saldo_atual DECIMAL(10,2),
    operacao VARCHAR2(12),
    dt_operacao DATE,
    transacao_id INT NOT NULL,
    descricao_transacao VARCHAR2(10),
    dt_transacao DATE,
    valor_transacao DECIMAL(10,2)
)

--Sequencia tabela Auditoria Conta
CREATE SEQUENCE SEQ_AUDIT_CONTA START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela AuditCliente
CREATE TABLE AUDIT_CLIENTE
(
    auditoria_cliente_id INT NOT NULL PRIMARY KEY,
    usuario_id INT NOT NULL,
    dt_operacao DATE,
    operacao VARCHAR2(12),
    cliente_id INT NOT NULL,
    cliente_nome VARCHAR2(40),
    dt_cad_cliente DATE
)

--Sequencia tabela Auditoria Cliente 
CREATE SEQUENCE SEQ_AUDIT_CLIENTE START WITH 1 INCREMENT BY 1 NOMAXVALUE;




