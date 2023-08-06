CREATE DATABASE Exercicio_1_2_Manha;

USE Exercicio_1_2_Manha;

-----------TABELA EMPRESA-----------
CREATE TABLE Empresa
(
IdEmpresa INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL
);

-----------TABELA CLIENTE-----------
CREATE TABLE Cliente
(
IdCliente INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL,
CPF VARCHAR(25) NOT NULL
);

-----------TABELA MODELO-----------

CREATE TABLE Modelo
(
IdModelo INT PRIMARY KEY IDENTITY,
IdMarca INT FOREIGN KEY REFERENCES Marca(IdMarca) NOT NULL,
Nome VARCHAR(50) NOT NULL
);

-----------TABELA MARCA-----------
CREATE TABLE Marca
(
IdMarca INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL
);

-----------TABELA VEICULO-----------
CREATE TABLE Veiculo
(
IdVeiculo INT PRIMARY KEY IDENTITY,
IdEmpresa INT FOREIGN KEY REFERENCES Empresa(IdEmpresa) NOT NULL,
IdModelo INT FOREIGN KEY REFERENCES Modelo(IdModelo) NOT NULL,
Placa VARCHAR(7) NOT NULL
);

-----------TABELA ALUGUEL-----------
CREATE TABLE Aluguel
(
IdAluguel INT PRIMARY KEY IDENTITY,
IdCliente INT FOREIGN KEY REFERENCES Cliente(IdCliente) NOT NULL,
IdVeiculo INT FOREIGN KEY REFERENCES Veiculo(IdVeiculo) NOT NULL,
DataRetirada DATE NOT NULL,
DataDevolucao DATE NOT NULL,
Protocolo VARCHAR(7) NOT NULL
)


INSERT INTO Aluguel(IdCliente,IdVeiculo,Protocolo,DataRetirada,DataDevolucao)
VALUES
('1','3','3456','25-02-2023','28-02-2023'),
('2','5','3423','03-03-2023','06-03-2023'),
('3','8','3534','09-03-2023','15-03-2023'),
('4','10','3546','18-04-2023','20-04-2023'),
('5','12','9878','26-05-2023','26-06-2023'),
('2','11','2388','26-08-2023','30-08-2023'),
('4','1','7865','26-07-2023','27-07-2023'),
('5','2','4567','01-08-2023','10-08-2023');
SELECT * FROM Aluguel

INSERT INTO Cliente(Nome, CPF)
VALUES
('Joao', '15121221123'),
('Gabriel', '154353463'),
('Pedro', '678678464'),
('Everson', '1545667567'),
('Cleber', '2133243455');
SELECT * FROM Cliente

INSERT INTO Empresa(Nome)
VALUES
('Hot Cars'),
('Cars Max'),
('Luigis Cars');
SELECT * FROM Empresa

INSERT INTO Marca(Nome)
VALUES
('Fiat'),
('VolksWagen'),
('Chevrolet'),
('Audi'),
('Honda');
SELECT * FROM Marca

INSERT INTO Modelo(IdMarca,Nome)
VALUES
('1','Uno'),
('2','Jetta'),
('3','Celta'),
('3','Camaro'),
('2','Golf'),
('5','Civic'),
('5','HRV'),
('4','RS6');
SELECT * FROM Modelo

INSERT INTO Veiculo(IdEmpresa,IdModelo,Placa)
VALUES
('1','1','AAA4512'),
('2','2','ASD2132'),
('2','3','EFS3455'),
('3','4','FDG4533'),
('2','5','GFH5666'),
('1','6','YJH7899'),
('1','7','ASD2345'),
('2','7','JHG7689'),
('2','6','RET0978'),
('3','5','PIC4455'),
('2','4','CLR3333'),
('1','3','GOL3451');
SELECT * FROM Veiculo



--- listar todos os alugueis mostrando as datas de início e fim, o nome do cliente que alugou e nome do modelo do carro
SELECT
    Empresa.Nome AS NomeEmpresa,
    Cliente.Nome AS NomeCliente,
    Cliente.CPF,
    Aluguel.Protocolo,
    Marca.Nome AS NomeMarca,
    Modelo.Nome AS NomeModelo,
    Veiculo.Placa
FROM
    Empresa
LEFT JOIN
    Veiculo ON Empresa.IdEmpresa = Veiculo.IdEmpresa
LEFT JOIN
    Aluguel ON Veiculo.IdVeiculo = Aluguel.IdVeiculo  
LEFT JOIN
    Cliente ON Cliente.IdCliente = Aluguel.IdCliente
LEFT JOIN
    Modelo ON Modelo.IdModelo = Veiculo.IdModelo
LEFT JOIN
    Marca ON Marca.IdMarca = Modelo.IdMarca;


--- listar os alugueis de um determinado cliente mostrando seu nome, as datas de início e fim e o nome do modelo do carro

SELECT 
	Cliente.Nome AS NomeCliente,
	Marca.Nome AS Montadora,
	Modelo.Nome AS Modelo,
	Aluguel.DataRetirada AS DataInicio,
	Aluguel.DataDevolucao AS DataTermino
FROM
	Cliente
LEFT JOIN
	Aluguel ON Aluguel.IdCliente = Cliente.IdCliente
LEFT JOIN
	Veiculo ON Aluguel.IdVeiculo = Veiculo.IdVeiculo
LEFT JOIN
	Modelo ON Veiculo.IdModelo = Modelo.IdModelo
LEFT JOIN
	Marca ON Modelo.IdMarca = Marca.IdMarca

