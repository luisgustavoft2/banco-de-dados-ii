
CREATE FUNCTION calculate_points(purchase_amount DECIMAL(10, 2))
RETURNS INT 
DETERMINISTIC 
BEGIN
    DECLARE points INT;
    IF purchase_amount >= 10 THEN
        SET points = FLOOR(purchase_amount / 10); 
    ELSE
        SELECT 'Essa compra não gera pontos por estar abaixo de 10 reais' AS message;
    END IF;

    RETURN points;
END ;
