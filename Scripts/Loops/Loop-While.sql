
--LOOP WHILE

SET SERVEROUTPUT ON
ACCEPT V_DIGITADO PROMPT 'DIGITE O VALOR: ';
DECLARE
    V_TAB INT;
    V_LIMIT INT DEFAULT 1;
    
BEGIN
    V_TAB := &V_DIGITADO;
    WHILE V_LIMIT <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE (V_LIMIT || ' X ' || V_TAB || ' = ' || V_LIMIT*V_TAB);
        V_LIMIT := V_LIMIT + 1;
    END LOOP;
END;
/



 -- EXEMPLO USANDO ESTRUTURA WHILE COM EXIT
 SET SERVEROUTPUT ON
ACCEPT V_Digitado PROMPT 'Digite a tabuada:'
DECLARE
     V_TAB int;
     V_LIMIT int default 1;
     
     BEGIN
       V_TAB:=&V_Digitado;
        WHILE  V_LIMIT<=10 LOOP
            DBMS_OUTPUT.PUT_LINE (V_LIMIT||' X '||V_TAB||' = '||V_LIMIT*V_TAB);
            V_LIMIT:=V_LIMIT+1;
            
        EXIT WHEN V_LIMIT>5;
        
      END LOOP;
 END;
 /