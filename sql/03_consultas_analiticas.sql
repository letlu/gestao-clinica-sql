-- Faturamento total por mês
SELECT
    DATE_TRUNC('month', data_envio) AS mes,
    SUM(valor_enviado) AS total_faturado
FROM faturamentos
GROUP BY DATE_TRUNC('month', data_envio)
ORDER BY mes;

-- Faturamento por convênio
SELECT
    c.nome AS convenio,
    SUM(f.valor_enviado) AS total_faturado
FROM faturamentos f
INNER JOIN atendimentos a ON a.id = f.atendimento_id
INNER JOIN convenios c ON c.id = a.convenio_id
GROUP BY c.nome
ORDER BY total_faturado DESC;

-- Comparação entre valores enviados e recebidos
SELECT
    SUM(valor_enviado) AS total_enviado,
    SUM(valor_recebido) AS total_recebido,
    SUM(valor_enviado) - SUM(valor_recebido) AS diferenca
FROM faturamentos f
INNER JOIN recebimentos r ON r.faturamento_id = f.id;

-- Guias com recebimento parcial ou pendente
SELECT
    f.numero_guia,
    f.valor_enviado,
    r.valor_recebido,
    f.valor_enviado - r.valor_recebido AS valor_pendente
FROM faturamentos f
INNER JOIN recebimentos r ON r.faturamento_id = f.id
WHERE r.valor_recebido < f.valor_enviado
ORDER BY valor_pendente DESC;

-- Quantidade de atendimentos por tipo
SELECT
    tipo_atendimento,
    COUNT(*) AS quantidade
FROM atendimentos
GROUP BY tipo_atendimento
ORDER BY quantidade DESC;

-- Faturamento por procedimento
SELECT
    p.nome AS procedimento,
    SUM(ap.valor_cobrado) AS total_faturado
FROM atendimento_procedimentos ap
INNER JOIN procedimentos p ON p.id = ap.procedimento_id
GROUP BY p.nome
ORDER BY total_faturado DESC;

-- Despesas por categoria
SELECT
    c.nome AS categoria,
    SUM(d.valor) AS total_despesas
FROM despesas d
INNER JOIN categoria_despesas c ON c.id = d.categoria_id
GROUP BY c.nome
ORDER BY total_despesas DESC;

-- Despesas pagas e pendentes
SELECT
    status,
    SUM(valor) AS total
FROM despesas
GROUP BY status
ORDER BY total DESC;

-- Comparação entre valores recebidos e despesas pagas
SELECT
    (SELECT SUM(valor_recebido) FROM recebimentos) AS total_recebido,
    (SELECT SUM(valor) FROM despesas WHERE status = 'Pago') AS despesas_pagas,
    (SELECT SUM(valor_recebido) FROM recebimentos) -
    (SELECT SUM(valor) FROM despesas WHERE status = 'Pago') AS saldo;

-- Faturamento por profissional
SELECT
    p.nome AS profissional,
    SUM(ap.valor_cobrado) AS total_faturado
FROM atendimento_procedimentos ap
INNER JOIN profissionais p ON p.id = ap.profissional_id
GROUP BY p.nome
ORDER BY total_faturado DESC;

-- Procedimentos ativos e inativos
SELECT
    ativo,
    COUNT(*) AS quantidade
FROM procedimentos
GROUP BY ativo
ORDER BY ativo DESC;
