CREATE DEFINER = 'root'@'localhost' TRIGGER pos_venda
AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    UPDATE ingrediente
    JOIN usos u ON ingrediente.id = u.id_ingrediente
    SET ingrediente.quantidade = ingrediente.quantidade - 1
    WHERE u.id_prato = NEW.id_prato;
END;