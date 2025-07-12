-- Projeto: Locadora de Veículos
-- Desenvolvido por: Pedro Feld
-- Descrição: Projeto universitário para a disciplina de Banco de Dados na Uninter

-- Consultas SQL
SELECT descricao, dataManutencao, custo
FROM LocadoraVeiculos.Manutencao;

SELECT SUM(valorTotal) AS totalArrecadado
FROM Pagamento
WHERE estado = 'Pago';

SELECT 
    v.modelo,
    v.marca,
    COUNT(lv.idLocacao) AS qtdLocacoes
FROM Veiculo v
JOIN LocacaoVeiculo lv ON v.idVeiculo = lv.idVeiculo
GROUP BY v.idVeiculo, v.modelo, v.marca
ORDER BY qtdLocacoes DESC;

SELECT
    c.nome,
    p.valorTotal
FROM Cliente c
JOIN Locacao l ON c.idCliente = l.idCliente
JOIN Pagamento p ON l.idPagamento = p.idPagamento
WHERE p.estado = 'Pendente'
ORDER BY c.nome ASC;