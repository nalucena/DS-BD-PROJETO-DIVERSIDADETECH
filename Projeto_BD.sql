--Primeira View -> Filtrando os produtos cancelados
	-- Para garantir a ordenação correta e permitir trabalhar com os dados, foi realizada a
	-- conversão dos dados da coluna preço, em uma coluna secundária, para o formato numerico.

CREATE VIEW produtos_cancelados_2 AS (
	SELECT p."Codigo" AS "Cod_p", v."Codigo" AS "Cod_v", v."Courier Status", p."Preco", v."Qty", 
	CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) AS "Preco_2" 
	FROM vendas v, produtos p
	WHERE v."Codigo" = p."Codigo" AND "Courier Status" = 'Cancelled' 
	ORDER BY CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) DESC 
	
-- Segunda View -> Classificando os cancelamentos por faixa de preço
	-- Foi realizada a classificação, quantificação, agrupamento e ordenação dos dados em base descrescente.
	
CREATE VIEW faixas_cancelados as
SELECT sum("Qty") AS "numero_de_cancelamentos",
	CASE 
		WHEN (produtos_cancelados_2."Preco_2" <= 100) THEN '0 - 100'
		WHEN (produtos_cancelados_2."Preco_2" <= 200) THEN '101 - 200'
		WHEN (produtos_cancelados_2."Preco_2" <= 300) THEN '201 - 300'
		WHEN (produtos_cancelados_2."Preco_2" <= 400) THEN '301 - 400'
		ELSE '400+'
		
		--WHEN (produtos_cancelados_2."Preco_2" > 400) THEN '400+'-- 
		
	END AS faixa_de_preco
FROM produtos_cancelados_2
GROUP BY faixa_de_preco
ORDER BY "numero_de_cancelamentos" DESC; 

-- Com base no resultado encontrado na segunda view, decidimos que para ter uma análise mais consistente, seria 
-- importante analisarmos não apenas os valores absolutos, mas a relação deles
-- com o total de produtos em sua respectiva faixa.

-- Terceira View -> Classificação das vendas, independente do "Courier Status". 
	-- Foi realizado o mesmo tratamento dado a view sobre as vendas canceladas.

CREATE VIEW inventando_moda AS (
	SELECT p."Codigo" AS "Cod_p", v."Codigo" AS "Cod_v", v."Courier Status", p."Preco", v."Qty", CAST (REPLACE(p."Preco", '$', '') AS NUMERIC) AS "Preco_2" 
	FROM vendas v
	INNER JOIN produtos p 
	ON v."Codigo" = p."Codigo"
)

-- Quarta View -> Classificando as vendas por faixas de preço

CREATE VIEW faixas_vendas AS
SELECT sum("Qty") AS "numero_de_vendas",
	CASE 
		WHEN (inventando_moda."Preco_2" <= 100) THEN '0 - 100'
		WHEN (inventando_moda."Preco_2" <= 200) THEN '101 - 200'
		WHEN (inventando_moda."Preco_2" <= 300) THEN '201 - 300'
		WHEN (inventando_moda."Preco_2" <= 400) THEN '301 - 400'
		ELSE '400+'
	END AS faixa_de_preco
FROM inventando_moda
GROUP BY faixa_de_preco
ORDER BY "numero_de_vendas" DESC; 

-- Quinta View -> Proporção de vendas canceladas por faixa de preço

CREATE VIEW proporcao_de_cancelamentos AS (
	SELECT fc."faixa_de_preco", fv."faixa_de_preco", fc."numero_de_cancelamentos", fv."numero_de_vendas", 
(100 * fc."numero_de_cancelamentos"/fv."numero_de_vendas") AS "percentual_de_cancelamentos"
	FROM faixas_cancelados fc
	INNER JOIN faixas_vendas fv  
	ON fc."faixa_de_preco" = fv."faixa_de_preco"
)
