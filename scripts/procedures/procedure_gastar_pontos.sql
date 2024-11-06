CREATE PROCEDURE gastar_pontos (IN cliente_id INT, IN prato_id INT)
BEGIN
    DECLARE preco_prato DECIMAL(10, 2);
    DECLARE pontos_cliente INT;
    DECLARE pontos_necessarios INT;
    DECLARE nova_pontuacao INT;

    
    SELECT valor INTO preco_prato
    FROM prato
    WHERE id = prato_id;

    
    SELECT pontos INTO pontos_cliente
    FROM cliente
    WHERE id = cliente_id;

    
    SET pontos_necessarios = CEIL(preco_prato);

    
    IF pontos_cliente >= pontos_necessarios THEN
        
        SET nova_pontuacao = pontos_cliente - pontos_necessarios;
        UPDATE cliente
        SET pontos = nova_pontuacao
        WHERE id = cliente_id;

        SELECT 'Compra realizada com sucesso!' AS mensagem, nova_pontuacao AS pontos_restantes;
    ELSE
        SELECT 'Pontos insuficientes para a compra.' AS mensagem, pontos_cliente AS pontos_disponiveis;
    END IF;
END;