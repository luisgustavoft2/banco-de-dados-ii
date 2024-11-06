CREATE VIEW pratos_mais_vendidos_ultimo_mes AS
SELECT 
    p.id AS id_prato,
    p.nome AS nome_prato,
    COUNT(v.id_prato) AS vezes_vendido
FROM 
    venda v
JOIN 
    prato p ON v.id_prato = p.id
WHERE 
    MONTH(v.dia) >= MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
    AND YEAR(v.dia) >= YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
GROUP BY 
    p.id, p.nome
ORDER BY 
    vezes_vendido DESC;