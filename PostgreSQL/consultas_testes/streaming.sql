-- CRIACAO DA TABELA DE PLANOS
CREATE TABLE planos(
	id_plano SERIAL PRIMARY KEY NOT NULL,
	preco DECIMAL(6,2) NOT NULL,
		CONSTRAINT ck_preco_plano CHECK(preco >= 5)
);

-- criacao da tabela de generos
CREATE TABLE generos (
	id_genero SERIAL PRIMARY KEY NOT NULL,
	nome_genero VARCHAR(40) UNIQUE NOT NULL
);

-- CRIACAO DA TABELA DE DIRETORES
CREATE TABLE diretores (
	id_diretor SERIAL PRIMARY KEY NOT NULL,
	nome_diretor VARCHAR(80) NOT NULL
);

-- CRIACAO DA TABELA DE USUARIOS
CREATE TABLE usuarios (
	id_usuario SERIAL PRIMARY KEY NOT NULL,
	email_user VARCHAR(120) NOT NULL,
	id_plano INTEGER NOT NULL,
		CONSTRAINT fk_plano_user
			FOREIGN KEY (id_plano) REFERENCES planos (id_plano)
);

-- CRIANDO A TABELA DE FILMES
CREATE TABLE filmes (
	id_filme SERIAL PRIMARY KEY NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	ano INTEGER,
	id_genero INTEGER NOT NULL,
	id_diretor INTEGER NOT NULL,
		CONSTRAINT fk_filme_genero
			FOREIGN KEY (id_genero) REFERENCES generos (id_genero),
		CONSTRAINT fk_filme_diretor
			FOREIGN KEY (id_diretor) REFERENCES diretores (id_diretor)
);

-- CRIANDO A TABELA DE ASSISTIDOS
CREATE TABLE assistidos (
	id_usuario INTEGER NOT NULL,
	id_filme INTEGER NOT NULL,
		CONSTRAINT pk_filmes_users_assistidos PRIMARY KEY (id_usuario, id_filme),
		CONSTRAINT fk_filme_assistido
			FOREIGN KEY (id_filme) REFERENCES filmes (id_filme),
		CONSTRAINT fk_user_assistidos
			FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
		
);






