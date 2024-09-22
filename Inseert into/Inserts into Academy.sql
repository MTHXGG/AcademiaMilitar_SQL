-- Inserção de Dados

-- Inserir cadetes
INSERT INTO Cadetes (nome, idade, patente, data_ingresso)
VALUES ('Carlos Silva', 21, 'Soldado', '2022-01-15'),
       ('João Souza', 23, 'Cabo', '2021-03-10'),
       ('Mariana Oliveira', 22, 'Sargento', '2020-06-05');
       
-- Inserir instrutores
INSERT INTO Instrutores (nome, especialidade, patente)
VALUES ('Capitão Alberto', 'Tática Militar', 'Capitão'),
       ('Tenente Fernanda', 'Treinamento Físico', 'Tenente'),
       ('Major Lucas', 'Logística Militar', 'Major');

-- Inserir Cursos
INSERT INTO Cursos (nome_curso, duracao_weeks, id_instrutor)
VALUES ('Estratégia Militar', 12, 1),
       ('Comunicações de Campo', 8, 2),
       ('Logística e Suprimento', 6, 3);

-- Inserir treinamentos
INSERT INTO Treinamentos (nome_treinamento, duracao_days, id_instrutor)
VALUES ('Treinamento de Sobrevivência', 30, 1),
       ('Treinamento Físico Avançado', 15, 2),
       ('Treinamento de Logística', 20, 3);

-- Inserir cadetes em turmas

-- Carlos Silva no curso de Estratégia Militar
INSERT INTO Turmas (id_cadete, id_curso, id_treinamento)
VALUES (1, 1, NULL);

-- João Souza no Treinamento Físico Avançado
INSERT INTO Turmas (id_cadete, id_curso, id_treinamento)
VALUES (2, NULL, 2);

-- Mariana Oliveira no curso de Logística e Suprimento
INSERT INTO Turmas (id_cadete, id_curso, id_treinamento)
VALUES (3, 3, NULL);


-- Consultas

-- Listar cadetes com suas patentes e datas de ingresso
SELECT nome, patente, data_ingresso FROM Cadetes;

-- Listar todos os cursos com o nome do instrutor responsável
SELECT Cursos.nome_curso, Instrutores.nome
FROM Cursos
JOIN Instrutores ON Cursos.id_instrutor = Instrutores.id_instrutor;

-- Listar cadetes e os cursos ou treinamentos em que estão inscritos
SELECT Cadetes.nome, Cursos.nome_curso, Treinamentos.nome_treinamento
FROM Turmas
LEFT JOIN Cadetes ON Turmas.id_cadete = Cadetes.id_cadete
LEFT JOIN Cursos ON Turmas.id_curso = Cursos.id_curso
LEFT JOIN Treinamentos ON Turmas.id_treinamento = Treinamentos.id_treinamento;