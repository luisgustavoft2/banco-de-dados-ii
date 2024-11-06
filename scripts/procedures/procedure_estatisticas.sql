CREATE PROCEDURE estatisticas()
BEGIN

    DECLARE mostSold INT;
    DECLARE leastSold INT;

    
    SELECT id_prato INTO mostSold
    FROM venda
    GROUP BY id_prato
    ORDER BY SUM(quantidade) DESC
    LIMIT 1;

    
    SELECT p.nome, SUM(v.quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    WHERE v.id_prato = mostSold
    GROUP BY v.id_prato, p.nome;

    SELECT
        MONTH(dia) AS Mes,
        SUM(quantidade) AS TotalVendido
    FROM venda
    WHERE id_prato = mostSold
    GROUP BY MONTH(dia)
    ORDER BY TotalVendido DESC
    LIMIT 1;

    SELECT 
        MONTH(dia) AS Mes,
        SUM(quantidade) AS TotalVendido
    FROM venda
    WHERE id_prato = mostSold
    GROUP BY MONTH(dia)
    ORDER BY TotalVendido ASC
    LIMIT 1;

    
    SELECT v.id_prato into leastSold
    FROM venda
    GROUP BY id_prato
    ORDER BY SUM(quantidade) ASC
    LIMIT 1;

    
    SELECT p.nome, SUM(v.quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    WHERE v.id_prato = leastSold
    GROUP BY v.id_prato, p.nome;

    
    SELECT 
        MONTH(dia) AS Mes,
        SUM(quantidade) AS total_sold
    FROM venda
    WHERE id_prato = leastSold
    GROUP BY MONTH(dia)
    ORDER BY total_sold DESC
    LIMIT 1;
    
    SELECT 
        MONTH(dia) AS Mes,
        SUM(quantidade) AS total_sold
    FROM venda
    WHERE id_prato = leastSold
    GROUP BY MONTH(dia)
    ORDER BY total_sold ASC
    LIMIT 1;

END;