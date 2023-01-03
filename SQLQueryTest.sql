USE db_test

CREATE TABLE tbl_livro (
ID_livro SMALLINT PRIMARY KEY IDENTITY(100,1),
nome_livro VARCHAR(50) NOT NULL,
ISBN VARCHAR(30) NOT NULL UNIQUE,
ID_autor SMALLINT NOT NULL,
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

SELECT * FROM tbl_livro
SELECT * FROM tbl_editoras
SELECT * FROM tbl_autores

ALTER TABLE tbl_livro DROP COLUMN ID_autor

ALTER TABLE tbl_livro ADD ID_autor SMALLINT NOT NULL CONSTRAINT fk_ID_autor FOREIGN KEY (ID_autor) REFERENCES tbl_autores

ALTER TABLE tbl_livro ADD ID_editora SMALLINT NOT NULL CONSTRAINT fk_ID_editora FOREIGN KEY (ID_editora) REFERENCES tbl_editoras

SELECT COUNT (*) FROM tbl_livro

INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro) VALUES ('Fedora and Red Hat Linux', '123346789', '20101101', 62.24)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro) VALUES ('Windows Server 2012 Inside Out', '123356789', '20040517', 66.30)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro) VALUES ('Microsoft Exchange Server 2010', '123366789', '20001221', 45.30)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Linux Command Line ande Shell', '143856969', '20091221', 68.35, 5, 4)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('SSH, the Secure Shell', '127658789', '20091221', 58.30, 1, 2)
INSERT INTO tbl_livro (nome_livro, ISBN, data_pub, preco_livro, ID_autor, ID_editora) VALUES ('Using Samba', '123856789', '20001221', 61.45, 2, 2)

INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (1, 'Daniel', 'Barret')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (2, 'Gerald', 'Carter')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (3, 'Mark', 'Sobell')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (4, 'William', 'Stanek')
INSERT INTO tbl_autores (ID_autor, nome_autor, sobrenome_autor) VALUES (5, 'Richard', 'Blum')

INSERT INTO tbl_editoras (nome_editora) VALUES ('Prentice Hall')
INSERT INTO tbl_editoras (nome_editora) VALUES ('O´Reilly')
INSERT INTO tbl_editoras (nome_editora) VALUES ('Microsoft Press')
INSERT INTO tbl_editoras (nome_editora) VALUES ('Wiley')

DROP TABLE tbl_autores
DROP TABLE tbl_livro
DROP TABLE tbl_editoras

SELECT COUNT(*) FROM tbl_livro

TRUNCATE TABLE tbl_livro