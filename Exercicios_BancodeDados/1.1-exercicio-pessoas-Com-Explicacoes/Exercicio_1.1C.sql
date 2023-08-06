------------BANCO DE DADOS PESSOA-------------
--Comando para criar o banco de dados
CREATE DATABASE Exercicio_1_1_Manha;

--Comando para usar o banco de dados
USE Exercicio_1_1_Manha;


------------TABELA PESSOA-------------
--Comando para criar as tabelas 
CREATE TABLE Pessoa
(
IdPessoa INT PRIMARY KEY IDENTITY,
Nome VARCHAR(25) NOT NULL,
CNH VARCHAR(25) NOT NULL
);

------------TABELA EMAIL-------------
CREATE TABLE Email
(
IdEmail INT PRIMARY KEY IDENTITY,
IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa) NOT NULL,
Endereco VARCHAR(100) NOT NULL
);

------------TABELA TELEFONE-------------
CREATE TABLE Telefone
(
IdTelefone INT PRIMARY KEY IDENTITY,
IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa),
IdEmail INT FOREIGN KEY REFERENCES Email(IdEmail),
Telefone VARCHAR(13)
);


--Select Telefone
SELECT * FROM Telefone

--Select Email
SELECT * FROM Email

--Select Pessoa
SELECT * FROM Pessoa




--Insert pessoa
INSERT INTO Pessoa(Nome,CNH)
VALUES
('Gabriel','456126456'),
('Lucas','213214325'),
('Pedro','12312543'),
('Miguel','213454364'),
('Antonio','748392023'),
('Vera','31248455494'),
('Carlos','6573424789'),
('Henriqueta','3454565756876');

--Insert Telefone
INSERT INTO Telefone(Telefone, IdPessoa, IdEmail)
VALUES
('551194646545','1','1'),
('234324324323','2','2'),
('123214235435','3','3'),
('546576543356','4','4');

--Insert Email
INSERT INTO Email(Endereco, IdPessoa)
VALUES
('Gabriel@gmail.com','1'),
('Lucas@gmail.com','2'),
('Pedro@gmail.com','3'),
('Miguel@gmail.com','4'),
('Antonio@gmail.com','5'),
('Vera@gmail.com','6'),
('Carlos@gmail.com','7'),
('Henriqueta@gmail.com','8'),
('GabrielCoral@gmail.com','1');



--- listar as pessoas em ordem alfabética reversa, mostrando seus telefones, seus e-mails e suas CNHs
SELECT
	Pessoa.Nome,
	Email.Endereco,
	Telefone.Telefone
FROM
	Pessoa
LEFT JOIN Email ON Pessoa.IdPessoa = Email.IdPessoa
LEFT JOIN Telefone ON Email.IdEmail = Telefone.IdEmail
ORDER BY Nome DESC;






/*
****************************  Exemplo do professor   *******************************
--1º forma para mostrar a lista relacionada*/
SELECT 
	Pessoa.Nome,
	Pessoa.CNH,
	--APELIDO PARA ENDERECO, TORNANDO EMAIL. 
	Email.Endereco AS Email,
	Telefone.Numero AS Telefone
	--os dados que utilizamos em cima foi os dados das tabelas abaixo
FROM
	Pessoa,
	Email,
	Telefone

	/* faz a relação correta da tabela com cada ID correspondente, se caso houver relacao entre as tabelas
	   Relacao feita com a chave primaria de uma tabela e a estrangeira da outra.*/
WHERE
	Pessoa.IdPessoa = Email.IdPessoa
	AND Pessoa.IdPessoa = Telefone.IdPessoa


	/*2º Forma para mostrar a lista relacionada 

*****************************************************  LEFT JOIN E RIGHT JOIN   **************************************************
	--LEFT JOIN utilizado apenas para tabelas que estarao na esquerda. E RIGHT JOIN o mesmo racicionio porem muda os lados
	--JOIN ele tras somente quando todos os dados estao preenchidos, LEFT JOIN mesmo se nao estiver com todos os campos preenchidos porem ele tras com o valor NULL*/
	

	--SIMPLES
	SELECT * FROM
	Pessoa LEFT JOIN Email ON Pessoa.IdPessoa = Email.IdPessoa
	

	--FILTRADO E ALINHADO OS IDS RESPECTIVOS
	SELECT
	Pessoa.Nome,
	Pessoa.CNH,
	Telefone.Telefone,
	Email.Endereco AS Email
	FROM
	Pessoa LEFT JOIN Telefone ON Pessoa.IdPessoa = Telefone.IdPessoa
	LEFT JOIN Email ON Pessoa.IdPessoa = Email.IdPessoa





	