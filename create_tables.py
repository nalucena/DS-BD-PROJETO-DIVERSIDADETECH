# Instalar as bibliotecas : pandas sqlalchemy e psycopg2-binary
# pip install pandas sqlalchemy psycopg2-binary

import pandas as pd
from sqlalchemy import create_engine


# cria uma conexão com o banco postgres
# string de conexão: postgresql://usuário:senha@localhost:5432/nomebanco
engine = create_engine('postgresql://postgres:chja1415@localhost:5432/ecommerce')

for file_name in ["aula 7\/produtos.csv", "aula 7\/vendas.csv"]:
	df = pd.read_csv(file_name, sep=',')
	df = df.loc[:, ~df.columns.str.contains('^Unnamed')].copy()

	# salva o dataframe como tabela no banco conectado
	# nome_da_tabela, engine de conexão
	df.to_sql(f'{file_name.split(".")[0]}', engine, index=False)

