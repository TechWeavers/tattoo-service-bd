/* tattoo-service-logico: */

CREATE TABLE Colaborador (
    id_colaborador INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(30),
    redeSocial VARCHAR(30)
);

CREATE TABLE Administrador (
    fpk_Administrador INTEGER PRIMARY KEY
);

CREATE TABLE Tatuador (
    fpk_Tatuador INTEGER PRIMARY KEY
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(30),
    redeSocial VARCHAR(30),
    fichaAnamnese VARCHAR
);

CREATE TABLE Procedimento (
    id_procedimento INTEGER PRIMARY KEY,
    data_agendamento DATE,
    valor_cobrado DOUBLE,
    fk_Tatuador INTEGER,
    fk_Cliente INTEGER,
    fk_Agendador INTEGER
);

CREATE TABLE Material (
    id_material INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    quantidade INTEGER,
    valor_unidade DOUBLE,
    data_compra DATE,
    fk_Procedimento INTEGER,
    fk_Comprador INTEGER
);
 
ALTER TABLE Administrador ADD CONSTRAINT FK_Administrador_2
    FOREIGN KEY (fpk_Administrador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Tatuador ADD CONSTRAINT FK_Tatuador_2
    FOREIGN KEY (fpk_Tatuador)
    REFERENCES Colaborador (id_colaborador)
    ON DELETE CASCADE;
 
ALTER TABLE Procedimento ADD CONSTRAINT FK_Procedimento_2
    FOREIGN KEY (fk_Tatuador)
    REFERENCES Tatuador (fpk_Tatuador)
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