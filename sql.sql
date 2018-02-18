create database assistant;

use assistant;

create table ENDERECO(
ID__ENDERECO integer primary key auto_increment,
RUA__ENDERECO varchar(100) not null,
BAIRRO__ENDERECO varchar(50) not null,
CIDADE__ENDERECO varchar(50) not null,
ESTADO__ENDERECO varchar(50) not null,
CEP__ENDERECO char(8)
);

create table contato(
ID__CONTATO integer primary key auto_increment,
NOME__CONTATO varchar(50) not null,
EMAIL__CONTATO varchar(50) not null,
DT_NASCIMENTO__CONTATO date not null,
PROFISSAO__CONTATO varchar(50) not null,
EMPRESA__CONTATO varchar(50),
ACEITA_EMAIL__CONTATO boolean,
ENDERECO__CONTATO integer,

foreign key (ENDERECO__CONTATO) references ENDERECO(ID__ENDERECO)

);


select * from contato;	


delimiter $$

CREATE PROCEDURE SP_ADD__CONTATO_ENDERECO
(IN_RUA__ENDERECO varchar(100),
IN_BAIRRO__ENDERECO varchar(50),
IN_CIDADE__ENDERECO varchar(50),
IN_ESTADO__ENDERECO varchar(50),
IN_CEP__ENDERECO char(9),
IN_NOME__CONTATO varchar(50),
IN_EMAIL__CONTATO varchar(50),
IN_DT_NASCIMENTO__CONTATO date,
IN_PROFISSAO__CONTATO varchar(50),
IN_EMPRESA__CONTATO varchar(50),
IN_ACEITA_EMAIL__CONTATO boolean
)
MODIFIES SQL DATA
BEGIN
INSERT INTO ENDERECO
(RUA__ENDERECO,BAIRRO__ENDERECO,CIDADE__ENDERECO,ESTADO__ENDERECO,CEP__ENDERECO)
VALUES
(IN_RUA__ENDERECO,IN_BAIRRO__ENDERECO,IN_CIDADE__ENDERECO,IN_ESTADO__ENDERECO,IN_CEP__ENDERECO);

INSERT INTO CONTATO
(NOME__CONTATO,EMAIL__CONTATO,DT_NASCIMENTO__CONTATO,PROFISSAO__CONTATO,EMPRESA__CONTATO,ACEITA_EMAIL__CONTATO, ENDERECO__CONTATO)
VALUES 
(IN_NOME__CONTATO,IN_EMAIL__CONTATO,IN_DT_NASCIMENTO__CONTATO,IN_PROFISSAO__CONTATO,IN_EMPRESA__CONTATO,IN_ACEITA_EMAIL__CONTATO, (SELECT LAST_INSERT_ID()));

END$$
/*
call SP_ADD__CONTATO_ENDERECO
("AVENIDA AMERICANA","OURO VERDE","MANAUS","AMAZONAS",
"69082452","WELLINGTON","WELLINGTON_OLIVEIRA@LIVE.COM","1991-04-20","ANALISTA TI",
"AMAZONCOPY",True);
*/