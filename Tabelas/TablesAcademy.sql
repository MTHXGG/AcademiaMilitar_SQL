CREATE TABLE Cadetes (
    id_cadete INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada cadete
    nome VARCHAR(100) NOT NULL,  -- Nome completo do cadete
    idade INT NOT NULL,  -- Idade do cadete
    patente VARCHAR(50) NOT NULL,  -- Patente do cadete
    data_ingresso DATE NOT NULL  -- Data de ingresso na academia militar
);

CREATE TABLE Instrutores (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada instrutor
    nome VARCHAR(100) NOT NULL,  -- Nome completo do instrutor
    especialidade VARCHAR(100) NOT NULL,  -- Especialidade do instrutor
    patente VARCHAR(50) NOT NULL  -- Patente do instrutor
);

CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada curso
    nome_curso VARCHAR(100) NOT NULL,  -- Nome do curso
    duracao_weeks INT NOT NULL,  -- Duração do curso em semanas
    id_instrutor INT,  -- Chave estrangeira para o instrutor responsável
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor)  -- Relaciona o curso ao instrutor
);

CREATE TABLE Treinamentos (
    id_treinamento INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada treinamento
    nome_treinamento VARCHAR(100) NOT NULL,  -- Nome do treinamento
    duracao_days INT NOT NULL,  -- Duração do treinamento em dias
    id_instrutor INT,  -- Chave estrangeira para o instrutor responsável
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor)  -- Relaciona o treinamento ao instrutor
);

CREATE TABLE Turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada turma
    id_cadete INT,  -- Chave estrangeira para o cadete inscrito
    id_curso INT NULL,  -- Chave estrangeira para o curso, caso seja curso
    id_treinamento INT NULL,  -- Chave estrangeira para o treinamento, caso seja treinamento
    FOREIGN KEY (id_cadete) REFERENCES Cadetes(id_cadete),  -- Relaciona a turma ao cadete
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),  -- Relaciona a turma ao curso
    FOREIGN KEY (id_treinamento) REFERENCES Treinamentos(id_treinamento)  -- Relaciona a turma ao treinamento
);