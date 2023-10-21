/* tattoo-service-logico: */

CREATE TABLE Colaborador (
    id_colaborador INTEGER PRIMARY KEY ,
    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(30) NOT NULL,
    redeSocial VARCHAR(30) NOT NULL
);

CREATE TABLE Administrador (
    fpk_Administrador INTEGER PRIMARY
);

CREATE TABLE Tatuador (
    id_fpk_Tatuador INTEGER PRIMARY KEY
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(30) NOT NULL,
    redeSocial VARCHAR(30) NOT NULL
);

CREATE TABLE Procedimento (
    id_procedimento INTEGER PRIMARY KEY,
    data_agendamento DATE NOT NULL,
    valor_cobrado DOUBLE NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    fk_Tatuador INTEGER NOT NULL,
    fk_Cliente INTEGER NOT NULL,
    fk_Agendador INTEGER NOT NULL
);

CREATE TABLE Material (
    id_material INTEGER PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unidade DOUBLE NOT NULL,
    data_compra DATE NOT NULL,
    fk_Procedimento INTEGER NOT NULL,
    fk_Comprador INTEGER NOT NULL
);

CREATE TABLE ficha_anamnese (
    id INTEGER PRIMARY KEY,
    assinatura BOOLEAN NOT NULL,
    fk_cliente INTEGER NOT NULL,
    UNIQUE (id, assinatura)
);

CREATE TABLE doencas (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(70) NOT NULL,
    fk_ficha_anamnese INTEGER NOT NULL
);

CREATE TABLE alergias (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(70) NOT NULL,
    fk_ficha_anamnese INTEGER NOT NULL
);

CREATE TABLE medicacoes (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(70) NOT NULL,
    fk_ficha_anamnese INTEGER NOT NULL
);

CREATE TABLE telefone_colaborador (
    id INTEGER PRIMARY KEY,
    id_colaborador INTEGER NOT NULL,
    numero VARCHAR(13) NOT NULL
);

CREATE TABLE telefone_cliente (
    id INTEGER PRIMARY KEY,
    fk_cliente_telefone INTEGER NOT NULL,
    numero VARCHAR(13) NOT NULL
);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (fpk_Administrador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Tatuador ADD CONSTRAINT FK_Tatuador_2
    FOREIGN KEY (id_fpk_Tatuador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_fichaAnamnese)
    REFERENCES ficha_anamnese (id);
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_2
    FOREIGN KEY (fk_Tatuador)
    REFERENCES Tatuador (id_fpk_Tatuador)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_3
    FOREIGN KEY (fk_Cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_4
    FOREIGN KEY (fk_Agendador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Material ADD CONSTRAINT FK_Material_2
    FOREIGN KEY (fk_Procedimento)
    REFERENCES Procedimento (id_procedimento)
    ON DELETE CASCADE;
 
ALTER TABLE Material ADD CONSTRAINT FK_Material_3
    FOREIGN KEY (fk_Comprador)
    REFERENCES Administrador (fpk_Administrador)
    ON DELETE CASCADE;
 
ALTER TABLE ficha_anamnese ADD CONSTRAINT FK_ficha_anamnese_3
    FOREIGN KEY (fk_cliente, Campo???)
    REFERENCES Cliente (id_cliente, ???);
 
ALTER TABLE doencas ADD CONSTRAINT FK_doencas_2
    FOREIGN KEY (fk_ficha_anamnese)
    REFERENCES ficha_anamnese (id);
 
ALTER TABLE alergias ADD CONSTRAINT FK_alergias_2
    FOREIGN KEY (fk_ficha_anamnese)
    REFERENCES ficha_anamnese (id);
 
ALTER TABLE medicacoes ADD CONSTRAINT FK_medicacoes_2
    FOREIGN KEY (fk_ficha_anamnese)
    REFERENCES ficha_anamnese (id);
 
ALTER TABLE telefone_colaborador ADD CONSTRAINT FK_telefone_colaborador_2
    FOREIGN KEY (id_colaborador)
    REFERENCES Colaborador (id_colaborador);
 
ALTER TABLE telefone_cliente ADD CONSTRAINT FK_telefone_cliente_2
    FOREIGN KEY (fk_cliente_telefone)
    REFERENCES Cliente (id_cliente);