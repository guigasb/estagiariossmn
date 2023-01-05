--EXEMPLOS DO DEVMEDIA, fazendo um inner join com soma, agrupamento e ordenação:
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

--SINTAXE WHERE
SELECT
    *
FROM
    cliente
WHERE
    email like ‘%@yahoo.com.br’ AND cidade = ‘São Paulo’
--SINTAXE EXISTS
SELECT
P.ID,
P.nome
FROM
produto P
WHERE
EXISTS (
  SELECT
      V.ID_PRODUTO
  FROM
      venda_produto V
  WHERE
      V.ID_PRODUTO = P.ID
)
--SINTAXE NOT EXISTS
SELECT
P.ID,
P.nome
FROM
produto P
WHERE
NOT EXISTS (
  SELECT
      V.ID_PRODUTO
  FROM
      venda_produto V
  WHERE
      V.ID_PRODUTO = P.ID
)
--SINTAXE IN COM INNER JOIN
SELECT
    A.nome,
    T.nome as Turma,
    S.status as Status
FROM
    Aluno A
INNER JOIN
    Turma T
ON T.id = A.id_turma
INNER JOIN
    Status S
ON S.id = A.id_status
WHERE
    A.id_status IN (1,3)

--SINTAXE IN COM SUBCONSULTAS
SELECT
    A.nome
FROM
  aluno A
WHERE
  A.ID IN (
     SELECT
        ID_ALUNO
     FROM
		Trancamento_aluno T
	 WHERE
		T.id_aluno = A.ID
)

--SINTAXE IN
SELECT
    P.id,
    P.titulo
FROM
  projetos P
WHERE
  P.id IN
    (
     SELECT
       C.id_projeto
     FROM
       comentario C
     WHERE
       C.id_projeto = P.id
    )

--SINTAXE IN COM NOT
SELECT
    P.id,
    P.titulo
FROM
  projetos P
WHERE
  P.id NOT IN
    (
     SELECT
       C.id_projeto
     FROM
       comentario C
     WHERE
       C.id_projeto = P.id
    )





