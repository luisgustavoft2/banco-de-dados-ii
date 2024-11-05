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

    SELECT v.id_prato, p.nome, SUM(quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    GROUP BY v.id_prato, p.nome
    ORDER BY total_sold DESC
    LIMIT 1;

    SELECT v.id_prato, p.nome, SUM(quantidade) AS total_sold, SUM(v.quantidade * p.valor) AS total_price
    FROM venda v
    JOIN prato p ON v.id_prato = p.id
    GROUP BY v.id_prato, p.nome
    ORDER BY total_sold ASC
    LIMIT 1;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE gastar_pontos ()




