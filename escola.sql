-- CRIANDO A TABELA DE PROFESSORES
CREATE TABLE professores (
	cpf CHAR(11) PRIMARY KEY NOT NULL,
	nome_professor VARCHAR(80) NOT NULL
);

-- CRIANDO A TABELA DE DISCIPLINAS
CREATE TABLE disciplinas (
	id_disciplina SERIAL PRIMARY KEY NOT NULL,
	nome_disciplina VARCHAR(60) NOT NULL UNIQUE

);

-- CRIANDO A TABELA DE TURMAS
CREATE TABLE turmas (
	id_turma SERIAL PRIMARY KEY NOT NULL,
	sala VARCHAR(20),
	cpf CHAR(11) NOT NULL,
	id_disciplina INTEGER NOT NULL,
		CONSTRAINT fk_turma_prof
			FOREIGN KEY (cpf) REFERENCES professores (cpf),
		CONSTRAINT fk_turma_disciplina
			FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina)
);

-- criando a tabela de alunos
CREATE TABLE alunos (
	matricula SERIAL PRIMARY KEY NOT NULL,
	nome_aluno VARCHAR(50) NOT NULL,
	id_turma INTEGER NOT NULL,
		CONSTRAINT fk_turma_aluno
			FOREIGN KEY (id_turma) REFERENCES turmas (id_turma)

);


-- povoando as tabelas com auxilio de IA

-- ==========================================
-- 1. POVOANDO A TABELA PROFESSORES
-- 20 registros
-- ==========================================

INSERT INTO professores (cpf, nome_professor) VALUES
('11111111101', 'Ana Paula Souza'),
('11111111102', 'Carlos Eduardo Lima'),
('11111111103', 'Mariana Oliveira Santos'),
('11111111104', 'Roberto Alves Costa'),
('11111111105', 'Fernanda Martins Rocha'),
('11111111106', 'Paulo Henrique Mendes'),
('11111111107', 'Juliana Ferreira Silva'),
('11111111108', 'Ricardo Gomes Pereira'),
('11111111109', 'Camila Ribeiro Alves'),
('11111111110', 'Lucas Carvalho Nunes'),
('11111111111', 'Patricia Barbosa Dias'),
('11111111112', 'Marcos Vinicius Lopes'),
('11111111113', 'Beatriz Monteiro Reis'),
('11111111114', 'Felipe Cardoso Melo'),
('11111111115', 'Renata Castro Freitas'),
('11111111116', 'Gustavo Moreira Pinto'),
('11111111117', 'Aline Mendes Teixeira'),
('11111111118', 'Daniel Rodrigues Campos'),
('11111111119', 'Sabrina Araujo Batista'),
('11111111120', 'Eduardo Fonseca Ramos');


-- ==========================================
-- 2. POVOANDO A TABELA DISCIPLINAS
-- 20 registros
-- ==========================================

INSERT INTO disciplinas (nome_disciplina) VALUES
('Matematica'),
('Portugues'),
('Historia'),
('Geografia'),
('Biologia'),
('Fisica'),
('Quimica'),
('Ingles'),
('Espanhol'),
('Filosofia'),
('Sociologia'),
('Educacao Fisica'),
('Artes'),
('Literatura'),
('Programacao'),
('Banco de Dados'),
('Redes de Computadores'),
('Logica de Programacao'),
('Estatistica'),
('Empreendedorismo');


-- ==========================================
-- 3. POVOANDO A TABELA TURMAS
-- 20 registros
-- Cada turma referencia um professor
-- e uma disciplina existentes.
-- ==========================================

INSERT INTO turmas (sala, cpf, id_disciplina) VALUES
('Sala 101', '11111111101', 1),
('Sala 102', '11111111102', 2),
('Sala 103', '11111111103', 3),
('Sala 104', '11111111104', 4),
('Sala 105', '11111111105', 5),
('Sala 106', '11111111106', 6),
('Sala 107', '11111111107', 7),
('Sala 108', '11111111108', 8),
('Sala 109', '11111111109', 9),
('Sala 110', '11111111110', 10),
('Sala 201', '11111111111', 11),
('Sala 202', '11111111112', 12),
('Sala 203', '11111111113', 13),
('Sala 204', '11111111114', 14),
('Laboratorio 1', '11111111115', 15),
('Laboratorio 2', '11111111116', 16),
('Laboratorio 3', '11111111117', 17),
('Laboratorio 4', '11111111118', 18),
('Sala 205', '11111111119', 19),
('Sala 206', '11111111120', 20);


-- ==========================================
-- 4. POVOANDO A TABELA ALUNOS
-- 20 registros
-- Cada aluno referencia uma turma existente.
-- ==========================================

INSERT INTO alunos (nome_aluno, id_turma) VALUES
('Joao Pedro Almeida', 1),
('Maria Clara Ribeiro', 2),
('Pedro Henrique Souza', 3),
('Laura Beatriz Costa', 4),
('Gabriel Oliveira Lima', 5),
('Alice Martins Ferreira', 6),
('Miguel Santos Rocha', 7),
('Sophia Carvalho Mendes', 8),
('Arthur Gomes Silva', 9),
('Helena Barbosa Nunes', 10),
('Bernardo Alves Pereira', 11),
('Valentina Castro Dias', 12),
('Heitor Monteiro Lopes', 13),
('Isabella Freitas Ramos', 14),
('Davi Teixeira Campos', 15),
('Manuela Araujo Pinto', 16),
('Lorenzo Cardoso Reis', 17),
('Luiza Moreira Batista', 18),
('Theo Rodrigues Melo', 19),
('Cecilia Fonseca Martins', 20);

INSERT INTO alunos (nome_aluno, id_turma) VALUES
		('Arrascaeta de sousa', 128)


-- ==========================================
-- FIM DOS INSERTS
-- ==========================================

CREATE DATABASE loja;

