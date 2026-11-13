SELECT *
FROM clientes_banco

--- QUESTÃO 1
SELECT
    uf,
    COUNT(DISTINCT id_cliente) AS total_clientes
FROM
    clientes_banco
WHERE
    data_referencia = '2024-01-15'
    AND status_conta <> 'Encerrada'
GROUP BY
    uf
ORDER BY
    total_clientes DESC
LIMIT 5;

--- QUESTÃO 2
SELECT
    id_cliente,
    nome,
    saldo
FROM
    clientes_banco
WHERE
    data_referencia = '2024-04-15'
ORDER BY
    saldo DESC
LIMIT 1;

--- QUESTÃO 3
SELECT
    COUNT(DISTINCT id_cliente) AS total_clientes_diferentes
FROM
    clientes_banco;

--- QUESTÃO 4
SELECT
    ROUND(AVG(renda_mensal), 2) AS media_renda_prime
FROM
    clientes_banco
WHERE
    data_referencia = '2024-12-15'
    AND segmento = 'Prime';

--- QUESTÃO 5
SELECT
    profissao,
    COUNT(DISTINCT id_cliente) AS total_clientes
FROM
    clientes_banco
WHERE
    data_referencia = '2024-12-15'
    AND status_conta <> 'Encerrada'
GROUP BY
    profissao
ORDER BY
    total_clientes DESC
LIMIT 3;

--- QUESTÃO 6
SELECT
    data_referencia,
    COUNT(id_cliente) AS total_contas_bloqueadas
FROM
    clientes_banco
WHERE
    status_conta = 'Bloqueada'
GROUP BY
    data_referencia
ORDER BY
    total_contas_bloqueadas DESC
LIMIT 1;


--- QUESTÃO 7
SELECT
    cidade,
    COUNT(id_cliente) AS total_clientes,
    ROUND(AVG(saldo), 2) AS saldo_medio
FROM
    clientes_banco
WHERE
    data_referencia = '2024-09-15'
    AND status_conta <> 'Encerrada'
GROUP BY
    cidade
HAVING
    COUNT(id_cliente) >= 50
ORDER BY
    saldo_medio DESC
LIMIT 1;

--- QUESTÃO 8
SELECT
    SUM(saldo) AS soma_saldos_private
FROM
    clientes_banco
WHERE
    data_referencia = '2024-12-15'
    AND segmento = 'Private';

--- QUESTÃO 9
SELECT
    agencia,
    COUNT(id_cliente) AS total_clientes
FROM
    clientes_banco
WHERE
    data_referencia = '2024-12-15'
    AND status_conta <> 'Encerrada' -- Opcional: remova esta linha se quiser incluir contas encerradas em dezembro
GROUP BY
    agencia
ORDER BY
    total_clientes DESC
LIMIT 1;

--- QUESTÃO 10
SELECT
data_referencia,
SUM(saldo) AS soma_total_saldos
FROM
clientes_banco
GROUP BY
data_referencia
ORDER BY
soma_total_saldos DESC
LIMIT 1;

--- QUESTÃO 11
SELECT
COUNT(DISTINCT id_cliente) AS total_contas_encerradas
FROM
clientes_banco
WHERE
status_conta = 'Encerrada'
AND EXTRACT(YEAR FROM data_referencia) = 2024;

--- QUESTÃO 12
SELECT
ROUND(AVG(score_credito), 2) AS score_medio_df
FROM
clientes_banco
WHERE
data_referencia = '2024-06-15'
AND uf = 'DF'
AND status_conta <> 'Encerrada';

--- QUESTÃO 13
SELECT
COUNT(id_cliente) AS total_clientes
FROM
clientes_banco
WHERE
data_referencia = '2024-03-15'
AND score_credito >= 700
AND possui_cartao = FALSE
AND status_conta <> 'Encerrada';

--- QUESTÃO 14
SELECT
COUNT(*) AS total_clientes,
COUNT(CASE WHEN canal_preferido = 'App' THEN 1 END) AS clientes_app,
ROUND(
100.0 * COUNT(CASE WHEN canal_preferido = 'App' THEN 1 END) / COUNT(*),
2
) AS percentual_app
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND status_conta <> 'Encerrada';

--- QUESTÃO 15
SELECT
COUNT(DISTINCT id_cliente) AS total_novos_clientes
FROM
clientes_banco
WHERE
EXTRACT(YEAR FROM data_abertura) = 2024;

--- QUESTÃO 16
SELECT
tipo_conta,
ROUND(AVG(saldo), 2) AS saldo_medio,
COUNT(id_cliente) AS total_clientes
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND tipo_conta IN ('Poupança', 'Corrente')
AND status_conta <> 'Encerrada'
GROUP BY
tipo_conta
ORDER BY
saldo_medio DESC;

--- QUESTÃO 17
SELECT
MAX(limite_credito) AS maior_limite_varejo
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND segmento = 'Varejo'
AND status_conta <> 'Encerrada';

--- QUESTÃO 18
SELECT
sexo,
COUNT(id_cliente) AS total_clientes,
ROUND(100.0 * COUNT(id_cliente) / SUM(COUNT(id_cliente)) OVER(), 2) AS percentual
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND possui_investimento = TRUE
AND status_conta <> 'Encerrada'
GROUP BY
sexo
ORDER BY
total_clientes DESC;

--- QUESTÂO 19
SELECT
uf,
COUNT(id_cliente) AS total_clientes
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND status_conta <> 'Encerrada'
GROUP BY
uf
HAVING
COUNT(id_cliente) < 13
ORDER BY
total_clientes ASC;

--- QUESTÂO 20
SELECT
COUNT(id_cliente) AS total_clientes
FROM
clientes_banco
WHERE
data_referencia = '2024-12-15'
AND data_nascimento < '1960-01-01'
AND status_conta <> 'Encerrada';
