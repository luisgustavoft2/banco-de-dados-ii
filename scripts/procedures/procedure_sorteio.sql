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

    SELECT CONCAT('Client ID ', selected_client_id, ' foi premiado(a) com 100 pontos!') AS message;

END;