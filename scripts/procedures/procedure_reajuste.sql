CREATE PROCEDURE reajuste(pct_increase DECIMAL(5, 2))
BEGIN
    
    IF pct_increase > 0 THEN
        UPDATE prato
        SET valor = valor * (1 + (pct_increase / 100));
    ELSE
        SELECT 'Porcentagem negativas nao sao aceitas. Insira um valor positivo.' AS message;
    END IF;
END ;