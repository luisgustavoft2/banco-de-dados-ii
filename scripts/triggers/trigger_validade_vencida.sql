CREATE DEFINER = 'root'@'localhost' TRIGGER validade_vencida
AFTER INSERT ON ingrediente
FOR EACH ROW
BEGIN
    IF NEW.data_validade < CURDATE() THEN
        UPDATE prato
        SET disponibilidade = FALSE
        WHERE id IN (
            SELECT DISTINCT u.id_prato
            FROM usos u
            WHERE u.id_ingrediente = NEW.id
        );

    END IF;
END;