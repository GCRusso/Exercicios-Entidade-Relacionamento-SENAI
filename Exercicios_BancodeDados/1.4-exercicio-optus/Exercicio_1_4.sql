CREATE DATABASE Exercicio_1_4_Manha;

USE Exercicio_1_4_Manha;

CREATE TABLE Usuario
(
IdUsuario INT PRIMARY KEY IDENTITY ,
Nome VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Senha VARCHAR(15) NOT NULL,
Administrador BIT NOT NULL
);

CREATE TABLE Artista
(
IdArtista INT PRIMARY KEY IDENTITY,
Nome VARCHAR(25) NOT NULL
);

CREATE TABLE Album
(
IdAlbum INT PRIMARY KEY IDENTITY,
IdArtista INT FOREIGN KEY REFERENCES Artista(IdArtista) NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
Titulo VARCHAR(25) NOT NULL,
Minutos VARCHAR(8) NOT NULL,
Localizacao VARCHAR(50) NOT NULL,
AnoLancamento VARCHAR(4) NOT NULL,
Ativo BIT NOT NULL,
);


CREATE TABLE Estilo
(
IdEstilo INT PRIMARY KEY IDENTITY,
Nome VARCHAR(50) NOT NULL
);

CREATE TABLE AlbunsEstilo
(
IdAlbunsEstilo INT PRIMARY KEY IDENTITY,
IdAlbum INT FOREIGN KEY REFERENCES Album(IdAlbum) NOT NULL,
IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo) NOT NULL
);
 
INSERT INTO Usuario(Nome,Email,Senha,Administrador)
VALUES 
('Gabriel','Gabriel@gmail.com','1234','1'),
('Carlos','Carlos@gmail.com','7875','0'),
('Rebeca','Rebeca@gmail.com','7554','1'),
('Carla','Carla@gmail.com','5678','0'),
('Antonio','Antonio@gmail.com','6457','0'),
('Elizabete','Elizabete@gmail.com','3456','0'),
('Gustavo','Gustavo@gmail.com','2345','1');

INSERT INTO Artista (Nome)
VALUES
('Drake'),
('Chris Brown'),
('Bruno Mars'),
('50 Cent'),
('Michael Jackson'),
('Iron Maiden'),
('ACDC'),
('Edguy');

INSERT INTO Estilo(Nome)
VALUES
('Black'),
('Rock'),
('Metal'),
('POP'),
('Reggae'),
('Funk');

INSERT INTO Album(IdArtista,Titulo,Minutos,Localizacao,AnoLancamento,Ativo)
VALUES
('1','Thank Me Later','1200','Canada','2010','1'),
('1','So Far Gone','1110','Canada','2009','0'),
('2','Chris Brown','250','Estados Unidos','2005','1'),
('2','Royalty','550','Estados Unidos','2015','1'),
('3','24K Magic','213','Estados Unidos','2016','1'), 
('4','The Lost Tape','1123','Estados Unidos','2012','1'),
('5','Thriller','333','Estados Unidos','1982','1'),
('6','Fear Of The Dark','567','Estados Unidos','1992','1'),
('7','Back In Black','534','Estados Unidos','1980','1'),
('8','Rocket Ride','190','Alemanha','2006','1');

INSERT INTO AlbunsEstilo(IdAlbum,IdEstilo)
VALUES
('1','1'),
('2','1'),
('3','1'),
('4','1'),
('5','6'),
('5','5'),
('5','4'),
('6','1'),
('7','4'),
('8','2'),
('8','3'),
('9','2'),
('9','3'),
('10','2'),
('10','3');

--- listar todos os álbuns ativos, mostrando o nome do artista e os estilos do álbum 
SELECT * FROM Album
WHERE Ativo = 1;

-- listar os dados de um usuário através do e-mail e senha
SELECT * FROM Usuario
WHERE Email = 'Gabriel@gmail.com' AND Senha = '1234';



--- listar todos os álbuns lançados após o um determinado ano de lançamento
SELECT * FROM Album
WHERE AnoLancamento > '2010';

--- listar todos os usuários administradores, sem exibir suas senhas

SELECT IdUsuario, Nome, Email, Administrador
FROM Usuario
WHERE Administrador = 1;

