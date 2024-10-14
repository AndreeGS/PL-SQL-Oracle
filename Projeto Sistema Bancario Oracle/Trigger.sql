--Trigger para sequencia tabela audit cliente
CREATE OR REPLACE TRIGGER TRG_SEQ_AUDIT_CLIENTE
    BEFORE INSERT ON AUDIT_CLIENTE
    FOR EACH ROW
        BEGIN
            IF :NEW.auditoria_cliente_id IS NULL
                THEN SELECT SEQ_AUDIT_CLIENTE.NEXTVAL INTO :NEW.auditoria_cliente_id FROM DUAL;
            END IF; 
        END;
        
--Trigger audit cliente
CREATE OR REPLACE TRIGGER TRG_AUDIT_CLIENTE
    AFTER INSERT
    FOR EACH
    
        
--