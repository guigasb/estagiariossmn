CREATE DATABASE escola

USE escola

--PRIMEIRO VAMOS CRIAR TODAS AS TABELAS QUE NÃO LEVAM FOREIGN KEYS

CREATE TABLE sala
(id TINYINT PRIMARY KEY IDENTITY,
numero VARCHAR(5) NOT NULL,
vagas TINYINT NOT NULL);

-- CREATE TABLE - Cria a tabela
-- Ao criar, precisamos "tipar" os dados, informando se eles serão int, char, varchar...
-- Também devemos setar as constraints, no caso informando se aquela coluna é NOT NULL, PRIMARY KEY, FOREIGN KEYS, UNIQUE...
-- O IDENTITY é colocado na construção da query quando você deseja que os IDs sejam auto-incrementos

CREATE TABLE turma 
(id TINYINT PRIMARY KEY IDENTITY,
serie VARCHAR(30) NOT NULL,
quantidade_alunos TINYINT NOT NULL);

CREATE TABLE dia_hora
(id TINYINT PRIMARY KEY IDENTITY,
hora_aula VARCHAR(5) NOT NULL,
dia VARCHAR(15) NOT NULL);

CREATE TABLE endereco_aluno
(id INT PRIMARY KEY IDENTITY,
logradouro VARCHAR(120) NOT NULL,
bairro VARCHAR(60) NOT NULL,
numero VARCHAR(9) NOT NULL,
cep INT NOT NULL,
complemento VARCHAR(120),
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL);

CREATE TABLE endereco_professor
(id INT PRIMARY KEY IDENTITY,
logradouro VARCHAR(120) NOT NULL,
bairro VARCHAR(60) NOT NULL,
numero VARCHAR(9) NOT NULL,
cep INT NOT NULL,
complemento VARCHAR(120),
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL);

-- AGORA, JÁ COM ESTAS CRIADAS, PODEMOS CRIAR AS TABELAS QUE LEVAM FOREIGN KEYS

CREATE TABLE contato_aluno
(id INT PRIMARY KEY IDENTITY,
id_aluno INT NOT NULL,
ddd TINYINT NOT NULL,
telefone INT NOT NULL,
email VARCHAR(120) UNIQUE NOT NULL,
CONSTRAINT fk_id_aluno FOREIGN KEY(id_aluno) REFERENCES aluno(id));


CREATE TABLE contato_professor
(id INT PRIMARY KEY IDENTITY,
id_professor TINYINT NOT NULL,
ddd TINYINT NOT NULL,
telefone INT NOT NULL,
email VARCHAR(120) UNIQUE NOT NULL
CONSTRAINT fk_id_professor FOREIGN KEY(id_professor) REFERENCES professor(id));

CREATE TABLE professor
(id TINYINT PRIMARY KEY IDENTITY,
id_endereco_professor INT NOT NULL,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
materia VARCHAR(30) NOT NULL,
CONSTRAINT fk_id_endereco_professor FOREIGN KEY(id_endereco_professor) REFERENCES endereco_professor(id));


CREATE TABLE aluno
(id INT PRIMARY KEY IDENTITY,
id_turma TINYINT NOT NULL,
id_endereco_aluno INT NOT NULL,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
nascimento DATE NOT NULL,
cpf BIGINT UNIQUE NOT NULL,
alergia VARCHAR(60),
genero CHAR(1) NOT NULL,
CONSTRAINT fk_id_turma FOREIGN KEY(id_turma) REFERENCES turma(id),
CONSTRAINT fk_id_endereco_aluno FOREIGN KEY(id_endereco_aluno) REFERENCES endereco_aluno(id));

CREATE TABLE aula
(id INT PRIMARY KEY IDENTITY,
id_sala TINYINT NOT NULL,
id_turma TINYINT NOT NULL,
id_professor TINYINT NOT NULL,
id_dia_hora TINYINT NOT NULL
CONSTRAINT fk_id_sala FOREIGN KEY (id_sala) REFERENCES sala(id),
CONSTRAINT fk_id_turma2 FOREIGN KEY (id_turma) REFERENCES turma(id),
CONSTRAINT fk_id_professor2 FOREIGN KEY (id_professor) REFERENCES professor(id),
CONSTRAINT fk_id_dia_hora FOREIGN KEY (id_dia_hora) REFERENCES dia_hora(id));

--CRIAMOS TODAS AS TABELAS DE ACORDO COM A MODELAGEM, AGORA VAMOS POPULAR O BANCO.

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
	('bessa',33,50124479,'sem complemento','Joao Pessoa','PB','Das laranjeiras'),
	('altiplano',17,59987713,'Edificio Next Tower','Joao Pessoa','PB','Catorze');

INSERT INTO endereco_professor (logradouro,bairro,numero,cep,complemento,cidade,uf) VALUES
	('Rua Diazepan Virgulino da Silva','Tambaú',2424,58451236,'Casa','Joao Pessoa','PB'),
	('Rua Vandick Pinto Filgueiras','Tambauzinho',2412,58003654,'Apartamento 304','Joao Pessoa','PB'),
	('Rua Deputado Geraldo Mariz','Tambauzinho',1311,58417000,'Apartamento 201','Joao Pessoa','PB'),
	('Rua Desembargador Edmundo Jordao','Bessa',127,58558713,'Casa','Joao Pessoa','PB'),
	('Rua Fernandinha Beira-rio','Varadouro',696,58147586,'Casa','Joao Pessoa','PB'),
	('Rua Robertinha Caçarola','Geisel',666,58741529,'Casa','Joao Pessoa','PB'),
	('Rua Sofia Madeixas','Cuiá',312,58451236,'Casa','Joao Pessoa','PB'),
	('Rua Izaline Kelly Pompeu','Cristo',177,58412358,'Casa','Joao Pessoa','PB')
 

INSERT INTO professor (id_endereco_professor,nome,sobrenome,materia) VALUES
	(1,'Lucas','Curte-mel','Biologia'),
	(2,'Serafim','Augusto dos santos','Teologia'),
	(3,'Rafael','Santos Drummond','Aviação'),
	(4,'Charles','Henriquepédia','Gramática'),
	(5,'Mimbo','Zimbo','Química'),
	(6,'Majim','Boo','Gastronomia'),
	(7,'Chamber','Mazzaropio','História'),
	(8,'Pumba','La pumba','Dança rítmica')

INSERT INTO contato_aluno(id_aluno,ddd,telefone,email) VALUES
	(1,83,981144523,'lesma@gmail.com'),
	(5,83,983290564,'kleydison@gmail.com'),
	(7,83,997632091,'lipidio@gmail.com'),
	(8,83,998345302,'bomboniere@hotmail.com'),
	(9,83,998743256,'digdong@gmail.com'),
	(10,83,991239520,'elfoladino@hotmail.com'),
	(11,83,997583924,'xitinhas@gmail.com'),
	(12,83,997234923,'candelabrinho@gmail.com');

	INSERT INTO contato_professor(id_professor,ddd,telefone,email) VALUES
	(1,83,998723684,'ximbinha@gmail.com'),
	(2,83,998544123,'joelmis@gmail.com'),
	(3,83,985541221,'simbinha@gmail.com'),
	(4,83,999999741,'joanamilgrau@hotmail.com'),
	(5,83,998511475,'fluttermutter@gmail.com'),
	(6,83,996654712,'evrileri@hotmail.com'),
	(7,83,999741110,'milkas10@gmail.com'),
	(8,83,991222112,'chamberdamassa@gmail.com');
	
INSERT INTO aluno(id_turma,id_endereco_aluno,nome,sobrenome,nascimento,cpf,alergia,genero) VALUES
	(1,1,'Flavio','Castro','20001231',1112445698,'não tem','M'),
	(1,2,'Ana Julia','Bates','20000114',1852364479,'camarão','F')
	(1,3,'Gabriel','Fleumas','19991203',01192445698,'ácaro','M'),
	(1,4,'Spinardi','Haikaiss','20010811',01342445698,'poeira','M'),
	(2,5,'Fidel','Castro','20000411',01121445698,'canabidiol','M'),
	(2,6,'César','Coelho','20010809',01174445698,'dipirona','M'),
	(2,7,'Mariana','Cunha Lima','20000908',0232445698,'não tem','M'),
	(2,8,'Lucas','Siga bem-caminhoneiro','20001004',04412445698,'tem,mas não sabe qual é','M'),
	((SELECT id FROM turma WHERE serie like '6º ano A'), 7, 'João', 'Carlos', '20000230', 09240329110, NULL, 'M');

SELECT * FROM aluno;

UPDATE aluno 
SET alergia = NULL
WHERE alergia LIKE 'canabidiol' OR alergia LIKE 'não tem'

SELECT * FROM aluno;

INSERT INTO aula (id_sala,id_turma,id_professor,id_dia_hora) VALUES
	(1, 8, 5,13),
	(2, 7, 4,14),
	(3, 6, 3,16),
	(4, 5, 2,15),
	(5, 4, 1,11),
	(6, 3, 6,10),
	(7, 2, 7,17),
	(8, 1, 8,11);


SELECT a.nome AS 'Nome do aluno',
 a.sobrenome AS 'Sobrenome do aluno', a.cpf, t.serie, ea.bairro
FROM aluno AS a
INNER JOIN turma AS t
ON t.id=a.id_turma
INNER JOIN endereco_aluno AS ea
ON a.id_endereco_aluno=ea.id

SELECT *
FROM aluno
LEFT JOIN turma 
ON turma.id = aluno.id
WHERE id_turma IS NULL

SELECT * FROM professor