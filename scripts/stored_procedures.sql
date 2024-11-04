DELIMITER // 

CREATE PROCEDURE reajuste(pct_increase DECIMAL(5, 2)) --using reajuste as professor asked for it in portuguese
BEGIN
    
    IF pct_increase > 0 THEN --use the conditional to guarantee the percentage is positive not negative
        UPDATE prato --using prato because the professor asked for the table names in portuguese 
        SET valor = valor * (1 + (pct_increase / 100));
    ELSE
        SELECT 'Porcentagem negativas não são aceitas. Insira um valor positivo.' AS message;
    END IF;
END //

DELIMITER ;