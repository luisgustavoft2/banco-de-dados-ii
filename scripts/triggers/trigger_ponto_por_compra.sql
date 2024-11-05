CREATE DEFINER = 'root'@'localhost' TRIGGER ponto_por_compra
AFTER INSERT
ON venda
FOR EACH ROW
BEGIN
    DECLARE pontos_na_compra INT;

    SET pontos_na_compra = FLOOR(NEW.valor / 10);

    IF pontos_na_compra > 0 THEN
        UPDATE cliente
        SET pontos = pontos + pontos_na_compra
        WHERE id = NEW.id_cliente;

    END IF;
END;