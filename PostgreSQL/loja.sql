-- CRIANDO A TABELA DE CATEGORIAS
CREATE TABLE categorias (
	id_categoria SERIAL PRIMARY KEY NOT NULL,
	nome_categoria VARCHAR(20) NOT NULL
);

-- CRIANDO TABELA DE CLIENTES
CREATE TABLE clientes (
	id_cliente SERIAL PRIMARY KEY NOT NULL,
	nome_cliente VARCHAR(60) NOT NULL
);

-- CRIANDO A TABELA DE PRODUTOS
CREATE TABLE produtos (
	id_produto SERIAL NOT NULL,
	nome_produto VARCHAR(80) NOT NULL,
	preco DECIMAL(8,2) NOT NULL,
	id_categoria INTEGER NOT NULL,
		CONSTRAINT fk_produtos_categs
			FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria),
		CONSTRAINT ck_preco_negativo CHECK (preco >= 0)

);

ALTER TABLE 

-- criando a tabela de pedidos
CREATE TABLE pedidos (
	id_pedido SERIAL PRIMARY KEY NOT NULL,
	data DATE NOT NULL,
	id_cliente INTEGER NOT NULL,
		CONSTRAINT fk_pedidos_cliente
			FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- criando a entidade associativa entre pedidos e produtos
CREATE TABLE item_pedido (
	id_pedido INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
		CONSTRAINT pk_item_pedido PRIMARY KEY(id_pedido, id_produto),
		CONSTRAINT fk_item_pedido_pedidos
			FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido),
		CONSTRAINT fk_item_pedido_produtos
			FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);





ALTER TABLE produtos
ADD CONSTRAINT pk_produtos PRIMARY KEY (id_produto)


CREATE DATABASE streaming;










