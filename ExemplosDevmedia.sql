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

