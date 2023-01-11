USE db_escola;

CREATE DATABASE db_escola;

-- PRIMEIRO VAMOS CRIAR TODAS AS TABELAS QUE NÃO LEVAM FOREIGN KEY

CREATE TABLE sala
(id TINYINT PRIMARY KEY IDENTITY,
numero VARCHAR(5) NOT NULL,
vagas TINYINT NOT NULL);

CREATE TABLE turma 
(id SMALLINT PRIMARY KEY IDENTITY,
serie VARCHAR(30) NOT NULL);


--ALTER TABLE turma
--ADD CONSTRAINT id TINYINT PRIMARY KEY IDENTITY;

CREATE TABLE professor
(id TINYINT PRIMARY KEY IDENTITY,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
materia VARCHAR(30) NOT NULL);

--ALTER TABLE professor
--ALTER COLUMN materia VARCHAR(30) NULL;

CREATE TABLE horario
(id TINYINT PRIMARY KEY IDENTITY,
hora INT NOT NULL);

--ALTER TABLE horario
--ALTER COLUMN hora VARCHAR(5) NOT NULL

CREATE TABLE aluno
(id INT PRIMARY KEY IDENTITY,
nome VARCHAR(40) NOT NULL,
sobrenome VARCHAR(60) NOT NULL,
nascimento DATE NOT NULL,
cpf BIGINT NOT NULL,
alergia BIT NOT NULL,
genero VARCHAR(30) NOT NULL);


-- AGORA VAMOS CRIAR AS TABELAS QUE TEM FOREIGN KEYS

CREATE TABLE aula
(id SMALLINT PRIMARY KEY IDENTITY,
id_sala TINYINT NOT NULL,
id_turma SMALLINT NOT NULL,
id_professor SMALLINT NOT NULL
CONSTRAINT fk_id_sala FOREIGN KEY (id_sala) REFERENCES sala(id),
CONSTRAINT fk_id_turma FOREIGN KEY (id_turma) REFERENCES turma(id),
CONSTRAINT fk_id_professor FOREIGN KEY (id_professor) REFERENCES professor(id));


CREATE TABLE contato_aluno
(id INT PRIMARY KEY IDENTITY,
id_aluno INT NOT NULL,
telefone INT,
email VARCHAR(120) NOT NULL,
ddd TINYINT,
tipo_telefone VARCHAR(30)
CONSTRAINT fk_id_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id));


CREATE TABLE endereco_aluno
(id INT PRIMARY KEY IDENTITY,
id_aluno INT NOT NULL,
bairro VARCHAR(60) NOT NULL,
numero VARCHAR(9) NOT NULL,
cep BIGINT NOT NULL,
complemento VARCHAR(120),
cidade VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL
CONSTRAINT fk_id_aluno2 FOREIGN KEY (id_aluno) REFERENCES aluno(id));

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
	

INSERT INTO turma (serie) VALUES
	('6 ano'),
	('7 ano'),
	('8 ano'),
	('9 ano'),
	('1 ano ensino medio'),
	('2 ano ensino medio'),
	('3 ano ensino medio');

INSERT INTO professor (nome,sobrenome,materia) VALUES
	('Paulino', 'Arteria', 'Biologia molecular'),
	('Jaqueline', 'Xenon', 'Quimica'),
    ('Boris', 'Sparks', 'Logica'),
    ('Edward', 'Mãos de tesoura', 'Jardinagem'),
    ('Fluvio','Maluvio','Geografia'),
    ('Jorge','Silvaneto','Jiu jitsu para crianças'),
    ('Lulu','Bate-leite','Anatomia');

INSERT INTO horario (hora) VALUES
	('07:30'),
	('08:30'),
	('09:30'),
	('10:30'),
	('11:30'),
	('13:30'),
	('14:30'),
	('15:30'),
	('16:30'),
	('17:30');

INSERT INTO aluno (nome,sobrenome,nascimento,cpf,alergia,genero) VALUES
	('Belchior','Maluvido','11/11/2010','01524752136',0,'masuclino'),
	('Ramsés','Eslovaquio','07/07/2007','01452369855',1,'masculino'),
	('Andreza','Andressa','06/06/2006','66666666661',1,'feminino'),
	('Índio','Ama-Johnes','11/12/2000','01523654178',0,'masculino'),
	('Josefa','Tavares','24/11/1998','14523698715',0,'masculino'),
	('Alquingel','De Sousa','27/09/2015','14585325974',0,'masculino'),
	('Melquiades','','','','',''),
	('Derek','O Brabo','','','',''),
	('','','','','',''),
	('','','','','',''),
	('','','','','','');
