CREATE VIEW produtos_cancelados_2 AS (
	SELECT p."Codigo" AS "Cod_p", v."Codigo" AS "Cod_v", v."Courier Status", p."Preco", v."Qty", CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) AS "Preco_2" 
	FROM vendas v, produtos p
	WHERE v."Codigo" = p."Codigo" AND "Courier Status" = 'Cancelled' 
	ORDER BY CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) DESC 
)

--

CREATE VIEW max_vendas_preco AS (
SELECT p."Codigo" AS "Codigo_Produto", p."Produto", 
CAST (REPLACE(p."Preco", '$', '') AS decimal) AS Preco, 
v."Codigo" AS "Codigo_Venda", v."Courier Status", v."Qty", v."Date"
FROM vendas v, produtos p
WHERE p."Codigo" = v."Codigo" AND "Courier Status" = 'Shipped'
)

SELECT sum(mx."Qty") AS total_vendas, mx."Produto", mx."preco"
FROM max_vendas_preco mx
GROUP BY mx."Produto", mx."preco"
ORDER BY total_vendas DESC







-- Faixas de Preço
---- Definir primeiro as faixas que serão utilizadas:
------ 1. 0 a 100 2. 100 a 200 3. 200 a 300 4 300 a 400 5 400 +

SELECT v."Courier Status", v."Qty", p."Preco", v."Codigo", p."Codigo"  FROM vendas v, produtos p 
WHERE v."Codigo" = p."Codigo" AND "Courier Status" = 'Cancelled'
ORDER BY CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) DESC; 
WHERE p."Preco" BETWEEN 0 AND 100


--SELECT p."faixa", p."Preco", count(v."Qty") FROM vendas v, produtos p,
--		IF(p."Preco"<= 100.00, '$0 - $100', 
--		IF (p."Preco" <= 200.00, '$101 - $200', 
--		IF (p."Preco" <= 300.00, '$201 - $300', 
--		IF (p."Preco" <= 400.00, '$301 - $400', 
--		IF (p."Preco" > 400.00, '$400+'))))) faixa_de_preco, p."Preco";