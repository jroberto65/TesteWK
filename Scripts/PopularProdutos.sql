-- Verifique se a tabela existe
SELECT COUNT(*) INTO @tabela_existe
 FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'BancoTesteWK'  AND TABLE_NAME = 'Produtos';

-- Se a tabela existir, insira os dados
SET @query = CASE WHEN (@tabela_existe > 0) THEN
				'INSERT INTO Produtos (codigo, Descricao, PrecoVenda)
					VALUES  (0, ''Sabonete'', 2.50),
							(0, ''Papel toalha'', 3.10), 
							(0, ''Shampoo'', 24.80), 
							(0, ''Arroz'', 28.99),
                            (0, ''Cafe'', 17.00),
                            (0, ''Sabao em po'', 8.20),
                            (0, ''Oleo'', 7.40),
                            (0, ''Leite'', 3.80),
                            (0, ''Pao de forma'', 11.50),
                            (0, ''Farinha de trigo'', 8.50),
							(0, ''Escova de dente'', 4.70), 
							(0, ''Pano de prato'', 3.40), 
							(0, ''Agua sanitaria'', 3.90),
                            (0, ''Desengordurante'', 7.99),
                            (0, ''Amaciante'', 12.50),
                            (0, ''Manteiga'', 24.90),
                            (0, ''Margarin'', 12.55),
                            (0, ''Biscoito'', 3.60),
                            (0, ''Pao de queiro'', 12.85),
                            (0, ''Vassoura'', 15.80);'
			ELSE
				'SELECT "Tabela não existe";'
			END;

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
