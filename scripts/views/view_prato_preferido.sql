CREATE VIEW prato_preferido_cliente AS
SELECT 
    v.id_cliente,
    c.nome AS nome_cliente,
    v.id_prato,
    p.nome AS nome_prato,
    SUM(v.quantidade) AS total_comprado
FROM 
    venda v
JOIN 
    cliente c ON v.id_cliente = c.id
JOIN 
    prato p ON v.id_prato = p.id
GROUP BY 
    v.id_cliente, v.id_prato, c.nome, p.nome
HAVING 
    total_comprado = (
        SELECT MAX(SUM(v2.quantidade))
        FROM venda v2
        WHERE v2.id_cliente = v.id_cliente
        GROUP BY v2.id_prato
    );