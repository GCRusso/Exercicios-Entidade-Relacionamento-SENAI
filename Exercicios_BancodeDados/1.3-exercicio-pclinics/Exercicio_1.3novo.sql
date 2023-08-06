CREATE DATABASE Exercicio_1_3_Manha;

USE Exercicio_1_3_Manha;

CREATE TABLE Clinica
(
IdClinica INT PRIMARY KEY IDENTITY,
Endereco VARCHAR(50) NOT NULL,
RazaoSocial VARCHAR(25) NOT NULL,
)

CREATE TABLE Veterinario
(
IdVeterinario INT PRIMARY KEY IDENTITY,
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
Nome VARCHAR(50) NOT NULL,
CRMV VARCHAR(5) NOT NULL,
)

CREATE TABLE Atendimento
(
IdAtendimento INT PRIMARY KEY IDENTITY,
IdVeterinario INT FOREIGN KEY REFERENCES Veterinario(IdVeterinario) NOT NULL,
--IdPet INT FOREIGN KEY REFERENCES Pet(IdPet),
[Data] DATE NOT NULL,
)

CREATE TABLE Pet
(
IdPet INT PRIMARY KEY IDENTITY,
IdAtendimento INT FOREIGN KEY REFERENCES Atendimento(IdAtendimento) NOT NULL,
IdTipodePet INT FOREIGN KEY REFERENCES TipodePet(IdTipodePet) NOT NULL,
IdRaca INT FOREIGN KEY REFERENCES Raca(IdRaca) NOT NULL,
IdDono INT FOREIGN KEY REFERENCES Dono(IdDono) NOT NULL,
[Data] DATE NOT NULL,
)

CREATE TABLE Raca
(
IdRaca INT PRIMARY KEY IDENTITY,
Nome VARCHAR(25) NOT NULL,
)

CREATE TABLE Dono
(
IdDono INT PRIMARY KEY IDENTITY,
Nome VARCHAR(25) NOT NULL,
)

CREATE TABLE TipodePet
(
IdTipodePet INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL,
)

INSERT INTO Clinica(Endereco,RazaoSocial)
VALUES('R. Malaga 226 Santo Andre', '156425364645')

INSERT INTO Dono(Nome)
VALUES('Denis')

INSERT INTO Veterinario(IdClinica, Nome, CRMV)
VALUES('1','Andre', '2546')

INSERT INTO TipodePet(Nome)
VALUES('Felino')

INSERT INTO Raca(Nome)
VALUES('Pastor Alemão')

INSERT INTO Dono(Nome)
VALUES('Angela Dias')

INSERT INTO Atendimento(IdVeterinario, [Data])
VALUES('3', '28-06-2023')

INSERT INTO Pet(IdAtendimento,IdTipodePet,IdDono,IdRaca,[Data])
VALUES('4','3', '2', '3','03-09-2012')



DELETE FROM TipodePet
WHERE IdTipodePet = 3


SELECT [DATA] FROM Atendimento
SELECT * FROM Veterinario
SELECT * FROM TipodePet
SELECT * FROM Raca
SELECT * FROM Pet
SELECT * FROM Dono
SELECT * FROM Clinica


--Aqui seleciona a tabela e o campo que deseja mostrar ATRIBUTOS
SELECT  Atendimento.IdAtendimento,
		Atendimento.[Data],
		Clinica.IdClinica,
		Clinica.Endereco
--os dados que utilizamos em cima foi os dados das tabelas abaixo TABELAS
FROM 
		Atendimento,Clinica
--faz a relação correta da tabela com cada ID correspondente, se caso houver relacao entre as tabelas
WHERE



SELECT * FROM Atendimento,Clinica,Dono,Pet,Raca,TipodePet,Veterinario 

