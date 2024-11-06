CREATE VIEW ingrediente_mais_usado_ultimo_mes AS
SELECT 
    ingrediente.id AS id_ingrediente,
    ingrediente.nome AS nome_ingrediente,
    COUNT(u.id_ingrediente) AS vezes_usado
FROM 
    venda v
JOIN 
    usos u ON v.id_prato = u.id_prato
JOIN 
    ingrediente ON u.id_ingrediente = ingrediente.id
WHERE 
    MONTH(v.dia) >= MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
    AND YEAR(v.dia) >= YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
GROUP BY 
    ingrediente.id, ingrediente.nome
ORDER BY 
    vezes_usado DESC
LIMIT 1;