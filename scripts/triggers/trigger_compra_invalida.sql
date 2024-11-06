CREATE DEFINER = 'root'@'localhost' TRIGGER compra_invalida
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE disponibilidade_prato BOOLEAN;

    SELECT disponibilidade INTO disponibilidade_prato
    FROM prato
    WHERE id = NEW.id_prato;

    IF disponibilidade_prato = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seu pedido foi cancelado pois o prato esta indisponivel';
    END IF;
END;