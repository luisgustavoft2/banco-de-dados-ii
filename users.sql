CREATE USER 'admin'@'localhost' IDENTIFIED BY 'senha_admin';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_gerente';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'senha_funcionario';

GRANT ALL PRIVILEGES ON restaurante.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON restaurante.* TO 'gerente'@'localhost';
GRANT SELECT, INSERT ON restaurante.* TO 'funcionario'@'localhost';

FLUSH PRIVILEGES;