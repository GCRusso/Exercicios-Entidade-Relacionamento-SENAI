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
VALUES
('R. Malaga 226 Santo Andre', '156425364645'),
('R. Martinica 199 Santo Andre', '12343256567');


INSERT INTO Dono(Nome)
VALUES
('Denis'),
('Gabriel'),
('Jorge'),
('Patricia');

INSERT INTO Veterinario(IdClinica, Nome, CRMV)
VALUES
('1','Andre', '2546'),
('2','Carla', '2236'),
('1','Maria Luiza', '1236'),
('2','Marco Felipe', '5676'),
('1','Jorge','7898');


INSERT INTO TipodePet(Nome)
VALUES
('Gato'),
('Cachorro'),
('Hamsters');


INSERT INTO Raca(Nome)
VALUES
('Pastor Alemão'),
('Golden Retriever,'),
('Pug'),
('Angorá'),
('Siames'),
('Sphynx'),
('Anão Russo');

INSERT INTO Atendimento(IdVeterinario, [Data])
VALUES
('1', '28-08-2023'),
('1', '13-08-2023'),
('2', '07-07-2023'),
('2', '09-05-2023'),
('3', '10-06-2023'),
('4', '30-07-2023');


INSERT INTO Pet(IdAtendimento,IdTipodePet,IdDono,IdRaca,[Data])
VALUES
('1','1','1','4','03-09-2012'),
('2','2','1','2','03-09-2012'),
('3','3','3','7','03-09-2012'),
('4','2','4','3','03-09-2012'),
('5','2','2','1','03-09-2012'),
('6','1','2','6','03-09-2012');


--- listar todos os veterinários (nome e CRMV) de uma clínica (razão social)
SELECT
    Veterinario.Nome AS NomeVeterinario,
    Veterinario.CRMV,
    Clinica.RazaoSocial,
    Clinica.Endereco
FROM
    Veterinario
	JOIN Clinica ON Veterinario.IdClinica = Clinica.IdClinica;


--- listar todas as raças que começam com a letra S
SELECT
    IdRaca,
    Nome
FROM
    Raca
WHERE
    Nome LIKE 'S%';

--- listar todos os tipos de pet que terminam com a letra O
SELECT
	IdTipodePet,
	Nome
FROM
	TipodePet
WHERE
	Nome LIKE '%O';

--- listar todos os pets mostrando os nomes dos seus donos
SELECT
    Pet.IdPet AS CodigoPet,
    Dono.Nome AS NomeDono
FROM
    Pet
LEFT JOIN
    Dono ON Pet.IdDono = Dono.IdDono;

	
--- listar todos os pets mostrando os tipos de pet

SELECT
	Pet.IdPet,
	TipodePet.Nome
FROM
	Pet
LEFT JOIN TipodePet ON Pet.IdTipodePet = TipodePet.IdTipodePet;


--- listar todos os atendimentos mostrando o nome do veterinário que atendeu, o nome, a raça e o tipo do pet que foi atendido, o nome do dono do pet e o nome da clínica onde o pet foi atendido
SELECT
    Atendimento.IdAtendimento,
    Veterinario.Nome AS NomeVeterinario,
    Raca.Nome AS NomeRaca,
    TipodePet.Nome AS TipoPet,
    Dono.Nome AS NomeDono,
    Clinica.Endereco AS Endereço
FROM
    Atendimento
JOIN
    Veterinario ON Atendimento.IdVeterinario = Veterinario.IdVeterinario
JOIN
    Pet ON Atendimento.IdAtendimento = Pet.IdAtendimento
JOIN
    Raca ON Pet.IdRaca = Raca.IdRaca
JOIN
    TipodePet ON Pet.IdTipodePet = TipodePet.IdTipodePet
JOIN
    Dono ON Pet.IdDono = Dono.IdDono
JOIN
    Clinica ON Veterinario.IdClinica = Clinica.IdClinica;