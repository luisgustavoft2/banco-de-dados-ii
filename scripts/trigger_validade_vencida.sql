CREATE DEFINER = 'root'@'localhost' TRIGGER validade_vencida
AFTER INSERT ON ingredientes --using after insert as I want to check the due date when new items get inserted
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

        
        SELECT CONCAT('Pratos que utilizam o ingrediente ', NEW.nome, ' foram marcados como indisponíveis.') AS mensagem;
    END IF;
END;