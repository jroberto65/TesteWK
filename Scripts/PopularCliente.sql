-- Verifique se a tabela existe
SELECT COUNT(*) INTO @tabela_existe
 FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'BancoTesteWK'  AND TABLE_NAME = 'Clientes';

-- Se a tabela existir, insira os dados
SET @query = CASE WHEN (@tabela_existe > 0) THEN
				'INSERT INTO Clientes (codigo, nome, cidade, uf)
					VALUES  (0, ''Marcio'', ''Contagem'', ''MG''),
							(0, ''Carla'', ''Belo horizonte'', ''MG''), 
							(0, ''Tania'', ''Sete Lagoas'', ''MG''), 
							(0, ''Suzana'', ''Chapeco'', ''SC''),
                            (0, ''Vantuir'', ''Belo horizonte'', ''MG''),
                            (0, ''Wanderley'', ''Contagem'', ''MG''),
                            (0, ''Pedro'', ''Contagem'', ''MG''),
                            (0, ''Maria'', ''Belo horizonte'', ''MG''),
                            (0, ''Sandra'', ''Belo horizonte'', ''MG''),
                            (0, ''Ivone'', ''Itu'', ''SP''),
							(0, ''Silvana'', ''Belo horizonte'', ''MG''), 
							(0, ''Sandro'', ''Contagem'', ''MG''), 
							(0, ''Luiz'', ''Contagem'', ''MG''),
                            (0, ''Wagner'', ''Sete Lagoas'', ''MG''),
                            (0, ''Heitor'', ''Belo horizonte'', ''MG''),
                            (0, ''Cintia'', ''Contagem'', ''MG''),
                            (0, ''Marilda'', ''Contagem'', ''MG''),
                            (0, ''Simone'', ''Belo horizonte'', ''MG''),
                            (0, ''Manoel'', ''Contagem'', ''MG''),
                            (0, ''Luiza'', ''Sete Lagoas'', ''MG'');'
			ELSE
				'SELECT "Tabela não existe";'
			END;

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
