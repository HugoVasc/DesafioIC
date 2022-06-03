-- Faz a soma dos saldos finais das despesas que batem a descricao e data igual ou posterior a 01/10/2021 (Data de fechamento do ultimo trimestre)
SELECT roa.razao_social, SUM(dc.vl_saldo_final)
FROM demonstracoes_contabeis dc
INNER JOIN relacao_operadoras_ativas_ans roa
ON dc.reg_ans = roa.reg_ans
WHERE dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' AND  dc.data >= '2021-10-01'
GROUP BY roa.razao_social;

-- Faz a soma dos saldos finais das despesas que batem a descricao e data igual ou posterior a 01/01/2021 (Contabilizando todo o ano de 2021)
SELECT roa.razao_social, SUM(dc.vl_saldo_final)
FROM demonstracoes_contabeis dc
INNER JOIN relacao_operadoras_ativas_ans roa
ON dc.reg_ans = roa.reg_ans
WHERE dc.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR ' AND  dc.data >= '2021-01-01'
GROUP BY roa.razao_social;