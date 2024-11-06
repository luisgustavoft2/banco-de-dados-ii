INSERT INTO cliente (nome, sexo, idade, nascimento, pontos) VALUES
('Ana', 'f', 28, '1996-05-15', 10),
('Carlos', 'm', 34, '1990-11-20', 20),
('Fernanda', 'f', 22, '2002-08-30', 5),
('Joao', 'm', 40, '1984-02-10', 15),
('Luciana', 'o', 29, '1995-03-12', 0),
('Marcos', 'm', 31, '1992-04-17', 7),
('Patricia', 'f', 27, '1996-12-24', 12),
('Roberto', 'm', 45, '1979-10-02', 18),
('Sofia', 'f', 35, '1989-01-10', 9),
('Tania', 'f', 41, '1983-09-15', 6);


INSERT INTO prato (nome, descricao, valor, disponibilidade) VALUES
('Pizza Margherita', 'Pizza com molho de tomate e queijo', 29.90, TRUE),
('Lasanha a Bolonhesa', 'Lasanha com carne e molho de tomate', 35.00, TRUE),
('Sushi', 'Variedade de sushis e sashimis', 50.00, TRUE),
('Hamburguer', 'Hamburguer com carne, queijo e salada', 25.00, FALSE),
('Espaguete Carbonara', 'Massa com molho de ovos e queijo', 22.50, TRUE),
('Salada Caesar', 'Salada com frango, croutons e molho Caesar', 18.90, TRUE),
('Tacos', 'Tacos com carne e legumes', 23.50, TRUE),
('Risoto de Cogumelos', 'Risoto cremoso com cogumelos', 40.00, TRUE),
('Frango a Parmegiana', 'Frango empanado com queijo', 28.00, TRUE),
('Crepe de Nutella', 'Crepe recheado com Nutella', 15.00, TRUE);

INSERT INTO fornecedor (nome, estado_origem) VALUES
('Fornecedor A', 'SP'),
('Fornecedor B', 'RJ'),
('Fornecedor C', 'MG'),
('Fornecedor D', 'BA'),
('Fornecedor E', 'RS'),
('Fornecedor F', 'CE'),
('Fornecedor G', 'PE'),
('Fornecedor H', 'PR'),
('Fornecedor I', 'SC'),
('Fornecedor J', 'TO');

INSERT INTO ingrediente (nome, data_fabricacao, data_validade, quantidade, observacao) VALUES
('Tomate', '2024-10-01', '2024-12-01', 100, 'Tomates frescos'),
('Queijo', '2024-10-05', '2025-01-05', 50, 'Queijo mozzarella'),
('Carne Moida', '2024-10-02', '2024-10-20', 30, 'Carne moida fresca'),
('Massa', '2024-09-28', '2025-09-28', 20, 'Massa de lasanha'),
('Alface', '2024-10-03', '2024-10-10', 200, 'Alface fresca'),
('Cebola', '2024-10-07', '2024-11-07', 150, 'Cebola roxa'),
('Frango', '2024-10-10', '2024-10-15', 80, 'Peito de frango'),
('Arroz', '2024-10-01', '2025-01-01', 0, 'Arroz branco'),
('Farinha', '2024-09-20', '2025-09-20', 1000, 'Farinha de trigo'),
('Azeite', '2024-10-12', '2026-10-12', 100, 'Azeite extra virgem');

INSERT INTO usos (id_prato, id_ingrediente) VALUES
(1, 1),  -- Pizza Marguerita usa Tomate
(1, 2),  -- Pizza Marguerita usa Queijo
(2, 3),  -- Lasanha usa Carne Moída
(2, 4),  -- Lasanha usa Massa
(3, 1),  -- Sushi usa Tomate
(4, 5),  -- Hambúrguer usa Alface
(5, 3),  -- Espaguete usa Carne Moída
(6, 1),  -- Salada Caesar usa Tomate
(7, 6),  -- Tacos usa Cebola
(8, 8);  -- Risoto usa Arroz

-- Inserindo registros pré-cadastrados em venda
INSERT INTO venda (id_cliente, id_prato, quantidade, dia, hora, valor) VALUES
(1, 1, 2, '2024-11-01', '19:00:00', 59.80),  -- Ana comprou 2 Pizzas Margueritas
(2, 2, 1, '2024-11-02', '20:00:00', 35.00),  -- Carlos comprou 1 Lasanha
(3, 3, 3, '2024-11-03', '21:00:00', 150.00), -- Fernanda comprou 3 Sushis
(1, 4, 1, '2024-11-01', '19:30:00', 25.00),  -- Ana comprou 1 Hambúrguer
(4, 5, 2, '2024-11-03', '18:30:00', 45.00);  -- João comprou 2 Espaguetes Carbonara