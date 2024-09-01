CREATE DATABASE SISTEMADEVENDA;
USE SISTEMADEVENDA;

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    CPF VARCHAR(14),
    email VARCHAR(50),
    telefone VARCHAR(11),
    dataNascimento DATE
);

INSERT INTO cliente(nome, cpf, email, telefone, dataNascimento)
VALUES ("Jean Carlos", "059.297.062-04", "jean.carlos@gmail.com", "69993761354", '2004-11-25'), ("Alan PAblo", "059.237.075-41", "alan.pablo@gmail.com", "69992581621", '2006-12-05');

SELECT * FROM cliente;

CREATE TABLE servicos(
	id_servico INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL, 
    descricao VARCHAR(200),
    tempo TIME 
);

INSERT INTO servicos(valor, descricao, tempo)
VALUES(40, "Lavagem completa de carro, dentro e fora", '01:30:00'), (25, "Lavagem de carro só por fora", '00:40:00'), (120, "Polimento de carro", '03:30:00'), (30, "Lavagem de moto", '00:30:00'), (50, "Polimento de moto", '01:00:00');

SELECT * FROM servicos;

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cpf VARCHAR(14)
);

SELECT * FROM funcionario;

INSERT INTO funcionario (nome, cpf)
VALUES("LUCAS SILVA", "547.123.564-36"), ("Pablo Marsal", "321.478.875-23"), ("Kaio Lobato", "564.231.002-07");

CREATE TABLE dispositivo(
	id_dispositivo INT PRIMARY KEY AUTO_INCREMENT,
    aliquota DECIMAL,
    descricao VARCHAR(200),
    statusDisp VARCHAR(20)
);

SELECT * FROM dispositivo;

INSERT INTO dispositivo(aliquota, descricao, statusDisp)
VALUES(1, "Experimente a facilidade e a eficiência das nossas máquinas de passar cartão de crédito.", "Ligado");


CREATE TABLE venda(
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_cliente INT,
    data_ DATE,
    hora TIME,
    valorTotal DECIMAL,
    desconto DECIMAL,
    valorFinal DECIMAL,
    tipo VARCHAR(25),
    FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO venda(fk_id_cliente, data_, hora, valorTotal, desconto, valorFinal, tipo)
VALUES(01, '2024-08-03', '19:39:05', 500, 10, 450, "Dinheiro"),
(2, '2024-08-02', '15:33:47', 40, 0, 40, "Pix");


SELECT * FROM venda;

CREATE TABLE itemVenda (
	valorUnitario DECIMAL,
    quantidade INT,
    fk_id_servico INT NOT NULL,
    fk_id_venda INT NOT NULL,
    FOREIGN KEY (fk_id_servico) REFERENCES servicos(id_servico),
    FOREIGN KEY (fk_id_venda) REFERENCES venda(id_venda) ON DELETE CASCADE
);

INSERT INTO itemVenda (valorUnitario, quantidade, fk_id_servico, fk_id_venda)
VALUES(40, 1, 3, 3);

SELECT * FROM itemVenda;
SELECT * FROM venda;
SELECT * FROM servicos;

CREATE TABLE caixa(
	id_caixa INT PRIMARY KEY AUTO_INCREMENT,
    saldoInicial DECIMAL,
    totalEntradas DECIMAL, 
    totalSaidas DECIMAL,
    saidas  DECIMAL,
    statusCaixa VARCHAR(20),
    fk_id_funcionario INT NOT NULL,
    FOREIGN KEY (fk_id_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO caixa(saldoInicial, totalEntradas, totalSaidas, saidas, fk_id_funcionario)
VALUES(00, 1000, 100, 100, 1), (00, 40, 00, 00, 1) ;

CREATE TABLE recebimento(
	id_recebimento INT PRIMARY KEY AUTO_INCREMENT, 
    valor DECIMAL,
    dataRebimento DATE,
    dataPagamento DATe, 
    status_ VARCHAR(30),
    fk_id_venda INT,
    fk_id_caixa INT NOT NULL,
    FOREIGN KEY (fk_id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (fk_id_caixa) REFERENCES caixa(id_caixa)
);

INSERT INTO recebimento (valor, dataRebimento, dataPagamento, status_, fk_id_venda, fk_id_caixa)
VALUES(40, '2024-08-05', '2024-08-05', "QUITADO", 3, 1);

SELECT * FROM recebimento;


CREATE TABLE encargo(
	id_encargo INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL, 
    descricao VARCHAR(200),
    fk_id_recebimento INT NOT NULL,
    fk_id_dispositivo INT NOT NULL,
    FOREIGN KEY (fk_id_recebimento) REFERENCES recebimento(id_recebimento) ON DELETE CASCADE,
    FOREIGN KEY (fk_id_dispositivo) REFERENCES dispositivo(id_dispositivo)
);

INSERT INTO encargo (valor, descricao, fk_id_recebimento, fk_id_dispositivo)
VALUES(40, "QUITADO", 1, 1);

CREATE TABLE despesa(
	id_despesa INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL,
    dataVenciemnto DATE, 
    dataPagamento DATE,
    status_ VARCHAR(30),
    fk_id_caixa INT NOT NULL,
    FOREIGN KEY(fk_id_caixa) REFERENCES caixa(id_caixa),
    fk_id_fornecedor INT
    
);


ALTER TABLE despesa CHANGE fk_id_fornecedor fk_id_fornecedor INT NOT NULL;
SELECT * FROM despesa;



CREATE TABLE fornecedores(
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(50),
    nomeFantasia VARCHAR(50),
    CNPJ VARCHAR(14),
    ativo VARCHAR(10),
    atividadeEconomica VARCHAR(50),
    telefone VARCHAR(11),
    email VARCHAR(50)
);

INSERT INTO despesa (valor, dataVenciemnto, dataPagamento, status_, fk_id_caixa)
VALUES (100, '2024-11-25', '2024-08-05', "DEVENDO", 1);

/* PARA ORDENAR VALORES DE UMA VARIAVEL DO MENOR PARA O MAIOR*/
SELECT * FROM servicos ORDER BY valor;

/*SELECIONAR VALOR MAIOR DE UMA VARIAVEL*/
SELECT MAX(valor) FROM servicos;

SELECT MAX(valor)  FROM servicos;

/* SELECIONAR VALOR MENOR DE UMA VARIAVEL*/
SELECT MIN(valor) FROM servicos;

/*FAZER SOMA DE TODOS OS VALORES*/
SELECT SUM(valor) FROM servicos;

/*CALCULAR A MEDIA DE TODOS OS VALORES DE UMA VARIAVEL*/
SELECT AVG(valor) FROM servicos;

/*SELECIONAR TODOS OS VALORES QUE FOREM MAIOR QUE A CONDIÇÃO*/
SELECT * FROM servicos WHERE valor > 100;

SELECT * FROM servicos WHERE valor > 100 OR  tempo < '00:00:30';

/*SELECIONANDO TODOS OS SERVIÇOS QUE SE INIACIA COM A*/
SELECT * FROM servicos WHERE descricao LIKE "A%";

/*PARA SELECIONAR APENAS COLUNAS*/
SELECT nome, CPF FROM cliente ;

/*SELECIONANDO CLIENTES QUE NÃO SÃO NOT NULL*/
SELECT * FROM venda WHERE fk_id_cliente IS NOT NULL;

/*SELECIONANDO TABELAS DE venda E cliente E FAZENDO A JUNÇÃO DA TABELA*/
SELECT * FROM venda 
	INNER JOIN cliente AS c on c.id_cliente = venda.fk_id_cliente ;
        
/*SELECIONANDO AS TABELAS DE venda E cliente ONDE CLIENTE NÃO SEJA NULL */
SELECT * FROM venda 
	LEFT JOIN cliente AS c on c.id_cliente = venda.fk_id_cliente;
    
/* AO CONTRARIO NA DE CIMA*/
SELECT * FROM venda 
	RIGHT JOIN cliente AS c on c.id_cliente = venda.fk_id_cliente;


/*PARA CONSULTAR TABELAS INTEIRAS*/
DESC VENDA;

/*FULL JOIN*/
SELECT nome, CPF FROM cliente
	UNION
SELECT nome, cpf FROM funcionario;

ALTER TABLE caixa ADD statusCaixa VARCHAR(20);

/*SELECIONA LINHA INTEIRA DO VALOR MAXIMO DE UMA VARIAVEL*/
SELECT * FROM servicos
	WHERE valor = (SELECT MAX(valor) FROM servicos);
    
    -- ATIVIDADES
    
    /*SELECIONAR TODOS OS SERVIÇOS  QUE POSSUEM VALORES MAIORES QUE A MÉDIA DOS VALORES DOS SERVIÇOS*/
SELECT * FROM servicos
	WHERE valor > (SELECT AVG(valor) FROM servicos);
    
  /*SELECIONAR TODOS OS SERVIÇOS QUE POSSUEM VALORES SUPERIORES A MEDIA DOS VALORES VENDIDOS*/
SELECT * FROM servicos
	WHERE valor > (SELECT AVG(valorunitario) FROM itemvenda);

/*FAÇA UMA CONSULTA SQL QUE RETORNE TODOS OS RECEBIMENTOD FEITOS POR UM USUARIO
A SELEÇÃO DEVE SER FEITA PELO CPF DO FUNCIONÁRIO*/
SELECT * FROM recebimento AS r
	INNER JOIN caixa AS c ON C.id_caixa = r.fk_id_caixa
    INNER JOIN funcionario AS f ON f.id_funcionario = c.fk_id_funcionario
    WHERE f.cpf = '547.123.564-36' AND r.status_ = "QUITADO";
    
	
    /*PEGAR TODOS OS RECEBIMENTOS DE DETERMINADO CLIENTE
    A SELEÇÃO DEVE SER FEITA PELO CPF DO CLIENTE*/
    
/*PRÓXIMA AULA*/
SELECT fk_id_caixa, SUM(valorparcela) FROM recebimentos GROUP BY fk_id_caixa;

	
SELECT * FROM recebimento;









SELECT * FROM servicos;

UPDATE servicos SET valor = 50 WHERE id_servico = 1;

SELECT iV.id_itemvenda, iV.fk_id_venda, s.descricao FROM itemvenda AS iV
	INNER JOIN servicos AS s ON iV.fk_id_servico = s.id_servico;

SELECT v.id_venda, v.valorFinal, c.nome FROM venda AS v 
	LEFT JOIN cliente AS c ON v.fk_id_cliente = c.id_cliente;
    
SELECT c.saldoInicial, c.totalEntradas, c.totalSaidas, c.saidas, c.statusCaixa, f.nome, f.cpf FROM caixa AS c
	 LEFT JOIN funcionario AS f ON c.fk_id_funcionario = f.id_funcionario;
     
SELECT * FROM servicos AS s WHERE (SELECT COUNT(id_itemvenda) FROM itemvenda WHERE fk_id_servico = s.id_servico)>2;

SELECT * FROM venda AS v WHERE (SELECT COUNT(id_recebimento) FROM recebimento WHERE fk_id_venda = v.id_venda)>1;