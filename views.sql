use restaurante;
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT 
    p.id_pedido AS pedido_id,
    c.nome AS cliente_nome,
    c.email AS cliente_email,
    f.nome AS funcionario_nome,
    pr.nome AS produto_nome,
    pr.preco,
    p.quantidade,
    p.data_pedido,
    (p.quantidade * pr.preco) AS total
FROM pedidos p
JOIN cliente c ON p.id_cliente = c.id_cliente
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
JOIN produtos pr ON p.id_produto = pr.id_produto;

SELECT pedido_id, cliente_nome, total
FROM resumo_pedido;

EXPLAIN
SELECT pedido_id, cliente_nome, total
FROM resumo_pedido;

DELIMITER //

CREATE FUNCTION BuscaIngredientesProduto(idProd INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE ingredientesProduto TEXT;

    SELECT ingredientes 
    INTO ingredientesProduto
    FROM info_produto
    WHERE id_produto = idProd;

    RETURN ingredientesProduto;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION mediaPedido(idPedido INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE media_val DECIMAL(10,2);
    DECLARE valorPedido DECIMAL(10,2);
    DECLARE resultado VARCHAR(100);

    -- média dos pedidos
    SELECT AVG(total) INTO media_val FROM resumo_pedido;

    -- total do pedido
    SELECT total INTO valorPedido
    FROM resumo_pedido
    WHERE pedido_id = idPedido;

    IF valorPedido > media_val THEN
        SET resultado = CONCAT('Pedido ', idPedido, ' acima da média');
    ELSEIF valorPedido < media_val THEN
        SET resultado = CONCAT('Pedido ', idPedido, ' abaixo da média');
    ELSE
        SET resultado = CONCAT('Pedido ', idPedido, ' igual à média');
    END IF;

    RETURN resultado;
END //

DELIMITER ;

SELECT mediaPedido(1);
SELECT mediaPedido(2);

SELECT BuscaIngredientesProduto(1);