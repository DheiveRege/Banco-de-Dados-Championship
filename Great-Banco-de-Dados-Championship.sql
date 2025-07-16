
CREATE TABLE grupos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE jogadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_grupo INT,
    FOREIGN KEY (id_grupo) REFERENCES grupos(id)
);

CREATE TABLE jogos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_jogador INT,
    id_jogo INT,
    pontuacao INT,
    data_partida DATE,
    FOREIGN KEY (id_jogador) REFERENCES jogadores(id),
    FOREIGN KEY (id_jogo) REFERENCES jogos(id)
);

INSERT INTO grupos (nome) VALUES
('Time Nepal'),
('Time Enner Valência'),
('Time Smurfs'),
('Time Capivaras Assassinas');

INSERT INTO jogadores (nome, id_grupo) VALUES
('Bruno Carvalho', 1),
('Bruno Henrique', 1),
('Angelo Cuiato', 1),
('Brunna', 1),
('Dave', 1),

('Guilherme', 2),
('Arthur', 2),
('Pedro', 2),
('Heitor', 2),
('Leonardo', 2),

('Kaua', 3),
('Gregori', 3),
('Ederson', 3),
('Davis', 3),
('Athos', 3),

('Ana', 4),
('Luisa', 4),
('Gabriel', 4),
('Eduardo', 4),
('Robson', 4);


INSERT INTO jogos (nome) VALUES
('Ping-Pong'),
('Uno'),
('Dama'),
('Pife'),
('Xadrez');

INSERT INTO partidas (id_jogador, id_jogo, Pontuacao, data_partida) VALUES
(1, 1, 10, '2025-07-14'),
(14, 1, 8, '2025-07-14'),
(7, 1, 6, '2025-07-14'),
(18, 1, 4, '2025-07-14');

INSERT INTO partidas (id_jogador, id_jogo, Pontuacao, data_partida) VALUES
(5, 5, 10, '2025-07-14'),
(6, 5, 8, '2025-07-14'),
(13, 5, 6, '2025-07-14'),
(19, 5, 4, '2025-07-14');

INSERT INTO partidas (id_jogador, id_jogo, Pontuacao, data_partida) VALUES
(11, 3, 10, '2025-07-14'),
(9, 3, 8, '2025-07-14'),
(3, 3, 6, '2025-07-14'),
(16, 3, 4, '2025-07-14');

INSERT INTO partidas (id_jogador, id_jogo, Pontuacao, data_partida) VALUES
(10, 2, 10, '2025-07-14'),
(2, 2, 8, '2025-07-14'),
(15, 2, 6, '2025-07-14'),
(17, 2, 4, '2025-07-14');

INSERT INTO partidas (id_jogador, id_jogo, Pontuacao, data_partida) VALUES
(20, 4, 10, '2025-07-14'),
(4, 4, 8, '2025-07-14'),
(12, 4, 6, '2025-07-14'),
(8, 4, 4, '2025-07-14');

SELECT 
    jogadores.id AS Numero_jogador, 
    jogadores.nome AS nome_jogador,
    grupos.id AS Numero_grupo, 
    grupos.nome AS nome_grupo
FROM jogadores
INNER JOIN grupos ON jogadores.id_grupo = grupos.id;

SELECT 
	jogadores.id AS Numero_jogador,
	jogadores.nome AS jogador,
    jogos.nome AS Nome_jogo,
    partidas.pontuacao AS Pontuacao
FROM partidas 
INNER JOIN jogadores ON partidas.id_jogador = jogadores.id
INNER JOIN jogos ON partidas.id_jogo = jogos.id;

SELECT 
	grupos.id AS Posicao,
    grupos.nome AS grupo,
    SUM(partidas.pontuacao) AS soma_pontuacao
FROM partidas
JOIN jogadores ON partidas.id_jogador = jogadores.id
JOIN grupos ON jogadores.id_grupo = grupos.id
GROUP BY grupos.id
ORDER BY soma_pontuacao DESC;

SELECT
        jogos.nome AS jogo,
        jogadores.nome AS campeoes,
        partidas.pontuacao
FROM partidas
INNER JOIN jogos ON partidas.id_jogo = jogos.id
INNER JOIN jogadores ON partidas.id_jogador = jogadores.id
WHERE partidas.pontuacao = 10;



SELECT 
    grupos.nome AS grupo,
    AVG(partidas.pontuacao) AS Media,
    MAX(partidas.pontuacao) AS Maior_pontuacao,
    MIN(partidas.pontuacao) AS Menor_pontuacao
FROM partidas
JOIN jogadores ON partidas.id_jogador = jogadores.id
JOIN grupos ON jogadores.id_grupo = grupos.id
GROUP BY grupos.nome
ORDER BY MEdia ASC;