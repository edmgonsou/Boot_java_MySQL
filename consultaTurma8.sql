SELECT * from fornecedor;

SELECT nome FROM fornecedor;

SELECT oc.id, oc.data, f.nome, f.ie
FROM fornecedor as f, ordem_compra as oc;

SELECT oc.id, oc.data, f.nome, f.ie 
FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id;

SELECT oc.id, oc.data, f.nome, f.ie 
FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id 
ORDER BY f.ie

SELECT oc.id, oc.data, f.nome, f.ie 
FROM fornecedor as f, ordem_compra as oc 
WHERE oc.idFornecedor = f.id 
ORDER BY f.ie DESC

SELECT ioc.idOrdemCompra, ioc.idMaterial, m.nome 
FROM item_ordem_compra AS ioc, material AS m 
WHERE ioc.idMaterial = m.id 
ORDER BY ioc.idOrdemCompra

SELECT *, quantidade*valor as Subtotal 
FROM item_ordem_compra

SELECT idOrdemCompra, SUM(quantidade * valor) as totalCompra 
FROM item_ordem_compra 
GROUP BY idOrdemCompra

SELECT idOrdemCompra, SUM(valor * quantidade) as totalCompra 
FROM item_ordem_compra
GROUP by idOrdemCompra 
HAVING totalCompra > 5000
