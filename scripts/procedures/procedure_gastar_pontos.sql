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