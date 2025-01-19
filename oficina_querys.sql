use oficina_mecanica;
select * from cliente;
select * from  veiculo;
select * from mecanico;
select * from servico;
select * from pecas;
select * from estoque;
select * from fornecedor;
select * from ordem_servico;
select * from pagamento;
select * from OS_Peca;
select * from OS_Mecanico;
select * from OS_Servico;

-- Mostrar todas as peças cujo preço é maior que 100
select * from pecas
where preço >100;


-- Mostra as peças cujo nome começa com a letra "V"
select * from pecas 	
	where nome like 'V%';
    
    
    -- Calcule o valor total de estoque para cada peça
 select nome preço, quantidade,
	(preço * quantidade ) as valor_total_estoque
    from pecas;
    
    
    -- verificar se o estoque é baixo (quantidade menor que 10):
select nome, quantidade,
	case 
		when quantidade <10 then 'Estoque Baixo'
        else 'Estoque Suficiente'
	end as status_estoque
 from pecas;
 
 
 -- Agrupar as peças por quantidade e mostre apenas os grupos com valor total de estoque maior que 1000:
 select quantidade,
	(max(preço) * quantidade) as valor_total_estoque
		from oficina_mecanica.pecas
        group by quantidade
        having sum(preço * quantidade) > 1000
        limit 0, 1000;
        
-- Listar cliente, veiculos e consertos realizados
Select cliente.nome as cliente,
	cliente.sobrenome as sobrenome,
    veiculo.placa as placa,
    veiculo.modelo as veiculo,
    ordem_servico.numero_Os as numero_Os,
    servico.descrição as serviço,
    ordem_servico.valor_total as Valor_total
from ordem_servico
inner join  cliente on ordem_servico.idCliente = cliente.idCliente
inner join veiculo on ordem_servico.idVeiculo = veiculo.idVeiculo
inner join servico on ordem_servico.idServico = servico.idServico;


-- Listar clientes e métodos de pagamento utilizados
select cliente.nome as Cliente,
	cliente.sobrenome as Sobrenome,
    pagamento.metodo_pagamento as Forma_de_Pagamento,
    pagamento.data_pagamento as Data_do_Pagamento,
    pagamento.valor_pago as Valor_Pago
from pagamento
inner join cliente on pagamento.idcliente = cliente.idCliente

