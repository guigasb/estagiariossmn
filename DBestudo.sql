create database db_livraria

use db_livraria

CREATE TABLE tb_livro (
ID_livro smallint primary key IDENTITY(100,1),
titulo varchar(200) NOT NULL,
ISBN varchar(30) NOT NULL
)

CREATE TABLE tb_autor (
ID_autor smallint primary key,
nome varchar(100) NOT NULL,
idade tinyint NOT NULL,
nacionalidade varchar(50)
)

CREATE TABLE tb_editora (
ID_editora smallint primary key IDENTITY,
nome_editora varchar(100),
registro int NOT NULL
)

CREATE TABLE tb_cliente (
ID_cliente smallint PRIMARY KEY IDENTITY,
nome varchar(100) NOT NULL,
cpf bigint NOT NULL,
fk_ID_livro smallint FOREIGN KEY REFERENCES tb_livro(ID_livro)
)

alter table tb_livro add ID_autor smallint CONSTRAINT fk_ID_autor FOREIGN KEY (ID_autor) references tb_autor
alter table tb_livro add ID_editora smallint CONSTRAINT fk_ID_editora foreign key (ID_editora) references tb_editora
alter table tb_livro add data_pub date

insert into tb_livro (titulo, ISBN, data_pub) values ('A volta dos que não foram', '2020124', '20221222')
insert into tb_livro (titulo, ISBN, data_pub) values ('O amanhã reluzente', '2020123', '20211221')
insert into tb_livro (titulo, ISBN, data_pub) values ('Dias de um futuro esquecido', '2020456', '20201110')
insert into tb_livro (titulo, ISBN, data_pub) values ('Construindo sonhos com 1 real', '12316541', '20200906')
insert into tb_livro (titulo, ISBN, data_pub) values ('Teatralidade, desejo e ilusão: relatos de uma vida', '54698269658', '20130422')
insert into tb_livro (titulo, ISBN, data_pub, ID_autor, ID_editora) values ('Testando livros', '879264642', '20180508', 10, 20)

insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (1,'Iogoslav Bianchucrute', 65 , 'Russo')
insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (2, 'Bianca Paulozita', 42, 'Brazuca')
insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (3, 'Izadora Belancini', 38, 'Francesa')
insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (4, 'Gustav Brazonov', 69, 'Polonês')
insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (5, 'Mialuca Griezman', 33, 'Chinesa')
insert into tb_autor (ID_autor, nome, idade, nacionalidade) values (6, 'Baluarte Mancoso', 34, 'Brazuca')

truncate table tb_livro --não funciona quando a tabela tem restrição de foreign key apontando pra ela
delete from tb_livro where ID_livro between 100 and 104



select * from tb_autor


