-- 1. Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo quantidade seja maior que 10.
SELECT * 
FROM item_ordem_compra 
WHERE quantidade > 10;

-- 2. Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo valor seja menor que 50.
SELECT * 
FROM item_ordem_compra 
WHERE valor < 50;

-- 3. Exibir os dados da compra de todos os materiais cuja quantidade seja maior que 100 e o valor seja menor que 50, contendo o nome do material e o nome do fornecedor.
SELECT ioc.idOrdemCompra, ioc.idMaterial, ioc.quantidade, m.nome, f.nome  
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as o
WHERE ioc.quantidade > 100 
    AND ioc.valor < 50
    AND ioc.idMaterial = m.id
    AND ioc.idOrdemCompra = o.id
    AND o.idFornecedor = f.id;

-- 4. Exiba o subtotal de cada material  vendido, o nome do material e o nome do fornecedor, para cada item_ordem_compra.
SELECT ioc.idOrdemCompra, ioc.idMaterial, m.nome, f.nome, ioc.valor, ioc.quantidade, ioc.quantidade*ioc.valor as Subtotal
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as oc
WHERE ioc.idMaterial = m.id
    AND f.id = oc.idFornecedor
    AND oc.id = ioc.idOrdemCompra
ORDER by ioc.idOrdemCompra;

-- 5. O nome do fornecedor da ordem de compra, a ordem de compra e o total pago pela ordem de compra.
SELECT f.nome, ioc.idOrdemCompra, ioc.valor, ioc.quantidade, SUM(valor * quantidade) as total
FROM item_ordem_compra AS ioc, material AS m, fornecedor AS f, ordem_compra AS oc
WHERE ioc.idMaterial = m.id
    AND f.id = oc.idFornecedor
    AND oc.id = ioc.idOrdemCompra
GROUP by ioc.idOrdemCompra;

-- 6. O nome do fornecedor da ordem de compra, a data da ordem de compra, o total pago pela ordem de compra, num determinado intervalo de datas.
SELECT f.nome, oc.data, sum(valor * quantidade) as total 
FROM ordem_compra as oc, item_ordem_compra as ioc, fornecedor as f 
where f.id = oc.idFornecedor 
	AND oc.id = ioc.idOrdemCompra 
	AND oc.data BETWEEN '2022-05-15' AND '2022-05-20' 
GROUP by ioc.idOrdemCompra;
