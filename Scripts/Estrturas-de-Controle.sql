
--Estrtutura IF-ELSE-END IF
SET SERVEROUTPUT ON;

ACCEPT v_digitado PROMPT 'Digite o n�mero da sorte: '

DECLARE
	v_numero int;
	v_sorte int default 5;
	
 BEGIN
	v_numero :=&v_digitado;
	
	IF v_numero =v_sorte 
        THEN
            dbms_output.put_line('Parab�ns! voc� acertou!');
        ELSE 
            dbms_output.put_line('Mais sorte na pr�xima hehe');
	END IF;
END;
/	


--Estrutura IF-ELSE-ELSIF-END IF
SET SERVEROUTPUT ON
    ACCEPT v_digitado PROMPT 'Digite um n�mero de 0 a 100: '
    DECLARE
        v_numero int;
        BEGIN
            v_numero:=&v_digitado;
            
            IF v_numero <= 10  THEN dbms_output.put_line('Seu n�mero esta entre 0 a 10');
 
                ELSIF v_numero > 10 and v_numero <= 30 THEN 
                        DBMS_OUTPUT.PUT_LINE('seu numero esta entre 11 a 30');
                
                ELSIF v_numero > 31 and v_numero <= 50 THEN 
                        DBMS_OUTPUT.PUT_LINE('seu numero esta entre 31 a 50');    

                ELSIF v_numero > 50 and v_numero <= 100 THEN 
                        DBMS_OUTPUT.PUT_LINE('seu numero esta entre 51 a 100');

                ELSE 
                    DBMS_OUTPUT.PUT_LINE('Seu n�mero est� fora os limites');
        END IF;
END;
/













