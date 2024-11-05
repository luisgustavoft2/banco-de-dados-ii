CREATE DEFINER = 'root'@'localhost' TRIGGER compra_invalida
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
    