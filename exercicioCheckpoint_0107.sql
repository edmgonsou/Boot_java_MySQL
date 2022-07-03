use turmax;

-- listar o nome de cada material e o valor médio desse material
SELECT m.nome, AVG(ioc.valor) as MediaValor 
FROM material as m, item_ordem_compra as ioc
WHERE ioc.idMaterial = m.id
GROUP BY m.nome 
ORDER BY m.nome;

-- listar o nome de cada material e o valor médio desse material entre os dias 10/05/2022 e 13/05/2022
SELECT oc.data, m.nome, AVG(ioc.valor) as MediaValor 
FROM material as m, item_ordem_compra as ioc, ordem_compra as oc 
WHERE ioc.idMaterial = m.id
	AND oc.id = ioc.idOrdemCompra
    AND oc.data BETWEEN '2022-05-10' AND '2022-05-13' 
GROUP BY m.nome 
ORDER BY m.nome;	

-- qual é o produto que mais aparece nas compras?
SELECT m.id, m.nome, COUNT(ioc.idMaterial) as Contagem 
FROM material as m, item_ordem_compra as ioc
WHERE ioc.idMaterial = m.id
GROUP BY ioc.idMaterial 
ORDER BY Contagem DESC;

-- CRUD (insert, select, update, delete)

-- Inserir um material
INSERT INTO material (id, nome) VALUES (null, "louças");

-- listar todos item
SELECT * FROM item_ordem_compra;

-- Atualizar um item do material
UPDATE material SET nome = 'Prego'
WHERE id = 2;

-- Deletar um item da ordem de compra
DELETE FROM item_ordem_compra 
WHERE item_ordem_compra.idOrdemCompra = 5
AND item_ordem_compra.idMaterial = 11;

-- fazer um script (.SQL) com os exercícios do checkpoint de 27/06 e os exercícios propostos.