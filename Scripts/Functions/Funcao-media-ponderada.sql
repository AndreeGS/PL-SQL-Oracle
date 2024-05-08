--Criando a função para calculo de média ponderada
Create or replace function Fn_mediaPond
						(nota1 in number,
						 peso1 in number,
						 nota2 in number,
						 peso2 in number)
RETURN number
is 
media_pond number;
begin
			media_pond:= (nota1*peso1+nota2*peso2);
			return media_pond;
end;
/

--Visualizando a função
select Fn_mediaPond(2,1,5,2) from dual;