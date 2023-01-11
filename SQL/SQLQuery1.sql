CREATE DATABASE db_escolaworkshop

USE db_escolaworkshop;

-- PRIMEIRO VAMOS CRIAR TODAS AS TABELAS QUE NÃO LEVAM FOREIGN KEYS.

CREATE TABLE sala
(id TINYINT PRIMARY KEY IDENTITY,
numero VARCHAR(5) NOT NULL,
vagas TINYINT NOT NULL);

CREATE TABLE turma 
(id TINYINT PRIMARY KEY IDENTITY,
serie VARCHAR(30) NOT NULL,
quantidade_alunos TINYINT NOT NULL);


--ALTER TABLE turma
--ADD CONSTRAINT id TINYINT PRIMARY KEY IDENTITY;

CREATE TABLE dia_hora
(id TINYINT PRIMARY KEY IDENTITY,
hora_aula VARCHAR(5) NOT NULL,
dia VARCHAR(15) NOT NULL);

CREATE TABLE endereco_aluno
(id INT PRIMARY KEY IDENTITY,
bairro VARCHAR(60) NOT NULL,
numero VARCHAR(9) NOT NULL,
complemento VARCHAR(120),
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL,
logradouro VARCHAR(120) NOT NULL,
cep INT NOT NULL);


CREATE TABLE contato_aluno
(id INT PRIMARY KEY IDENTITY,
ddd TINYINT NOT NULL,
telefone INT NOT NULL,
email VARCHAR(120) UNIQUE NOT NULL);

CREATE TABLE endereco_professor
(id INT PRIMARY KEY IDENTITY,
bairro VARCHAR(60) NOT NULL,
numero VARCHAR(9) NOT NULL,
complemento VARCHAR(120),
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL,
logradouro VARCHAR(120) NOT NULL,
cep INT NOT NULL);

CREATE TABLE contato_professor
(id INT PRIMARY KEY IDENTITY,
ddd TINYINT NOT NULL,
telefone INT NOT NULL,
email VARCHAR(120) UNIQUE NOT NULL);

-- AGORA VAMOS CRIAR AS TABELAS QUE TEM FOREIGN KEYS

CREATE TABLE professor
(id TINYINT PRIMARY KEY IDENTITY,
id_contato INT NOT NULL,
id_endereco INT NOT NULL,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
materia VARCHAR(30) NOT NULL,
CONSTRAINT fk_id_endereco_professor FOREIGN KEY(id) REFERENCES endereco_professor(id);


CREATE TABLE aluno
(id INT PRIMARY KEY IDENTITY,
id_turma TINYINT NOT NULL,
id_contato INT NOT NULL,
id_endereco INT NOT NULL,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
nascimento DATE NOT NULL,
cpf BIGINT UNIQUE NOT NULL,
alergia VARCHAR(60),
genero CHAR(1) NOT NULL,
CONSTRAINT fk_id_turma FOREIGN KEY(id_turma) REFERENCES turma(id),
CONSTRAINT fk_id_endereco2 FOREIGN KEY(id_endereco) REFERENCES endereco(id),
CONSTRAINT fk_id_contato2 FOREIGN KEY(id_contato) REFERENCES contato(id));


CREATE TABLE aula
(id INT PRIMARY KEY IDENTITY,
id_sala TINYINT NOT NULL,
id_turma TINYINT NOT NULL,
id_professor TINYINT NOT NULL,
id_dia_hora TINYINT NOT NULL
CONSTRAINT fk_id_sala FOREIGN KEY (id_sala) REFERENCES sala(id),
CONSTRAINT fk_id_turma2 FOREIGN KEY (id_turma) REFERENCES turma(id),
CONSTRAINT fk_id_professor FOREIGN KEY (id_professor) REFERENCES professor(id),
CONSTRAINT fk_id_dia_hora FOREIGN KEY (id_dia_hora) REFERENCES dia_hora(id));

-- VAMOS INSERIR OS REGISTROS.


INSERT INTO sala (numero,vagas) VALUES
	(1,50),
	(2,50),
	(3,50),
	(4,50),
	(5,50),
	(6,30),
	(7,30),
	(8,30),
	(9,30),
	(10,30),
	(11,28),
	(13,31),
	(14,70),
	(15,10);

INSERT INTO turma (serie, quantidade_alunos) VALUES
	('6º ano A', 17),
	('6º ano B', 20),
	('7º ano', 27),
	('8º ano A', 30),
	('8º ano B', 30),
	('9º ano', 25),
	('1º ano A, ensino medio', 40),
	('1º ano B, ensino medio', 40),
	('2º ano A, ensino medio', 50),
	('2º ano B, ensino medio', 50),
	('3º ano A, ensino medio', 50),
	('3º ano B, ensino medio', 50);

INSERT INTO dia_hora (hora_aula,dia) VALUES
	('07:30','segunda-feira'),
	('08:30','segunda-feira'),
	('09:30','segunda-feira'),
	('10:30','segunda-feira'),
	('11:30','segunda-feira'),
	('13:30','segunda-feira'),
	('14:30','segunda-feira'),
	('15:30','segunda-feira'),
	('16:30','segunda-feira'),
	('17:30','segunda-feira'),
	('07:30','terça-feira'),
	('08:30','terça-feira'),
	('09:30','terça-feira'),
	('10:30','terça-feira'),
	('11:30','terça-feira'),
	('13:30','terça-feira'),
	('14:30','terça-feira'),
	('15:30','terça-feira'),
	('16:30','terça-feira'),
	('17:30','terça-feira'),
	('07:30','quarta-feira'),
	('08:30','quarta-feira'),
	('09:30','quarta-feira'),
	('10:30','quarta-feira'),
	('11:30','quarta-feira'),
	('13:30','quarta-feira'),
	('14:30','quarta-feira'),
	('15:30','quarta-feira'),
	('16:30','quarta-feira'),
	('17:30','quarta-feira'),
	('07:30','quinta-feira'),
	('08:30','quinta-feira'),
	('09:30','quinta-feira'),
	('10:30','quinta-feira'),
	('11:30','quinta-feira'),
	('13:30','quinta-feira'),
	('14:30','quinta-feira'),
	('15:30','quinta-feira'),
	('16:30','quinta-feira'),
	('17:30','quinta-feira'),
	('07:30','sexta-feira'),
	('08:30','sexta-feira'),
	('09:30','sexta-feira'),
	('10:30','sexta-feira'),
	('11:30','sexta-feira'),
	('13:30','sexta-feira'),
	('14:30','sexta-feira'),
	('15:30','sexta-feira'),
	('16:30','sexta-feira'),
	('17:30','sexta-feira');

INSERT INTO endereco_aluno(bairro,numero,cep,complemento,cidade,uf,logradouro) VALUES
	('tambauzinho',70,58145336,'Na rua da EPC','Joao Pessoa','PB','Joaquim Filho'),
	('tambau',13,58145236,'Em frente a delegacia','Joao Pessoa','PB','Das Pluminhas'),
	('pedro gondim',72,58704330,'Ao lado da escola Sagres','Joao Pessoa','PB','Deputado Acacio Figueiredo'),
	('varadouro',50,51147765,'Em frente a serigrafia do rouquinho','Joao Pessoa','PB','Pinto das neves'),
	('geisel',40,51145896,'Atrás da rua esburacada','Joao Pessoa','PB','Serelepe'),
	('cabo branco',70,55563214,'Em frente ao supermercado Bem Mais','Joao Pessoa','PB','Joao Pedro II'),
	('bessa',33,50124479,NULL,'Joao Pessoa','PB','Das laranjeiras'),
	('altiplano',17,59987713,'Edificio Next Tower','Joao Pessoa','PB','Catorze');

INSERT INTO contato_aluno(ddd,telefone,email) VALUES
	(83,981144523,'ximbinha@gmail.com'),
	(83,998544123,'joelmis@gmail.com'),
	(83,985541221,'simbinha@gmail.com'),
	(83,999999741,'joanamilgrau@hotmail.com'),
	(83,998511475,'fluttermutter@gmail.com'),
	(83,996654712,'evrileri@hotmail.com'),
	(83,999741110,'milkas10@gmail.com'),
	(83,991222112,'chamberdamassa@gmail.com');