# Análise Exploratória de Dados Bancários (SQL)

Este projeto consiste em uma análise exploratória de dados utilizando **SQL** sobre uma base de dados fictícia de clientes de uma instituição financeira (`clientes_banco`). O objetivo principal é responder a **20 questões de negócio** abrangendo métricas de retenção, perfil demográfico, engajamento digital, saúde financeira e oportunidades de crédito ao longo do ano de 2024.

---

## Estrutura da Base de Dados

As consultas foram executadas sobre a tabela principal **`clientes_banco`**, que armazena snapshots mensais (datas de referência) da carteira de clientes.

### Principais Colunas Identificadas:
* **Identificação e Demografia:** `id_cliente`, `nome`, `sexo`, `data_nascimento`, `profissao`, `cidade`, `uf`
* **Dados da Conta:** `agencia`, `tipo_conta` (Corrente, Poupança), `status_conta` (Ativa, Bloqueada, Encerrada), `data_abertura`, `data_referencia`
* **Perfil Financeiro e Negócio:** `segmento` (Varejo, Prime, Private), `renda_mensal`, `saldo`, `score_credito`, `limite_credito`
* **Produtos e Canais:** `possui_cartao` (Booleano), `possui_investimento` (Booleano), `canal_preferido` (App, Agência, etc.)

---

## Questões de Negócio Respondidas

As 20 consultas desenvolvidas estão organizadas por temas estratégicos:

### 1. Distribuição Geográfica e Demográfica
* **Questão 01:** Top 5 estados (UF) com maior número de clientes ativos em Janeiro/2024.
* **Questão 05:** As 3 profissões mais comuns entre os clientes ativos ao final de 2024.
* **Questão 07:** Cidade com o maior saldo médio em Setembro/2024 (considerando apenas cidades com 50 ou mais clientes ativos).
* **Questão 18:** Distribuição percentual por sexo dos clientes ativos que possuem investimentos em Dezembro/2024.
* **Questão 19:** Estados com baixa penetração (menos de 13 clientes ativos) em Dezembro/2024.
* **Questão 20:** Quantidade de clientes ativos nascidos antes de 1960 (público sênior) em Dezembro/2024.

### 2. Saldo, Renda e Patrimônio
* **Questão 02:** Identificação do cliente com o maior saldo em conta no mês de Abril/2024.
* **Questão 04:** Média da renda mensal dos clientes do segmento **Prime** em Dezembro/2024.
* **Questão 08:** Soma total dos saldos sob custódia do segmento **Private** em Dezembro/2024.
* **Questão 10:** Identificação da data de referência com o maior volume total de saldos no banco.
* **Questão 16:** Comparativo de saldo médio e volume de clientes entre contas **Corrente** e **Poupança** em Dezembro/2024.

### 3. Crescimento, Retenção e Ciclo de Vida
* **Questão 03:** Contagem total de clientes únicos registrados em todo o histórico da base.
* **Questão 06:** Data de referência com o maior pico de contas com status *Bloqueada*.
* **Questão 09:** Agência com a maior concentração de clientes ativos em Dezembro/2024.
* **Questão 11:** Total de clientes únicos que encerraram suas contas ao longo do ano de 2024.
* **Questão 15:** Total de novos clientes captados (abertura de conta) durante o ano de 2024.

### 4. Crédito, Produtos e Canais Digitais
* **Questão 12:** Média do *Score de Crédito* dos clientes ativos no Distrito Federal (DF) em Junho/2024.
* **Questão 13:** Levantamento de clientes ativos com alto score ($\ge 700$) que ainda não possuem cartão (oportunidade de *cross-sell*) em Março/2024.
* **Questão 14:** Taxa de adoção digital — percentual de clientes ativos que utilizam o **App** como canal preferido em Dezembro/2024.
* **Questão 17:** Maior limite de crédito concedido dentro do segmento **Varejo** em Dezembro/2024.

---

## Conceitos e Recursos SQL Aplicados:

Para extrair essas informações, foram utilizadas diversas técnicas de consulta e manipulação de dados:
* **Agregações e Agrupamentos:** `COUNT()`, `COUNT(DISTINCT)`, `SUM()`, `AVG()`, `MAX()`, `GROUP BY` e filtragem de grupos com `HAVING`.
* **Filtragem Avançada:** Operadores lógicos (`AND`, `IN`, `<>`), manipulação de datas (`EXTRACT(YEAR FROM ...)`).
* **Cálculos Analíticos e Window Functions:** Cálculo de percentuais utilizando `CASE WHEN` e funções de janela (`SUM(COUNT(...)) OVER()`).
* **Ordenação e Paginação:** `ORDER BY` e `LIMIT` para rankings (Top N).

---

## Como Utilizar:

1. Certifique-se de ter um SGBD relacional configurado (ex: **PostgreSQL**, **MySQL**, **SQLite** ou **SQL Server** — *nota: a função `EXTRACT` e tipos booleanos seguem o padrão ANSI/PostgreSQL*).
2. Importe ou crie a tabela `clientes_banco` com os dados correspondentes.
3. Execute o arquivo `.sql` contendo as consultas sequenciais para reproduzir os resultados.
