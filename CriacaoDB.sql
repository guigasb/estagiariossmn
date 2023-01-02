 CREATE DATABASE db_biblioteca
--ON PRIMARY (
NAME= db_biblioteca,
FILENAME= 'C:\SQL\db_biblioteca.MDF',
SIZE=6MB,
MAXSIZE=15MB,
FILEGROWTH=10%
)

USE db_biblioteca
sp_helpdb db_biblioteca

CREATE TABLE tbl_livro (
ID_livro SMALLINT PRIMARY KEY IDENTITY(100,1),
nome_livro VARCHAR(50) NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
ID_autor SMALLINT,
data_pub DATE NOT NULL,
preco_livro MONEY NOT NULL
)

CREATE TABLE tbl_autores (
ID_autor SMALLINT PRIMARY KEY,
nome_autor VARCHAR(50),
sobrenome_autor VARCHAR(60)
)

CREATE TABLE tbl_editoras (
ID_editora SMALLINT PRIMARY KEY IDENTITY,
nome_editora VARCHAR(50) NOT NULL
)

sp_help tbl_editoras

CREATE TABLE tbl_teste_identidade (
ID_teste SMALLINT PRIMARY KEY IDENTITY,
valor SMALLINT NOT NULL
)

INSERT INTO tbl_teste_identidade(valor) VALUES (10)
INSERT INTO tbl_teste_identidade(valor) VALUES (20)
INSERT INTO tbl_teste_identidade(valor) VALUES (30)
INSERT INTO tbl_teste_identidade(valor) VALUES (40)

SELECT * FROM tbl_teste_identidade

ALTER TABLE tbl_livro DROP COLUMN ID_autor

ALTER TABLE tbl_livro ADD ID_autor SMALLINT CONSTRAINT fk_ID_autor FOREIGN KEY (ID_autor) REFERENCES tbl_autores

ALTER TABLE tbl_livro ADD ID_editora SMALLINT CONSTRAINT fk_id_editora FOREIGN KEY (ID_editora) REFERENCES tbl_editoras

--ALTER TABLE tbl_livro ALTER COLUMN ID_autor INT - Não funciona pois esta coluna é foreign Key na tabela de livros

CREATE TABLE tbl_clientes (
 ID_cliente SMALLINT PRIMARY KEY IDENTITY,
 nome VARCHAR(100) NOT NULL,
 idade TINYINT
)

DROP TABLE tbl_teste_identidade

INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (1, 'Daniel', 'Barret')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (2, 'Gerald', 'Carter')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (3, 'Mark', 'Sobell')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (4, 'William', 'Stanek')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (5, 'Richard', 'Blum')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (6, 'Lucas', 'Costa')

SELECT * FROM tbl_autores

INSERT INTO tbl_editoras (nome_editora) VALUES ('Prentice Hall')
INSERT INTO tbl_editoras (nome_editora) VALUES ('O´Reilly')
INSERT INTO tbl_editoras (nome_editora) VALUES ('Microsoft Press')
INSERT INTO tbl_editoras (nome_editora) VALUES ('Wiley')

SELECT * FROM tbl_editoras

INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Linux Command Line ande Shell', '143856969', '20091221', 68.35, 5, 4)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('SSH, the Secure Shell', '127658789', '20091221', 58.30, 1, 2)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Using Samba', '123856789', '20001221', 61.45, 2, 2)
--Datas precisam ser colocadas entre aspas também, são tipo String

SELECT * FROM tbl_livro

ALTER TABLE tbl_livro DROP COLUMN data_pub --Inserir coluna
ALTER TABLE tbl_livro ADD data_pub DATE --não funcionou porque a tabela já continha registros e era NOT NULL. Não pode inserir uma coluna que iria ter registros vazios de data e tempo.
alter table tbl_livro alter column ID_autor smallint

INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Fedora and Red Hat Linux', '123346789', '20101101', 62.24, 3, 1)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Windows Server 2012 Inside Out', '123356789', '20040517', 66.30, 4, 3)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Microsoft Exchange Server 2010', '123366789', '20001221', 45.30, 4, 3)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_editora) VALUES ('NMAP Cookbook', '21236542', '20070618', 29.98, 3)

TRUNCATE TABLE (Apaga todos os registros da tabela)

SELECT nome_autor FROM tbl_autores
SELECT nome_livro FROM tbl_livro 
SELECT nome_livro, ID_autor FROM tbl_livro
SELECT nome_livro, ISBN from tbl_livro ORDER BY nome_livro
select nome_autor, sobrenome_autor from tbl_autores

select * from tbl_livro order by nome_livro ASC --ordem alfabética ascendente(o ORDER BY já ordena ascendente naturalmente)
select * from tbl_livro order by nome_livro DESC -- Ordem descendente

select ID_autor from tbl_livro
select distinct ID_autor from tbl_livro --exibir valores nao duplicados

select ID_autor from tbl_autores WHERE sobrenome_autor = 'Stanek'
select * from tbl_livro where ID_autor = '1'

select * from tbl_livro where ID_livro > 2 AND ID_autor < 3
select * from tbl_livro where ID_livro > 2 OR ID_autor < 3

delete from tbl_autores where ID_autor = 6 --Para Deletar um registro único
DELETE FROM tbl_autores where ID_autor = 4 --DELETAR REGISTRO UNICO

UPDATE tbl_livro SET preco_livro = 65.45 where ID_livro = 102 --ATUALIZA REGISTRO UNICO

UPDATE tbl_autores SET sobrenome_autor = 'Cartman' where ID_autor = 2 --ATUALIZA REGISTRO UNICO

UPDATE tbl_livro set preco_livro = 80.00, ISBN = 0202020 where ID_livro = 101 --ATUALIZA REGISTRO UNICO

select TOP 50 PERCENT nome_livro from tbl_livro --RETORNA A QUANTIDADE DE REGISTROS REFERENTES A 50% DO TOTAL
select TOP 2 nome_livro from tbl_livro --RETORNA OS 2 PRIMEIROS REGISTROS

select nome_livro as Livro, ID_autor as Autor from tbl_livro order by nome_livro --Apelidar a tabela

select ID_autor from tbl_autores union select ID_autor from tbl_livro --union all sem nenhum filtro

select nome_livro, ID_autor into livro_autor from tbl_livro where ID_livro > 2 --cria nova tabela com a selecao de colunas, ou todas colunas com *

select * into tbl_livro_backup from tbl_livro --cria uma nova tabela como cópia da selecionada

select count(*) from tbl_autores
select MAX(preco_livro) AS preco_max from tbl_livro
select MIN(preco_livro) AS preco_min from tbl_livro
select AVG(preco_livro) AS media_preco from tbl_livro
select SUM(preco_livro) AS preco_total from tbl_livro

select * from tbl_livro where data_pub BETWEEN '20040517' AND '20100517';
select nome_livro as Livro, preco_livro as Preco from tbl_livro where preco_livro BETWEEN 40.00 AND 60.00

select nome_livro from tbl_livro where nome_livro LIKE 's%' --retorna registros que comecam com a letra S NÃO É CASE SENSITIVE
select nome_livro from tbl_livro where nome_livro LIKE '%L' --retorna registros que terminam com a letra L
select nome_livro from tbl_livro where nome_livro LIKE '_i%' --retorna registros que tenham como segundo caractere a letra i, não importando o que vem depois
select nome_livro from tbl_livro where nome_livro LIKE '[SL]%' --retorna registros que comecam com S e L não importando o que vem depois
select nome_livro from tbl_livro where nome_livro LIKE '%[GL]' --retorna registros que terminam com G e L não importando o que vem antes
select nome_livro from tbl_livro where nome_livro LIKE '_[iS]%' --retorna registros que o segundo caractere tem E ou/e S não importando o restante 
select nome_livro from tbl_livro where nome_livro LIKE '[^iS]%' --retorna registros que não tem i ou/e S no inicio do seu nome
select nome_livro from tbl_livro where nome_livro LIKE '_[^iS]%' --retorna registros que não tem i ou S como segunda letra não importando o que vem depois
select nome_livro from tbl_livro where nome_livro LIKE '_i__o%' --retorna registros que tem a segunda letra i e a quinta letra O não importando o resto
select nome_livro from tbl_livro where nome_livro NOT LIKE 'M%' --retorna registros que não comecam com a letra M nao importa o resto


--JOINS ----------------------------------------------------------------------------------

select * from tbl_livro 
INNER JOIN tbl_autores 
ON tbl_livro.ID_autor = tbl_autores.ID_autor --RETORNA AQUILO QUE ESTÁ NAS DUAS TABELAS, QUE TEM CORRESPONDÊNCIA

select L.nome_livro, E.nome_editora 
from tbl_livro AS L 
INNER JOIN tbl_editoras AS E 
ON L.ID_editora = E.ID_editora --INNER JOIN DE COLUNAS Apelidando as Tabelas

select * from tbl_livro AS L
LEFT JOIN tbl_autores AS A
ON L.ID_autor = A.ID_autor --OUTER JOIN retorna tudo que esta na esquerda(primeira tabela) mesmo que não haja correspondencia na tabela direita, mostrando o que tem correspondencia e o que não tem

select * from tbl_autores 
left join tbl_livro 
on tbl_livro.ID_autor = tbl_autores.ID_autor
WHERE tbl_livro.ID_autor IS NULL --OUTER JOIN retorna apenas os livros que não tem autor, os livros em que o ID_autor é nulo, que não tem correspondência

select * from tbl_autores 
RIGHT JOIN tbl_livro 
ON tbl_autores.ID_autor = tbl_livro.ID_autor --OUTER JOIN retorna todos os valores de livros que tenha ou não correspondencia com autores/mesma

select * from tbl_livro
RIGHT JOIN tbl_editoras on tbl_livro.ID_editora = tbl_editoras.ID_editora
WHERE tbl_livro.ID_editora IS NULL --RIGHT JOIN que trás apenas as editoras que não tem correspondência com a table livro.

select Li.nome_livro, LI.ID_autor, Au.nome_autor 
FROM tbl_livro AS Li 
FULL JOIN tbl_autores AS Au 
ON Li.ID_autor = AU.ID_autor --FULL JOIN é um OUTER JOIN retorna todos os registros mesmo sem correspondência, mostrando todos que tem correspondencia

select Li.nome_livro, LI.ID_autor, Au.nome_autor
FROM tbl_livro AS Li
FULL JOIN tbl_autores AS Au
ON Li.ID_autor = AU.ID_autor 
WHERE Li.ID_autor IS NULL
OR Au.ID_autor IS NULL --FULL JOIN é um OUTER JOIN(retorna todos os registros que não tenham pelo menos 1 correspondência)

-------------------------------------------------------------------------------------------


select * from tbl_livro where ID_Autor IN (1,2) --retorna todos os registros em que o ID_Autor pode ir de 1 a 2
select * from tbl_livro where ID_autor = 1 or ID_autor = 2 --mesma coisa do IN com o OR que deixa mais extenso
select * from tbl_livro where ID_autor NOT IN (1,2) --retorna todos os registros em que o ID_Autor não vai de 1 a 2

--CAMPOS CALCULADOS

create table Produtos (
IDproduto smallint,
NomeProduto varchar(20),
Preco money,
Quantidade smallint,
Total AS (Preco*Quantidade)
) --Total AS (Preco*Quantidade) = Campo Total é calculado a partir dos dois atributos indicados

select * from Produtos

insert into Produtos (IDproduto, NomeProduto, Preco, Quantidade) values
	(1, 'Mouse', 15.00, 2),
	(2, 'Teclado', 18.00, 1),
	(3, 'Fones', 25.00, 1),
	(4, 'Pendrive', 25.00, 3),
	(5, 'SD Card', 29.00, 2),
	(6, 'DVD-R', 1.30, 12);

CREATE INDEX indice_nome_livro ON tbl_livro(nome_livro); --cria indices para facilitar pesquisas em tabelas que são muito consultadas

select * from tbl_livro;

CREATE RULE rule_preco AS @VALOR > 10.00; --cria regra como rule_preco AS "@valor" que é uma variável para armazenar o limite de preço do livro
--é necessário vincular esta regra a uma tabela e a uma coluna da tabela
EXECUTE SP_BINDRULE rule_preco, 'tbl_livro.preco_livro' --vincula a regra criada rule_preco, a este objeto "nomeTabela.nomeColuna"

UPDATE tbl_livro SET preco_livro = 9.90 where ID_livro = 101; --A regra não deixa atualizar o registro.

BACKUP DATABASE test
TO DISK = 'C:\arquivos\test.bak';
WITH FORMAT
GO --faz o backup do bando de dados no caminho especificado.

select nome_autor + ' ' + sobrenome_autor from tbl_autores AS Nome_Completo; --retorna os nomes e sobrenomes adicionando um espaço entre eles utilizando concatenação de strings
select 'eu gosto do livro ' + nome_livro AS 'Meu livro' from tbl_livro where ID_livro = 100

--COLLATIONS
select * from fn_helpcollations() --para ver as opções de agrupamentos

select SERVERPROPERTY('Collation') --para ver o esquema de colação usado

alter DATABASE db_biblioteca COLLATE Greek_CI_AI --alterar o esquema de agrupamento

select DATABASEPROPERTYEX('db_biblioteca'); -- verificar o esquema de agrupamento

select * from tbl_livro order by nome_livro collate Icelandic_CI_AI --alterar o agrupamento em nível de colunas

--WITH TIES

select TOP(5) WITH TIES nome_time, pontos FROM tbl_times ORDER BY Pontos DESC -- WITH TIES verifica se existe algum registro fora da restrição de consulta que tenha
-- o mesmo valor equivalente do ultimo item da consulta, garantindo que este item também seja mostrado na consulta

CREATE VIEW vw_LivrosAutores AS --nomeia a view
SELECT tbl_livro.nome_livro AS livro,
tbl_autores.nome_autor AS autor 
FROM tbl_livro
INNER JOIN tbl_autores
ON tbl_livro.ID_autor = tbl_autores.ID_autor;

select * from vw_LivrosAutores --para Usar a view criada acima

create view vw_LivroEditora AS
select tbl_livro.nome_livro as livro,
tbl_editoras.nome_editora as editora
from tbl_livro
inner join tbl_editoras 
on tbl_livro.ID_editora = tbl_editoras.ID_editora;

select * from vw_LivroEditora

select * from tbl_editoras

--EXEMPLO DO DEVMEDIA, fazendo um inner join com soma, agrupamento e ordenação:
SELECT TOP 3
   P.nome,
   SUM(VN.valor) as TOTAL
FROM
   produto P, venda_produto VN
WHERE
   P.id = VN.id_produto
GROUP BY
   P.id
ORDER BY
   TOTAL DESC

SELECT
   P.nome,
   SUM(VN.valor) as TOTAL
  FROM
   produto P, venda_produto VN
  WHERE
   P.id = VN.id_produto
  GROUP BY
   P.id
  ORDER BY
   TOTAL DESC
  LIMIT 0, 3


select top 4 , ISBN from tb_livro;

select * from tbl_autores where ID_autor in (2,3,4);

select * from tbl_autores where ID_autor = 2

--SINTAXE para retornar com Like utilizando duas condições
select nome_autor from tbl_autores where sobrenome_autor like 'Barret' or sobrenome_autor like 'Sobell';