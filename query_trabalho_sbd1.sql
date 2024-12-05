JPRAGMA foreign_keys = ON;

--Tabela Filial
CREATE TABLE Filial (
    CNPJ TEXT NOT NULL,
    CEP TEXT NOT NULL,
    Endereco TEXT NOT NULL,
    RazaoSocial TEXT NOT NULL,
    PRIMARY KEY (CNPJ)
);

--Tabela Consultor
CREATE TABLE Consultor (
    CPF TEXT NOT NULL,
    Nome TEXT NOT NULL,
    Telefone TEXT NOT NULL,
    Email TEXT NOT NULL,
    Especialidade TEXT NOT NULL,
    CNPJ TEXT NOT NULL,
    CPFGerente TEXT NOT NULL,
    PRIMARY KEY (CPF),
    FOREIGN KEY (CNPJ) REFERENCES Filial(CNPJ)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,
    FOREIGN KEY (CPF_Gerente) REFERENCES Consultor(CPF)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Assistente
CREATE TABLE Assistente (
    CPFConsultor TEXT PRIMARY KEY,
    Nome TEXT NOT NULL,
    FOREIGN KEY (CPFConsultor) REFERENCES Consultor(CPF)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE
);

--Tabela Cliente
CREATE TABLE Cliente (
    ID INTEGER NOT NULL,
    NomeRazaoSocial TEXT NOT NULL,
    Email TEXT,
    Endereco TEXT,
    Telefone TEXT,
    ValorInvestido REAL NOT NULL,
    Tipo TEXT NOT NULL,
    CPFConsultor TEXT NOT NULL,
    PRIMARY KEY (ID)
    FOREIGN KEY (CPFConsultor) REFERENCES Consultor(CPF)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Pessoa
CREATE TABLE Pessoa(
    ID INTEGER NOT NULL,
    CPF TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Cliente(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Empresa
CREATE TABLE Empresa(
    ID INTEGER NOT NULL,
    CNPJ TEXT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Cliente(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Investimento
CREATE TABLE Investimento(
    ID INTEGER NOT NULL,
    Nome TEXT NOT NULL,
    Risco TEXT NOT NULL,
    Rentabilidade TEXT NOT NULL,
    PRIMARY KEY (ID)
);

--Tabela Contrato
CREATE TABLE Contrato (
    Numero INTEGER NOT NULL,
    Data TEXT NOT NULL,
    Tipo TEXT NOT NULL,
     PRIMARY KEY (Numero)
);

--Tabela Relatorio
CREATE TABLE Relatorio (
    NumeroContrato INTEGER NOT NULL,
    DataRelatorio TEXT NOT NULL,
    Descricao TEXT NOT NULL,
    Status TEXT NOT NULL,
    PRIMARY KEY (NumeroContrato),
    FOREIGN KEY (NumeroContrato) REFERENCES Contrato(Numero)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Firmam
CREATE TABLE Firmam(
    CPFConsultor TEXT NOT NULL,
    IDCliente INTEGER NOT NULL,
    NumeroContrato INTEGER NOT NULL,
    PRIMARY KEY (CPFConsultor, IDCliente),
    FOREIGN KEY (CPFConsultor) REFERENCES Consultor(CPF)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (NumeroContrato) REFERENCES Contrato(Numero)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--Tabela Cliente_Investimento
CREATE TABLE Cliente_Investimento(
   IDCliente INTEGER NOT NULL,
   IDInvestimento INTEGER NOT NULL,
   PRIMARY KEY (IDCliente, IDInvestimento),
   FOREIGN KEY (IDCliente) REFERENCES Cliente(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
   FOREIGN KEY (IDInvestimento) REFERENCES Investimento(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE 
);

--Tabela Filial
INSERT INTO Filial(CNPJ, CEP, Endereco, RazaoSocial) VALUES
('12.345.678/0001-01', '01001-000', 'Avenida Paulista, 1578, São Paulo, SP', 'Filial Paulista Consultoria'),
('23.456.789/0001-02', '20040-020', 'Rua da Quitanda, 50, Centro, Rio de Janeiro, RJ', 'Filial Rio Centro'),
('34.567.890/0001-03', '30130-000', 'Praça Sete de Setembro, 200, Belo Horizonte, MG', 'Filial Minas Investimentos'),
('45.678.901/0001-04', '40020-300', 'Avenida Sete de Setembro, 1234, Salvador, BA', 'Filial Bahia Financeira'),
('56.789.012/0001-05', '60060-130', 'Rua Barão de Studart, 400, Fortaleza, CE', 'Filial Ceará Consultores'),
('67.890.123/0001-06', '70040-010', 'Setor Bancário Sul, Quadra 1, Brasília, DF', 'Filial Brasília Corporate'),
('78.901.234/0001-07', '80010-000', 'Rua XV de Novembro, 800, Curitiba, PR', 'Filial Curitiba Planejamento'),
('89.012.345/0001-08', '88010-400', 'Rua Felipe Schmidt, 555, Florianópolis, SC', 'Filial Floripa Consultoria'),
('90.123.456/0001-09', '90020-050', 'Avenida Borges de Medeiros, 202, Porto Alegre, RS', 'Filial Porto Alegre Investimentos'),
('01.234.567/0001-10', '50010-030', 'Avenida Conde da Boa Vista, 1200, Recife, PE', 'Filial Pernambuco Estratégia'),
('11.345.678/0001-11', '64000-500', 'Rua Coelho de Resende, 300, Teresina, PI', 'Filial Piauí Consultoria'),
('22.456.789/0001-12', '69010-020', 'Avenida Eduardo Ribeiro, 400, Manaus, AM', 'Filial Amazonas Planejamento'),
('33.567.890/0001-13', '66030-070', 'Avenida Nazaré, 220, Belém, PA', 'Filial Pará Corporate'),
('44.678.901/0001-14', '78050-000', 'Avenida Getúlio Vargas, 500, Cuiabá, MT', 'Filial Mato Grosso Financeira'),
('55.789.012/0001-15', '79020-200', 'Rua 13 de Maio, 300, Campo Grande, MS', 'Filial Mato Grosso do Sul Investimentos'),
('66.890.123/0001-16', '57020-110', 'Avenida Álvaro Otacílio, 1000, Maceió, AL', 'Filial Alagoas Consultoria'),
('77.901.234/0001-17', '58020-200', 'Rua Barão do Triunfo, 150, João Pessoa, PB', 'Filial Paraíba Planejamento'),
('88.012.345/0001-18', '59020-300', 'Avenida Hermes da Fonseca, 800, Natal, RN', 'Filial Rio Grande do Norte Consultores'),
('99.123.456/0001-19', '77020-400', 'Avenida JK, Quadra 104, Palmas, TO', 'Filial Tocantins Estratégica'),
('10.234.567/0001-20', '69310-000', 'Rua Cecília Brasil, 100, Boa Vista, RR', 'Filial Roraima Consultoria');

--Tabela Consultor
INSERT INTO Consultor(CPF, Nome, Telefone, Email, Especialidade, CNPJ, CPFGerente) VALUES
('532.421.860-50', 'Carlos Silva', '(11) 91234-5678', 'carlos.silva@consultoria.com', 'Investimentos', '12.345.678/0001-01', '532.421.860-50'),
('710.682.970-31', 'Ana Souza', '(21) 93456-7890', 'ana.souza@consultoria.com', 'Planejamento Financeiro', '23.456.789/0001-02', '710.682.970-31'),
('941.365.480-14', 'Marcos Oliveira', '(31) 98765-4321', 'marcos.oliveira@consultoria.com', 'Gestão de Riscos', '34.567.890/0001-03', '941.365.480-14'),
('123.456.789-09', 'Beatriz Lima', '(71) 91234-1111', 'beatriz.lima@consultoria.com', 'Consultoria Empresarial', '45.678.901/0001-04', '123.456.789-09'),
('789.654.321-00', 'Fernanda Costa', '(85) 99876-2222', 'fernanda.costa@consultoria.com', 'Investimentos', '56.789.012/0001-05', '789.654.321-00'),
('456.789.123-77', 'Rafael Almeida', '(61) 99654-3333', 'rafael.almeida@consultoria.com', 'Planejamento Financeiro', '67.890.123/0001-06', '456.789.123-77'),
('852.963.741-25', 'Cláudia Ferreira', '(41) 91234-4444', 'claudia.ferreira@consultoria.com', 'Consultoria Empresarial', '78.901.234/0001-07', '852.963.741-25'),
('951.753.852-10', 'Pedro Henrique', '(48) 99987-5555', 'pedro.henrique@consultoria.com', 'Gestão de Riscos', '89.012.345/0001-08', '951.753.852-10'),
('159.357.258-40', 'João Paulo', '(51) 91234-6666', 'joao.paulo@consultoria.com', 'Investimentos', '90.123.456/0001-09', '159.357.258-40'),
('753.951.852-62', 'Camila Rocha', '(81) 99876-7777', 'camila.rocha@consultoria.com', 'Planejamento Financeiro', '01.234.567/0001-10', '753.951.852-62'),
('123.789.456-33', 'Lucas Mendes', '(86) 93456-8888', 'lucas.mendes@consultoria.com', 'Gestão de Riscos', '11.345.678/0001-11', '123.789.456-33'),
('987.654.321-22', 'Isabela Nogueira', '(92) 98765-9999', 'isabela.nogueira@consultoria.com', 'Consultoria Empresarial', '22.456.789/0001-12', '987.654.321-22'),
('321.654.987-89', 'André Gomes', '(91) 91234-0000', 'andre.gomes@consultoria.com', 'Investimentos', '33.567.890/0001-13', '321.654.987-89'),
('654.123.987-45', 'Mariana Ribeiro', '(65) 99876-1111', 'mariana.ribeiro@consultoria.com', 'Planejamento Financeiro', '44.678.901/0001-14', '654.123.987-45'),
('987.321.654-36', 'Renato Alves', '(67) 93456-2222', 'renato.alves@consultoria.com', 'Gestão de Riscos', '55.789.012/0001-15', '987.321.654-36'),
('963.852.741-10', 'Gabriela Martins', '(82) 98765-3333', 'gabriela.martins@consultoria.com', 'Consultoria Empresarial', '66.890.123/0001-16', '963.852.741-10'),
('789.123.456-78', 'Tiago Santos', '(83) 91234-4444', 'tiago.santos@consultoria.com', 'Investimentos', '77.901.234/0001-17', '789.123.456-78'),
('456.987.123-55', 'Lara Carvalho', '(84) 99876-5555', 'lara.carvalho@consultoria.com', 'Planejamento Financeiro', '88.012.345/0001-18', '456.987.123-55'),
('123.987.456-88', 'Diego Santana', '(63) 93456-6666', 'diego.santana@consultoria.com', 'Gestão de Riscos', '99.123.456/0001-19', '123.987.456-88'),
('852.741.963-20', 'Natália Araújo', '(95) 98765-7777', 'natalia.araujo@consultoria.com', 'Consultoria Empresarial', '10.234.567/0001-20', '852.741.963-20'),
('951.852.753-10', 'Victor Neves', '(11) 91234-8888', 'victor.neves@consultoria.com', 'Investimentos', '12.345.678/0001-01', '951.852.753-10'),
('258.369.147-20', 'Patrícia Lopes', '(21) 99876-9999', 'patricia.lopes@consultoria.com', 'Planejamento Financeiro', '23.456.789/0001-02', '258.369.147-20'),
('147.258.369-11', 'Rodrigo Borges', '(31) 93456-0000', 'rodrigo.borges@consultoria.com', 'Gestão de Riscos', '34.567.890/0001-03', '147.258.369-11'),
('369.147.258-55', 'Carolina Teixeira', '(71) 98765-1111', 'carolina.teixeira@consultoria.com', 'Consultoria Empresarial', '45.678.901/0001-04', '369.147.258-55'),
('789.321.654-44', 'Eduardo Barros', '(85) 91234-2222', 'eduardo.barros@consultoria.com', 'Investimentos', '56.789.012/0001-05', '789.321.654-44');

--Tabela Assistente
INSERT INTO Assistente(CPFConsultor, Nome) VALUES
('710.682.970-31', 'Renata Azevedo'),
('941.365.480-14', 'Paulo César'),
('123.456.789-09', 'Juliana Andrade'),
('789.654.321-00', 'Mário Silva'),
('456.789.123-77', 'Tatiana Campos'),
('852.963.741-25', 'Vinícius Almeida'),
('951.753.852-10', 'Priscila Ferreira'),
('159.357.258-40', 'Fábio Lima'),
('753.951.852-62', 'Catarina Neves'),
('123.789.456-33', 'Eduardo Oliveira'),
('987.654.321-22', 'Aline Santos'),
('321.654.987-89', 'Marcelo Torres'),
('654.123.987-45', 'Isabel Vieira'),
('987.321.654-36', 'Cristiano Souza'),
('963.852.741-10', 'Marina Castro'),
('789.123.456-78', 'Rafaela Martins'),
('456.987.123-55', 'Rodrigo Costa'),
('123.987.456-88', 'Patrícia Alves'),
('852.741.963-20', 'Gustavo Andrade'),
('951.852.753-10', 'Lorena Pereira');

--Tabela Cliente
INSERT INTO Cliente(NomeRazaoSocial, Email, Endereco, Telefone, Tipo, CPFConsultor) VALUES
(1, 'João da Silva', 'joao.silva@email.com', 'Rua A, 123', '(11) 91234-5678', 10000.00, 'PF', '532.421.860-50'),
(2, 'Empresa Alfa Ltda.', 'contato@alfa.com.br', 'Av. Central, 123', '(11) 91234-5678', 50000.00, 'PJ', '123.789.456-33'),
(3, 'Maria Oliveira', 'maria.oliveira@email.com', 'Rua B, 456', '(21) 93456-7890', 25000.50, 'PF', '710.682.970-31'),
(4, 'Beta Serviços S.A.', 'contato@beta.com.br', 'Av. Sul, 456', '(21) 93456-7890', 75000.50, 'PJ', '710.682.970-31'),
(5, 'Carlos Pereira', 'carlos.pereira@email.com', 'Rua C, 789', '(31) 98765-4321', 18000.00, 'PF', '941.365.480-14'),
(6, 'Gama Comércio Ltda.', 'contato@gama.com.br', 'Av. Leste, 789', '(31) 98765-4321', 58000.00, 'PJ', '941.365.480-14'),
(7, 'Ana Santos', 'ana.santos@email.com', 'Rua D, 101', '(71) 91234-1111', 22000.75, 'PF', '123.456.789-09'),
(8, 'Delta Tech', 'contato@delta.com.br', 'Av. Oeste, 101', '(71) 91234-1111', 62000.75, 'PJ', '123.456.789-09'),
(9, 'Rafael Lima', 'rafael.lima@email.com', 'Rua E, 202', '(85) 99876-2222', 15000.00, 'PF', '789.654.321-00'),
(10, 'Epsilon Inc.', 'contato@epsilon.com.br', 'Av. Norte, 202', '(85) 99876-2222', 65000.00, 'PJ', '789.654.321-00'),
(11, 'Beatriz Souza', 'beatriz.souza@email.com', 'Rua F, 303', '(61) 99654-3333', 19500.00, 'PF', '456.789.123-77'),
(12, 'Zeta Consultoria', 'contato@zeta.com.br', 'Av. Primavera, 303', '(61) 99654-3333', 71000.00, 'PJ', '951.852.753-10'),
(13, 'Lucas Mendes', 'lucas.mendes@email.com', 'Rua G, 404', '(41) 91234-4444', 30000.00, 'PF', '852.963.741-25'),
(14, 'Eta Investimentos', 'contato@eta.com.br', 'Av. Outono, 404', '(41) 91234-4444', 89000.00, 'PJ', '852.963.741-25'),
(15, 'Juliana Costa', 'juliana.costa@email.com', 'Rua H, 505', '(48) 99987-5555', 28000.25, 'PF', '951.753.852-10'),
(16, 'Theta Financeira', 'contato@theta.com.br', 'Av. Inverno, 505', '(48) 99987-5555', 98000.25, 'PJ', '951.753.852-10'),
(17, 'Pedro Carvalho', 'pedro.carvalho@email.com', 'Rua I, 606', '(51) 91234-6666', 34000.00, 'PF', '159.357.258-40'),
(18, 'Iota Ltda.', 'contato@iota.com.br', 'Av. Verão, 606', '(51) 91234-6666', 77000.00, 'PJ', '159.357.258-40'),
(19, 'Aline Martins', 'aline.martins@email.com', 'Rua J, 707', '(81) 99876-7777', 21000.00, 'PF', '258.369.147-20'),
(20, 'Kappa Solutions', 'contato@kappa.com.br', 'Av. Futuro, 707', '(81) 99876-7777', 61000.00, 'PJ', '753.951.852-62'),
(21, 'Tiago Neves', 'tiago.neves@email.com', 'Rua K, 808', '(86) 93456-8888', 18000.00, 'PF', '123.789.456-33'),
(22, 'Lambda S.A.', 'contato@lambda.com.br', 'Av. Horizonte, 808', '(86) 93456-8888', 48000.00, 'PJ', '123.789.456-33'),
(23, 'Carla Nogueira', 'carla.nogueira@email.com', 'Rua L, 909', '(92) 98765-9999', 12500.00, 'PF', '987.654.321-22'),
(24, 'Mi Comércio', 'contato@mi.com.br', 'Av. Planalto, 909', '(92) 98765-9999', 52000.00, 'PJ', '987.654.321-22'),
(25, 'Marcelo Ribeiro', 'marcelo.ribeiro@email.com', 'Rua M, 1010', '(91) 91234-0000', 27000.00, 'PF', '321.654.987-89'),
(26, 'Nu Soluções', 'contato@nu.com.br', 'Av. Vale, 1010', '(91) 91234-0000', 53000.00, 'PJ', '321.654.987-89'),
(27, 'Isabela Andrade', 'isabela.andrade@email.com', 'Rua N, 1111', '(65) 99876-1111', 14500.00, 'PF', '369.147.258-55'),
(28, 'Omicron S.A.', 'contato@omicron.com.br', 'Av. Vitória, 1111', '(65) 99876-1111', 58000.00, 'PJ', '654.123.987-45'),
(29, 'Fernando Gomes', 'fernando.gomes@email.com', 'Rua O, 1212', '(67) 93456-2222', 23500.00, 'PF', '987.321.654-36'),
(30, 'Pi Serviços', 'contato@pi.com.br', 'Av. Alegria, 1212', '(67) 93456-2222', 59000.00, 'PJ', '987.321.654-36'),
(31, 'Rafaela Lopes', 'rafaela.lopes@email.com', 'Rua P, 1313', '(82) 98765-3333', 19000.00, 'PF', '963.852.741-10'),
(32, 'Rho Consultores', 'contato@rho.com.br', 'Av. Conquista, 1313', '(82) 98765-3333', 72000.00, 'PJ', '963.852.741-10'),
(33, 'Vinícius Almeida', 'vinicius.almeida@email.com', 'Rua Q, 1414', '(83) 91234-4444', 17000.00, 'PF', '789.123.456-78'),
(34, 'Sigma Ltda.', 'contato@sigma.com.br', 'Av. Horizonte, 1414', '(83) 91234-4444', 66000.00, 'PJ', '789.123.456-78'),
(35, 'Tatiana Vieira', 'tatiana.vieira@email.com', 'Rua R, 1515', '(84) 99876-5555', 25000.00, 'PF', '456.987.123-55'),
(36, 'Tau Financeira', 'contato@tau.com.br', 'Av. Centro, 1515', '(84) 99876-5555', 54000.00, 'PJ', '456.987.123-55'),
(37, 'Fábio Costa', 'fabio.costa@email.com', 'Rua S, 1616', '(63) 93456-6666', 23000.00, 'PF', '123.987.456-88'),
(38, 'Phi Corp.', 'contato@phi.com.br', 'Av. Empresarial, 1616', '(63) 93456-6666', 76000.00, 'PJ', '123.987.456-88'),
(39, 'Natália Ferreira', 'natalia.ferreira@email.com', 'Rua T, 1717', '(95) 98765-7777', 20000.00, 'PF', '852.741.963-20'),
(40, 'Psi Consultoria', 'contato@psi.com.br', 'Av. Excelência, 1717', '(95) 98765-7777', 81000.00, 'PJ', '789.321.654-44');

--Tabela Pessoa
INSERT INTO Pessoa(ID, CPF) VALUES
(1, '350.383.600-41'),
(3, '348.181.620-00'),
(5, '004.769.100-05'),
(7, '293.958.600-49'),
(9, '201.204.700-98'),
(11, '353.665.570-03'),
(13, '182.062.020-48'),
(15, '366.162.040-14'),
(17, '475.708.430-70'),
(19, '792.988.670-00'),
(21, '211.612.830-72'),
(23, '626.453.380-70'),
(25, '886.840.720-57'),
(27, '877.611.750-20'),
(29, '698.541.020-09'),
(31, '532.022.200-98'),
(33, '402.635.210-28'),
(35, '659.864.390-23'),
(37, '777.778.110-37'),
(39, '523.116.370-88');

--Tabela Empresa
INSERT INTO Empresa(ID, CNPJ) VALUES
(2, '12.345.678/0001-99'),
(4, '34.567.890/0001-12'),
(6, '45.678.901/0001-23'),
(8, '56.789.012/0001-34'),
(10, '67.890.123/0001-45'),
(12, '78.901.234/0001-56'),
(14, '89.012.345/0001-67'),
(16, '90.123.456/0001-78'),
(18, '23.234.345/0001-89'),
(20, '12.234.567/0001-90'),
(22, '23.345.678/0001-01'),
(24, '34.456.789/0001-12'),
(26, '45.567.890/0001-23'),
(28, '56.678.901/0001-34'),
(30, '67.789.012/0001-45'),
(32, '78.890.123/0001-56'),
(34, '89.901.234/0001-67'),
(36, '90.012.345/0001-78'),
(38, '21.234.567/0001-89'),
(40, '32.345.678/0001-90');

--Tabela Investimento
INSERT INTO Investimento(ID, Nome, Risco, Rentabilidade) VALUES
(1, 'CDB', 'baixo', '102% do CDI'),
(2, 'LCA', 'baixo', '100% do CDI'),
(3, 'LCI', 'baixo', '100% do CDI'),
(4, 'Tesouro Direto', 'médio', 'IPCA + taxa fixa'),
(5, 'Fundos Imobiliários', 'médio', 'Dividendos mensais'),
(6, 'Ações', 'alto', 'Valorização da empresa'),
(7, 'Fundos Multimercado', 'médio', 'Diversificação de ativos'),
(8, 'Previdência Privada', 'baixo a médio', 'Renda futura'),
(9, 'Fundos de Investimento em Ações', 'alto', 'Valorização das ações'),
(10, 'Fundos de Investimento em Renda Fixa', 'baixo', 'Renda fixa com prazo determinado'),
(11, 'Fundos de Investimento Conservador', 'baixo', 'Baixa volatilidade e segurança'),
(12, 'Fundos de Investimento Moderado', 'médio', 'Equilíbrio entre risco e retorno'),
(13, 'Fundos de Investimento Agressivo', 'alto', 'Alta volatilidade e potencial de retorno'),
(14, 'Debêntures', 'médio', 'Juros fixos ou variáveis'),
(15, 'Certificados de Recebíveis Imobiliários (CRI)', 'médio', 'Renda proveniente de recebíveis imobiliários'),
(16, 'Certificados de Recebíveis do Agronegócio (CRA)', 'médio', 'Renda proveniente de recebíveis do agronegócio'),
(17, 'Fundos de Investimento em ETF', 'baixo a alto', 'Rastreio de índices de mercado'),
(18, 'Fundos de Investimento em Commodities', 'médio a alto', 'Investimentos em commodities como ouro, petróleo, etc.'),
(19, 'Fundos de Investimento em Hedge Funds', 'alto', 'Estratégias complexas de investimento'),
(20, 'Fundos de Investimento em Private Equity', 'alto', 'Investimentos em empresas privadas com alto potencial de crescimento');

--Tabela Contrato
INSERT INTO Contrato(Numero, Data, Tipo) VALUES
(1001, '2023-11-21', 'Compra e Venda'),
(1002, '2021-12-05', 'Locação'),
(1003, '2023-11-15', 'Prestação de Serviços'),
(1004, '2024-10-28', 'Empréstimo'),
(1005, '2023-11-07', 'Doação'),
(1006, '2021-12-01', 'Alienação Fiduciária'),
(1007, '2024-11-18', 'Promessa de Compra e Venda'),
(1008, '2023-10-31', 'Contrato de Trabalho'),
(1009, '2022-11-12', 'Contrato de Seguro'),
(1010, '2020-12-03', 'Contrato de Franquia'),
(1011, '2023-11-25', 'Contrato de Transporte'),
(1012, '2022-10-29', 'Contrato de Representação Comercial'),
(1013, '2024-11-08', 'Contrato de Arrendamento Mercantil'),
(1014, '2024-12-02', 'Contrato de Consórcio'),
(1015, '2023-11-19', 'Contrato de Seguro de Vida'),
(1016, '2022-10-30', 'Contrato de Seguro de Automóvel'),
(1017, '2019-11-11', 'Contrato de Seguro Residencial'),
(1018, '2021-12-04', 'Contrato de Seguro Empresarial'),
(1019, '2023-11-26', 'Contrato de Seguro de Saúde'),
(1020, '2018-10-27', 'Contrato de Seguro de Viagem');
(1021, '2024-02-15', 'Contrato de Estágio'),
(1022, '2020-11-28', 'Contrato de Mandato'),
(1023, '2022-03-05', 'Contrato de Gestão'),
(1024, '2021-12-12', 'Contrato de Cessão de Direitos'),
(1025, '2024-01-18', 'Contrato de Compra e Venda de Imóvel'),
(1026, '2024-12-25', 'Contrato de Promessa de Doação'),
(1027, '2019-02-01', 'Contrato de Confissão de Dívida'),
(1028, '2023-11-30', 'Contrato de Fiança'),
(1029, '2018-03-10', 'Contrato de Mutuo'),
(1030, '2023-12-17', 'Contrato de Arrendamento'),
(1031, '2022-01-23', 'Contrato de Leasing'),
(1032, '2021-12-28', 'Contrato de Franchising'),
(1033, '2020-02-05', 'Contrato de Distributorship'),
(1034, '2023-11-03', 'Contrato de Joint Venture'),
(1035, '2024-03-15', 'Contrato de Licenciamento'),
(1036, '2020-12-22', 'Contrato de Cessão de Crédito'),
(1037, '2024-01-28', 'Contrato de Permuta'),
(1038, '2019-11-07', 'Contrato de Custódia'),
(1039, '2024-03-20', 'Contrato de Depósito'),
(1040, '2023-12-29', 'Contrato de Seguro de Responsabilidade Civil');

--Tabela Relatorio
INSERT INTO Relatorio(NumeroContrato, DataRelatorio, Descricao, Status) VALUES
(1001, '2023-11-22', 'Relatório sobre Compra e Venda', 'Ativo'),
(1002, '2021-12-06', 'Relatório sobre Locação', 'Inativo'),
(1003, '2023-11-16', 'Relatório sobre Prestação de Serviços', 'Ativo'),
(1004, '2024-10-29', 'Relatório sobre Empréstimo', 'Ativo'),
(1005, '2023-11-08', 'Relatório sobre Doação', 'Inativo'),
(1006, '2021-12-02', 'Relatório sobre Alienação Fiduciária', 'Ativo'),
(1007, '2024-11-19', 'Relatório sobre Promessa de Compra e Venda', 'Ativo'),
(1008, '2023-11-01', 'Relatório sobre Contrato de Trabalho', 'Inativo'),
(1009, '2022-11-13', 'Relatório sobre Contrato de Seguro', 'Ativo'),
(1010, '2020-12-04', 'Relatório sobre Contrato de Franquia', 'Inativo'),
(1011, '2023-11-26', 'Relatório sobre Contrato de Transporte', 'Ativo'),
(1012, '2022-10-30', 'Relatório sobre Contrato de Representação Comercial', 'Inativo'),
(1013, '2024-11-09', 'Relatório sobre Contrato de Arrendamento Mercantil', 'Ativo'),
(1014, '2024-12-03', 'Relatório sobre Contrato de Consórcio', 'Ativo'),
(1015, '2023-11-20', 'Relatório sobre Contrato de Seguro de Vida', 'Inativo'),
(1016, '2022-10-31', 'Relatório sobre Contrato de Seguro de Automóvel', 'Ativo'),
(1017, '2019-11-12', 'Relatório sobre Contrato de Seguro Residencial', 'Ativo'),
(1018, '2021-12-05', 'Relatório sobre Contrato de Seguro Empresarial', 'Ativo'),
(1019, '2023-11-27', 'Relatório sobre Contrato de Seguro de Saúde', 'Inativo'),
(1020, '2018-10-28', 'Relatório sobre Contrato de Seguro de Viagem', 'Ativo'),
(1021, '2024-02-16', 'Relatório sobre Contrato de Estágio', 'Ativo'),
(1022, '2023-11-29', 'Relatório sobre Contrato de Mandato', 'Inativo'),
(1023, '2024-03-06', 'Relatório sobre Contrato de Gestão', 'Ativo'),
(1024, '2023-12-13', 'Relatório sobre Contrato de Cessão de Direitos', 'Ativo'),
(1025, '2024-01-19', 'Relatório sobre Contrato de Compra e Venda de Imóvel', 'Ativo'),
(1026, '2023-12-26', 'Relatório sobre Contrato de Promessa de Doação', 'Inativo'),
(1027, '2024-02-02', 'Relatório sobre Contrato de Confissão de Dívida', 'Ativo'),
(1028, '2023-12-01', 'Relatório sobre Contrato de Fiança', 'Ativo'),
(1029, '2024-03-11', 'Relatório sobre Contrato de Mutuo', 'Ativo'),
(1030, '2023-12-18', 'Relatório sobre Contrato de Arrendamento', 'Inativo'),
(1031, '2024-01-24', 'Relatório sobre Contrato de Leasing', 'Ativo'),
(1032, '2023-12-29', 'Relatório sobre Contrato de Franchising', 'Ativo'),
(1033, '2024-02-06', 'Relatório sobre Contrato de Distributorship', 'Ativo'),
(1034, '2023-11-04', 'Relatório sobre Contrato de Joint Venture', 'Inativo'),
(1035, '2024-03-16', 'Relatório sobre Contrato de Licenciamento', 'Ativo'),
(1036, '2023-12-23', 'Relatório sobre Contrato de Cessão de Crédito', 'Inativo'),
(1037, '2024-01-29', 'Relatório sobre Contrato de Permuta', 'Ativo'),
(1038, '2023-11-08', 'Relatório sobre Contrato de Custódia', 'Ativo'),
(1039, '2024-03-21', 'Relatório sobre Contrato de Depósito', 'Ativo'),
(1040, '2023-12-30', 'Relatório sobre Contrato de Seguro de Responsabilidade Civil', 'Inativo');

--Tabela Firmam
INSERT INTO Firmam(CPFConsultor, IDCliente, NumeroContrato) VALUES
('532.421.860-50', 1, 1001),
('123.789.456-33', 2, 1002),
('710.682.970-31', 3, 1003),
('710.682.970-31', 4, 1004),
('941.365.480-14', 5, 1005),
('941.365.480-14', 6, 1006),
('123.456.789-09', 7, 1007),
('123.456.789-09', 8, 1008),
('789.654.321-00', 9, 1009),
('789.654.321-00', 10, 1010),
('456.789.123-77', 11, 1011),
('951.852.753-10', 12, 1012),
('852.963.741-25', 13, 1013),
('852.963.741-25', 14, 1014),
('951.753.852-10', 15, 1015),
('951.753.852-10', 16, 1016),
('159.357.258-40', 17, 1017),
('159.357.258-40', 18, 1018),
('258.369.147-20', 19, 1019),
('753.951.852-62', 20, 1020),
('123.789.456-33', 21, 1021),
('123.789.456-33', 22, 1022),
('987.654.321-22', 23, 1023),
('987.654.321-22', 24, 1024),
('321.654.987-89', 25, 1025),
('321.654.987-89', 26, 1026),
('369.147.258-55', 27, 1027),
('654.123.987-45', 28, 1028),
('987.321.654-36', 29, 1029),
('987.321.654-36', 30, 1030),
('963.852.741-10', 31, 1031),
('963.852.741-10', 32, 1032),
('789.123.456-78', 33, 1033),
('789.123.456-78', 34, 1034),
('456.987.123-55', 35, 1035),
('456.987.123-55', 36, 1036),
('123.987.456-88', 37, 1037),
('123.987.456-88', 38, 1038),
('852.741.963-20', 39, 1039),
('789.321.654-44', 40, 1040);

--Tabela Cliente_Investimento
INSERT INTO Cliente_Investimento(IDCliente, IDInvestimento) VALUES

;