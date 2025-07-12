-- Projeto: Locadora de Veículos
-- Desenvolvido por: Pedro Feld
-- Descrição: Projeto universitário para a disciplina de Banco de Dados na Uninter

-- Criação das tabelas
CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE Pagamento (
	idPagamento INT PRIMARY KEY NOT NULL,
    forma ENUM('Cartão', 'Pix', 'Dinheiro') NOT NULL,
    dataPagamento DATE NOT NULL,
    valorTotal DECIMAL(7,2) NOT NULL,
    estado ENUM('Pago', 'Pendente') NOT NULL
);

CREATE TABLE Veiculo (
	idVeiculo INT PRIMARY KEY NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    valorDiaria DECIMAL(7,2) NOT NULL,
    estado ENUM('Disponível', 'Alugado', 'Manutenção') NOT NULL
);

CREATE TABLE Locacao (
	idLocacao INT PRIMARY KEY NOT NULL,
    idCliente INT NOT NULL,
    idPagamento INT NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Manutencao (
	idManutencao INT PRIMARY KEY NOT NULL,
    idVeiculo INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    dataManutencao DATE NOT NULL,
    custo DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Entidade associativa
CREATE TABLE LocacaoVeiculo (
	idLocacao INT NOT NULL,
    idVeiculo INT NOT NULL,
    PRIMARY KEY (idLocacao, idVeiculo),
    FOREIGN KEY (idLocacao) REFERENCES Locacao(idLocacao),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);