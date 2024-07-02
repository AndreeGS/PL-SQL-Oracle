--Tabela departamento 
CREATE TABLE  DEPARTAMENTO 
(
    departamento_id int not null primary key,
    descricao varchar2 (20)
)

--Sequencia para a tabela departamento
CREATE SEQUENCE SEQ_DPT START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela cargo
CREATE TABLE CARGO 
(
    cargo_id int not null primary key,
    descricao varchar2 (20),
    salario decimal (10,2)
)

--Sequencia para a tabela cargo
CREATE SEQUENCE SEQ_CARGO START WITH 1 INCREMENT BY 1 NOMAXVALUE;


--Tabela Unidade da Federação
CREATE TABLE UNIDADE_FEDERACAO
(
    uf_id int not null primary key,
    sigla_uf varchar2(2) not null,
    descricao_uf varchar2(30) not null
)

--Sequencia para a tabela Unidade Federação
CREATE SEQUENCE SEQ_UF START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Cidade
CREATE TABLE CIDADE 
(
    cidade_id int not null primary key,
    descricao varchar2(30),
    uf_id int not null,
    
    constraint fk_cidade_uf foreign key (uf_id) references UNIDADE_FEDERACAO(uf_id)
)

--Sequencia para tabela Cidade
CREATE SEQUENCE SEQ_CIDADE START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Agencia
CREATE TABLE AGENCIA
(
    agencia_id int not null primary key,
    descricao varchar2(30),
    endereco varchar2(50),
    bairro varchar2(30),
    cidade_id int not null,
    
    constraint fk_agencia_cidade foreign key (cidade_id) references CIDADE(cidade_id)
)

--Sequencia para tabela Agencia
CREATE SEQUENCE SEQ_AGENCIA START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Empregado
CREATE TABLE EMPREGADO
(
    empregado_id int not null primary key,
    departamento_id int not null,
    cargo_id int not null,
    agencia_id int not null,
    
    matricula varchar2(6),
    nome varchar2(40),
    endereco varchar2(50),
    email varchar2(25),
    bairro varchar2(30),
    cidade_id int not null,
    
    constraint fk_empregado_departamento foreign key (departamento_id) references DEPARTAMENTO(departamento_id),
    constraint fk_empregado_cargo foreign key (cargo_id) references CARGO(cargo_id),
    constraint fk_empregado_agencia foreign key (agencia_id) references AGENCIA(agencia_id),
    constraint fk_empregado_cidade foreign key (cidade_id) references CIDADE(cidade_id)
)

--Sequencia para tabela Empregado
CREATE SEQUENCE SEQ_EMP START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Usuario Sistema
CREATE TABLE USUARIO_SISTEMA
(
    usuario_id int not null primary key,
    empregado_id int not null,
    senha varchar2(15),
    dt_cadastro_sistema date,
    
    constraint fk_usuario_empregado foreign key (empregado_id) references  EMPREGADO(empregado_id)
)

CREATE SEQUENCE SEQ_USER_SISTEMA START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Cliente
CREATE TABLE CLIENTE 
(
    cliente_id int not null primary key,
    nome varchar2(40),
    endereco varchar2(50),
    bairro varchar2(30),
    cidade_id int not null,
    email varchar2(25),
    
    telefone varchar2(15),
    dt_nascimento date,
    estado_civil varchar2(10) DEFAULT 'Solteiro' CHECK (estado_civil IN ('Solteiro', 'Casado', 'Divorciado', 'Viuvo')),
    dt_cad_cliente date,
    sn_ativo char(1) DEFAULT 'S' CHECK (sn_ativo in ('S', 'N')),

    constraint fk_client_cidade foreign key (cidade_id) references CIDADE(cidade_id)
)

--Sequencia para tabela Cliente
CREATE SEQUENCE SEQ_CLIENTE  START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela Conta
CREATE TABLE TIPO_CONTA
(
    tip_conta_id int not null primary key,
    descricao varchar2(10)
)

--Sequencia para tabela Tipo Conta
CREATE SEQUENCE SEQ_TIP_CONTA START WITH 1 INCREMENT BY 1 NOMAXVALUE;


--Tabela Conta
CREATE TABLE CONTA
(
    conta_id int not null primary key,
    numero_conta varchar2(12),
    cliente_id int not null,
    tip_conta_id int not null,
    saldo decimal (20,2),
    dt_abertura_conta date,
    sn_ativo char(1) DEFAULT 'S' CHECK (sn_ativo in ('S', 'N')),
   
    constraint fk_conta_cliente foreign key (cliente_id) references CLIENTE(cliente_id),
    constraint fk_conta_tip_conta foreign key (tip_conta_id) references TIPO_CONTA(tip_conta_id)
)

--Sequencia tabela Conta
CREATE SEQUENCE SEQ_CONTA START WITH 1 INCREMENT BY 1 NOMAXVALUE;

--Tabela transacoes
CREATE TABLE TRANSACOES
(
    transacao_id int not null primary key,
    conta_id int not null,
    descricao_transacao varchar2(15),
    valor decimal (20,2),
    dt_transacao date,
    
    constraint fk_transacao_conta foreign key (conta_id) references CONTA(conta_id)
)

--Sequencia tabela Transacoes
CREATE SEQUENCE SEQ_TRANSACOES START WITH 1 INCREMENT BY 1 NOMAXVALUE;




















