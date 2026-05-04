use restaurante;
	select nome,preco from produtos where preco > 30;
		select nome,telefone,data_nascimento from cliente where year (data_nascimento)  <= 1985;
			select id_produto, ingredientes from info_produto where ingredientes like  '%Carne%';
		select nome,categoria from produtos order by nome,categoria asc;
	select nome, preco from produtos order by preco desc limit 5;
	select nome,categoria from produtos order by categoria asc limit 2 offset 5;
create table backup_pedidos as select * from pedidos;

			select * from pedidos;
		select * from pedidos where id_funcionario =4 and status_pedido = 'Pendente';
	select * from pedidos where status_pedido not like 'Concluido';
select * from pedidos where id_produto in (1,3,5,7,8);
		select * from cliente where nome like 'C%';
	select * from info_produto where ingredientes like '%Carne%' or ingredientes like '%Frango%';
select * from produtos where preco between 20 and 30;
			update pedidos set status_pedido = null where id_cliente =6;
		select * from pedidos where status_pedido is null;
	select id_pedido, status_pedido, ifnull(status_pedido,'cancelado') from pedidos;
select nome,cargo,salario,if(salario>3000,'acima da media','abaixo da media')as media_salario from funcionarios;


			select sum(quantidade) from pedidos;
		select count(distinct id_cliente) from pedidos;
        select count(distinct quantidade) from pedidos;
	select avg(preco) from produtos;
		select min(preco) from produtos;
			select max(preco) from produtos;
			select nome, preco, rank()over ( order by preco desc ) as max_preco from produtos limit 5;
		select avg(preco) from produtos group by categoria;
	 
		select fornecedor from info_produto where id_produto >= 1;
			select id_cliente from pedidos where quantidade =1;