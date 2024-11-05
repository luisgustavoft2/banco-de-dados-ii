CREATE DEFINER = 'root'@'localhost' TRIGGER pos_venda
AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    UPDATE ingredientes i
    JOIN usos u ON i.id = u.id_ingrediente
    SET i.quantidade = i.quantidade - 1
    WHERE u.id_prato = NEW.id_prato;
END;