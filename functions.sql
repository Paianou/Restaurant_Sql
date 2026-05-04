use restaurante;
select p.id_produto, p.nome, p.descricao, i.ingredientes
from produtos p
inner join info_produto i 
on p.id_produto = i.id_produto;

SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,
    c.nome AS cliente,
    c.email
FROM pedidos p
INNER JOIN cliente c 
    ON p.id_cliente = c.id_cliente;

SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,
    f.nome AS funcionario,
    f.cargo
FROM pedidos p
INNER JOIN funcionarios f 
    ON p.id_funcionario = f.id_funcionario;
  
SELECT 
    p.id_pedido,
    p.quantidade,
    p.data_pedido,

    c.nome AS cliente,
    c.email,

    f.nome AS funcionario,

    pr.nome AS produto,
    pr.preco

FROM pedidos p

LEFT JOIN cliente c 
    ON p.id_cliente = c.id_cliente

LEFT JOIN funcionarios f 
    ON p.id_funcionario = f.id_funcionario

LEFT JOIN produtos pr 
    ON p.id_produto = pr.id_produto;

select id_cliente from pedidos where status_pedido = 'pendente' order by id_pedido desc;

select id_cliente from pedidos where pedido is null;
	
select id_cliente, count(*)as total_pedido
from pedidos group by id_cliente;

select count(quantidade*preco) from pedidos;		