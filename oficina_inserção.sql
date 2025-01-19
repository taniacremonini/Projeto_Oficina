drop database oficina_mecanica;

create database oficina_mecanica;
use oficina_mecanica;

create table cliente (
    idCliente int primary key auto_increment,
    nome varchar(50) not null,
	sobrenome varchar(45) not null,
	CPF_ou_CNPJ enum ('CPF' , 'CNPJ') not null,
	documento char (14) not null,
    endereco varchar(255) not null,
    telefone varchar(15) not null ,
    email varchar (50),
    constraint unique_documento_cliente unique(documento)
);

    
create table veiculo(
	idVeiculo int primary key auto_increment,
    idCliente int not null,
    placa varchar(10) not null,
    modelo varchar(100) not null,
    ano int not null,
    constraint fk_veiculo_cliente foreign key (idCliente) references cliente(idCliente)
    
);



 create table mecanico(
	idMecanico int primary	key auto_increment,
	mNome varchar (45) not null,
    endereco text(100) not null,
    especialidade varchar(45)
    
);

create table servico(
	idServico int primary key auto_increment,
	descrição varchar(200) not null,
	valor_mao_de_obra decimal (10,2) not null,
	revisao tinyint default 0,
    tipo_de_revisao enum ('Nao_e_revisao', 'Revisao_Simples', 'Revisao_Completa')
    
);


create table pecas (
	idPeca int primary key auto_increment,
    nome varchar (100) not null,
    preço decimal (10,2) not null,
    quantidade int not null

);

create table estoque(
	idEstoque int primary key auto_increment,
	idPeca int not null default 0,
    quantidade int not null, 
    valor_unitario decimal (10,2) not null,
  
    constraint fk_estoque_peca foreign key (idpeca) references pecas(idpeca)
);


create table fornecedor(
	idFornecedor int primary key auto_increment,
    nome varchar (50) not null,
    endereco varchar (255) not null,
    telefone varchar (15) not null,
    email varchar (50)
);


create table ordem_servico(
	idOrdeservico int primary key auto_increment,
    numero_Os varchar(45) not null,
    data_emissão date not null,
    data_conclusão date , 
    valor_total decimal(10,2) not null,
    status_OS enum ('Aberta', 'Em andamento', 'Concluída', 'Cancelada'),
    idVeiculo int not null,
    idCliente int not null,
    idServico int not null,
    constraint fk_ordem_servico_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
    constraint fk_ordem_servico_cliente foreign key (idCliente) references cliente(idCliente),
	constraint fk_ordem_servico_servico foreign key (idServico) references servico (idServico),
    constraint unique_numero_Os unique(numero_Os)
    
);

create table pagamento(
	idPagamento int primary key auto_increment,
    valor_pago decimal(10,2) not null,
    data_pagamento date not null,
    metodo_pagamento enum ('Cartões', 'Boleto', 'Pix', 'Transferencia'),
    idOrdeservico int not null,
    idVeiculo int not null,
    idCliente int not null,
    idServico int not null,
    constraint pagamento_ordem_servico foreign key (idOrdeservico) references ordem_servico(idOrdeservico),	
    constraint pagamento_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
	constraint pagamento_cliente foreign key ( idCliente) references cliente(idCliente),	
    constraint pagamento_servico foreign key (idServico) references servico(idServico)
);
    

create table OS_Peca(
	idOrdeservico int not null,
	quantidade int not null,
    idVeiculo int not null,
    idCliente int not null,
    idServico int not null,
	valor_total decimal (10,2),
	constraint fk_OS_peca_servico foreign key (idOrdeservico) references ordem_servico(idOrdeservico),
    constraint fk_OS_peca_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
	constraint fk_OS_pecas_veiculo_cliente foreign key (idCliente) references cliente(idCliente),
    constraint fk_OS_pecas_servico_ foreign key (idServico) references servico (idServico)
    
);

create table OS_Mecanico(
	idMecanico int not null,
	idOrdeservico int not null,
    idVeiculo int not null,
    idCliente int not null,
    idServico int not null,
    constraint fk_OS_mecanico_ordem_servico foreign key (idOrdeservico) references ordem_servico(idOrdeservico),
    constraint fk_OS_mecanico_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
	constraint fk_OS_mecanico_cliente foreign key (idCliente) references cliente(idCliente),
    constraint fk_OS_mecanico_servico foreign key (idServico) references servico (idServico)
    
);

create table OS_Servico(
	idServico int not null,
	idOrdeservico int not null,
    idVeiculo int not null,
    idCliente int not null,
	constraint fk_OS_Servico_ordem_servico foreign key (idOrdeservico) references ordem_servico(idOrdeservico),
    constraint fk_OS_Servico_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
	constraint fk_OS_Servico_cliente foreign key (idCliente) references cliente(idCliente),
    constraint fk_OS_Servico_servico foreign key (idServico) references servico(idServico)
    );