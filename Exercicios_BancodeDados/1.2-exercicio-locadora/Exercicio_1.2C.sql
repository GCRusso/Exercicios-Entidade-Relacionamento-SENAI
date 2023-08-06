CREATE DATABASE Exercicio_1_2_manha;

USE Exercicio_1_2_manha;

-----------TABELA EMPRESA-----------
CREATE TABLE Empresa
(
IdEmpresa INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL
)

-----------TABELA CLIENTE-----------
CREATE TABLE Cliente
(
IdCliente INT PRIMARY KEY IDENTITY,
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa),
Nome VARCHAR(50) NOT NULL,
CPF VARCHAR(25) NOT NULL,
)

-----------TABELA MODELO-----------

CREATE TABLE Modelo
(

IdModelo INT PRIMARY KEY IDENTITY,
IdMarca INT FOREIGN KEY REFERENCES Marca(IdMarca),
Nome VARCHAR(50) NOT NULL
)

-----------TABELA MARCA-----------
CREATE TABLE Marca
(
IdMarca INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL,
)

-----------TABELA VEICULO-----------
CREATE TABLE Veiculo
(
IdVeiculo INT PRIMARY KEY IDENTITY,
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa) NOT NULL,
IdModelo INT FOREIGN KEY REFERENCES Modelo(IdModelo) NOT NULL,
IdMarca INT FOREIGN KEY REFERENCES Marca(IdMarca) NOT NULL,
Placa VARCHAR(7) NOT NULL,
)

-----------TABELA ALUGUEL-----------
CREATE TABLE Aluguel
(
IdAluguel INT PRIMARY KEY IDENTITY,
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa) NOT NULL,
IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente) NOT NULL,
[DataRetirada] DATE NOT NULL,
[DataDevolucao] DATE NOT NULL,
Protocolo VARCHAR(7) NOT NULL,
)


INSERT INTO Aluguel(IdEmpresa, IdCliente, Protocolo,[DataRetirada],[DataDevolucao])
VALUES
('1','1','3456','25-02-2023','28-02-2023'),
('3','2','3423','03-03-2023','06-03-2023'),
('2','3','3534','09-03-2023','15-03-2023'),
('3','4','3546','18-04-2023','20-04-2023'),
('1','5','9878','26-05-2023','26-06-2023');

INSERT INTO Cliente(Nome, CPF)
VALUES
('Joao', '15121221123'),
('Gabriel', '154353463'),
('Pedro', '678678464'),
('Everson', '1545667567'),
('Cleber', '2133243455')



INSERT INTO Empresa(Nome)
VALUES
('Hot Cars'),
('Cars Max'),
('Luigis Cars')


INSERT INTO Marca(Nome)
VALUES
('Fiat'),
('VolksWagen'),
('Chevrolet')

INSERT INTO Modelo(Nome)
VALUES
('Uno'),
('Jetta'),
('Celta'),
('Camaro'),
('Golf')


INSERT INTO Veiculo(IdEmpresa,IdModelo,IdMarca,Placa)
VALUES
('1','2','2','AAA4512'),
('2','1','1','ASD2132'),
('2','4','3','EFS3455'),
('3','5','2','FDG4533'),
('2','2','2','GFH5666'),
('1','3','3','YJH7899')

UPDATE Modelo
SET Nome = 'Uno' WHERE IdModelo = 1


---------------LEFT JOIN--------------------
	SELECT
	Empresa.Nome AS Empresa,
	Cliente.Nome AS NomeCliente,
	Cliente.CPF,
	Aluguel.Protocolo,
	Marca.Nome AS Marca,
	Modelo.Nome AS Modelo,
	Veiculo.Placa
	FROM
	Empresa LEFT JOIN Cliente ON Empresa.IdEmpresa = Cliente.IdEmpresa
	LEFT JOIN Aluguel ON Empresa.IdEmpresa = Aluguel.IdEmpresa
	LEFT JOIN Veiculo ON Veiculo.IdEmpresa  = Empresa.IdEmpresa 
	LEFT JOIN Marca ON Marca.IdMarca = Veiculo.IdMarca
	LEFT JOIN Modelo ON Modelo.IdModelo = Marca.IdMarca

	
