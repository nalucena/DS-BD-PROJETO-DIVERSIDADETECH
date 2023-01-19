<div align="center">
<h2>Análise Exploratória</h2>
<h1> Experimento Banco de Dados
    <img alt="Night Coding" src="capa_.gif" align="right"/>
</h1>
</div>


## O Desafio

* Realizar análise de uma base sql de um ecommerce encontrando alguns insights criando views para execução no vscode exibindo gráficos como resultado da exploração dos dados. 
-----
## As perguntas

- Qual a faixa de preço dos produtos com status de entrega cancelado? Há relação com valores(preço) mais altos ?

- O preço dos produtos influenciam no volume de vendas? Mais baratos > volume?

- Quais produtos são mais vendidos de acordo com a faixa de preço? 0-100 100-200 200+
---------
## A Execução
 - antes de tudo ao baixar o material e abrir no deu editor favorito
 você precisa execuar o arquivo requeriments.txt
 - no terminal você executa: 
   ### pip install -r requirements.txt
- "No arquivo requeriments encontra-se todas as libs necessárias para a execução do projeto"
- Após a instalação vamos ao Gerenciador de banco de dados
que no caso vou falar do DBeaver.
- Conecte a uma database postgres com nome ecommerce nserindo sua senha do postgres.
- Conecte a base ecomerce ao postgres.
- vá ao seu editor e execute o script baixado "create_tables.py" com cuidado de inserir na linha 10 o usuário e senha do banco como instrução no comentário da linha 9 do mesmo arquivo
- verifique se as tabelas foram adicionadas no DBeaver.
- Crie um novo script na base ecommerce e cole o conteúdo do arquivo Projeto_BD.sql
- Selecione tudo e execute, neste momento ele vai criar as views para ser executadas.
- volte ao editor e execute o arquivo projeto.ipynb
### Neste arquivo você vai visualizar as análises e os gráficos assim como os insights sobre as vendas e os produtos.
----

##  😎 Desenvolvido por:
- **[Gleilson Pedro](https://www.linkedin.com/in/gleilsonpedro/)**, 
- **[Nathalya Lucena](https://www.linkedin.com/in/nathalya-lucena-466773244/)**,
- **[Renato Silva](https://www.linkedin.com/in/avlisotan/)**
                     
