--Triggers auto sequencia

--Trigger departamento
CREATE OR REPLACE TRIGGER TRG_DEPARTAMENTO
    BEFORE INSERT ON DEPARTAMENTO
    FOR EACH ROW
        BEGIN
            IF :NEW.departamento_id is null
                THEN SELECT SEQ_DPT.NEXTVAL INTO :NEW.departamento_id FROM DUAL;
            END IF;
        END;
        
--Trigger cargo
CREATE OR REPLACE TRIGGER TRG_CARGO
    BEFORE INSERT ON CARGO
    FOR EACH ROW
        BEGIN
            IF :NEW.cargo_id IS NULL
                THEN SELECT SEQ_CARGO.NEXTVAL INTO :NEW.cargo_id FROM DUAL;
            END IF;
        END;
    
--Trigger uf
CREATE OR REPLACE TRIGGER TRG_UF
    BEFORE INSERT ON UNIDADE_FEDERACAO
    FOR EACH ROW
        BEGIN
            IF :NEW.uf_id IS NULL
                THEN SELECT SEQ_UF .NEXTVAL INTO :NEW.uf_id FROM DUAL;
            END IF;
        END;
        
--Trigger Agencia
CREATE OR REPLACE TRIGGER TRG_AGENCIA 
    BEFORE INSERT ON AGENCIA
    FOR EACH ROW
        BEGIN
            IF :NEW.agencia_id IS NULL
                THEN SELECT SEQ_AGENCIA .NEXTVAL INTO :NEW.agencia_id FROM DUAL;
            END IF;
    END;
    
--Trigger Cidade
CREATE OR REPLACE TRIGGER TRG_CIDADE
    BEFORE INSERT ON CIDADE
        FOR EACH ROW
            BEGIN
                IF :NEW.cidade_id IS NULL
                    THEN SELECT SEQ_CIDADE.NEXTVAL INTO :NEW.cidade_id FROM DUAL;
                END IF;
            END;

--Trigger Cliente
CREATE OR REPLACE TRIGGER TRG_CLIENTE
    BEFORE INSERT ON CLIENTE
    FOR EACH ROW
        BEGIN
            IF :NEW.cliente_id is null
                THEN SELECT SEQ_CLIENTE.NEXTVAL INTO :NEW.cliente_id FROM DUAL;
            END IF;
        END;
    
--Trigger Conta
CREATE OR REPLACE TRIGGER TRG_CONTA
    BEFORE INSERT ON CONTA
    FOR EACH ROW
        BEGIN
            IF :NEW.conta_id is null
                THEN SELECT SEQ_CONTA.NEXTVAL INTO :NEW.conta_id FROM DUAL;
            END IF;
        END;
        
--Trigger Empregado
CREATE OR REPLACE TRIGGER TRG_EMPREGADO
    BEFORE INSERT ON EMPREGADO
    FOR EACH ROW
        BEGIN
            IF :NEW.empregado_id IS NULL
                THEN SELECT SEQ_EMP.NEXTVAL INTO :NEW.empregado_id FROM DUAL;
            END IF;
        END;
    
--Trigger tipo de conta
CREATE OR REPLACE TRIGGER TRG_TIP_CONTA
    BEFORE INSERT ON TIPO_CONTA
    FOR EACH ROW
        BEGIN 
            IF :NEW.tip_conta_id IS NULL
                THEN SELECT SEQ_TIP_CONTA.NEXTVAL INTO :NEW.tip_conta_id FROM DUAL;
            END IF;
        END;

--Trigger Transações
CREATE OR REPLACE TRIGGER TRG_TRANSACOES
    BEFORE INSERT ON TRANSACOES
    FOR EACH ROW
        BEGIN
            IF :NEW.transacao_id IS NULL
                THEN SELECT SEQ_TRANSACOES.NEXTVAL INTO :NEW.transacao_id FROM DUAL;
            END IF;
        END;
        
--Trigger Usuario Sistema
CREATE OR REPLACE TRIGGER TRG_USER_SIS
    BEFORE INSERT ON USUARIO_SISTEMA
    FOR EACH ROW
        BEGIN
            IF :NEW.usuario_id IS NULL
                THEN SELECT SEQ_USER_SISTEMA.NEXTVAL INTO  :NEW.usuario_id from dual;
            END IF;
        END;
    
        
        
        
        
        
        
        