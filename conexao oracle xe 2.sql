select * from tabela_de_produtos where sabor not in ('Laranja','Manga');

select count(*), nome from tabela_de_clientes where nome like '%Mattos' group by nome;


select   distinct embalagem, sabor from tabela_de_produtos where sabor = 'Laranja';


select DISTINCT bairro from tabela_de_clientes where cidade = 'Rio de Janeiro';

select bairro,sum(limite_de_credito)  from tabela_de_clientes  
where cidade = 'Rio de Janeiro' group by bairro;


SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS
WHERE codigo_do_produto = '1101035'
AND QUANTIDADE = 99;



SELECT * FROM ITENS_NOTAS_FISCAIS
WHERE codigo_do_produto = '1101035'
ORDER BY QUANTIDADE DESC;



select nome_do_produto, preco_de_lista,
(case when preco_de_lista >= 12 then 'Produto caro'
when preco_de_lista >=7 and preco_de_lista <12 THEN 'produto barato'
else 'produto baratisssimo'
end) as status_preco
from tabela_de_produtos
where sabor = 'Manga';


SELECT NOME,
CASE WHEN TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') <= '1990' THEN 'Velho'
WHEN TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') > '1990' AND
TO_CHAR(DATA_DE_NASCIMENTO, 'YYYY') <= '1995' THEN 'Jovens' 
ELSE 'Crianças' END
FROM TABELA_DE_CLIENTES;

select * from tabela_de_clientes;


-- Quais os clientes que fizeram mais de 2000 compras em 2016?
SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS
WHERE TO_CHAR(DATA_VENDA, 'YYYY') = '2016'
GROUP BY CPF
HAVING COUNT(*) > 2000;

-- quantas notas cada vendedor emitiu?

select a.matricula, b.nome, count(*) as TotVendas from notas_fiscais a
inner join tabela_de_vendedores b
on a.matricula = b.matricula
group by a.matricula, b.nome;


/*Levando em consideração que o valor
financeiro das vendas consiste em multiplicar 
a quantidade pelo preço, obtenha o faturamento
anual da empresa.*/

SELECT TO_CHAR(DATA_VENDA, 'YYYY'), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM NOTAS_FISCAIS NF INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY TO_CHAR(DATA_VENDA, 'YYYY');
-- ---------------------------------------


SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR
, TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR
, TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE
, TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
INNER JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR
, TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR
, TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE
, TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
LEFT JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR
, TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR
, TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE
, TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
RIGHT JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR
, TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR
, TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE
, TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
FULL JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR
, TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR
, TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE
, TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES,  TABELA_DE_CLIENTES;


