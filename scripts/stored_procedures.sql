DELIMITER // 

CREATE PROCEDURE reajuste(pct_increase DECIMAL(5, 2)) --using reajuste as professor asked for it in portuguese
BEGIN
    
    IF pct_increase > 0 THEN --use the conditional to guarantee the percentage is positive not negative
        UPDATE prato --using prato because the professor asked for the table names in portuguese 
        SET valor = valor * (1 + (pct_increase / 100));
    ELSE
        SELECT 'Porcentagem negativas não são aceitas. Insira um valor positivo.' AS message;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sorteio ()
BEGIN

    DECLARE selected_client_id INT;

    SELECT id INTO selected_client_id
    FROM cliente
    ORDER BY RAND() --selects one random id from cliente table to award points
    LIMIT 1;

    UPDATE cliente
    SET pontos = pontos + 100
    WHERE id = selected_client_id;

    SELECT CONCAT('Client ID ', selected_client_id, ' has been awarded 100 points.') AS message;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE estatisticas()
BEGIN

    DECLARE mostSold INT;
    DECLARE leastSold INT;

    --most sold select
    SELECT id_prato INTO mostSold
    FROM venda
    GROUP BY id_prato
    ORDER BY SUM(quantidade) DESC
    LIMIT 1;

    --statistics for most sold
    SELECT p.nome, SUM(v.quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    WHERE v.id_prato = mostSold
    GROUP BY v.id_prato, p.nome;

    SELECT -- shows the month where the most sold dish was sold the most
        MONTH(dia) AS Mes,
        SUM(quantidade) AS TotalVendido
    FROM venda
    WHERE id_prato = mostSold
    GROUP BY MONTH(dia)
    ORDER BY TotalVendido DESC
    LIMIT 1;

    SELECT --month where the most sold dish was sold the least
        MONTH(dia) AS Mes,
        SUM(quantidade) AS TotalVendido
    FROM venda
    WHERE id_prato = mostSold
    GROUP BY MONTH(dia)
    ORDER BY TotalVendido ASC
    LIMIT 1;

    --statistics for least sold dish
    SELECT v.id_prato into leastSold
    FROM venda
    GROUP BY id_prato
    ORDER BY SUM(quantidade) ASC
    LIMIT 1;

    --statistics for least sold
    SELECT p.nome, SUM(v.quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    WHERE v.id_prato = leastSold
    GROUP BY v.id_prato, p.nome;

    --least sold dish in the month it sold the most
    SELECT 
        MONTH(dia) AS Mes,
        SUM(quantidade) AS total_sold
    FROM venda
    WHERE id_prato = leastSold
    GROUP BY MONTH(dia)
    ORDER BY total_sold DESC
    LIMIT 1;
    --least sold dish in the month it sold the least
    SELECT 
        MONTH(dia) AS Mes,
        SUM(quantidade) AS total_sold
    FROM venda
    WHERE id_prato = leastSold
    GROUP BY MONTH(dia)
    ORDER BY total_sold ASC
    LIMIT 1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE gastar_pontos (IN cliente_id INT, IN prato_id INT)
BEGIN
    DECLARE preco_prato DECIMAL(10, 2);
    DECLARE pontos_cliente INT;
    DECLARE pontos_necessarios INT;
    DECLARE nova_pontuacao INT;

    -- set price for the dish
    SELECT valor INTO preco_prato
    FROM prato
    WHERE id = prato_id;

    -- get how many points client has
    SELECT pontos INTO pontos_cliente
    FROM cliente
    WHERE id = cliente_id;

    -- calculate how many points needes for the price of the dish
    SET pontos_necessarios = CEIL(preco_prato);

    -- does client have enough points for dishes
    IF pontos_cliente >= pontos_necessarios THEN
        -- setting new client points
        SET nova_pontuacao = pontos_cliente - pontos_necessarios;
        UPDATE cliente
        SET pontos = nova_pontuacao
        WHERE id = cliente_id;

        SELECT 'Compra realizada com sucesso!' AS mensagem, nova_pontuacao AS pontos_restantes;
    ELSE
        SELECT 'Pontos insuficientes para a compra.' AS mensagem, pontos_cliente AS pontos_disponiveis;
    END IF;
END;
//

DELIMITER ;






