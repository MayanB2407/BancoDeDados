USE OFICINA;

CREATE DATAbase oficina;

create table empresa(

    idEmpresa int NOT NULL auto_increment primary key,
    nomeEmpresa varchar(120) NOT NULL,
    tipo varchar(45)
    
    );
    
create index idx_idempresa_id on Empresa(idEmpresa);
    
create table departamento(
 
  idDepartamento int NOT NULL auto_increment primary key,
  nomeDepartamento varchar(45) NOT NULL,
  descricaoDepartamento varchar(100) NOT NULL,
  idEmpresa int NOT NULL,
  constraint fk_idEmpresa_departamento foreign key(idEmpresa)
  references Empresa(idEmpresa)
  
  );
  
create index idx_iddepartamento_id on Departamento(idDepartamento);
  
create table endereco(

  idEndereco int NOT NULL auto_increment primary key,
  pais varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  cidade varchar(50) NOT NULL,
  bairro varchar(50) NOT NULL,
  rua varchar(100) NOT NULL
  
  );
  
create index idx_idendereco_id on Endereco(idEndereco);
  
create table cliente(
   
   idCliente int NOT NULL auto_increment primary key,
   nomeCliente varchar(120) NOT NULL,
   cpfCliente varchar(11) NOT NULL,
   idEndereco int NOT NULL,
   constraint fk_idEndereco_cliente foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create index idx_idCliente_id on Cliente(idCliente);
   
create table funcionario(
   
   idFuncionario int NOT NULL auto_increment primary key,
   nomeFuncionario varchar(120) NOT NULL,
   cpfFuncionario varchar(11) NOT NULL,
   idEndereco int NOT NULL,
   idDepartamento int NOT NULL,
   constraint fk_idDepartamento_funcionario foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idEndereco_funcionario foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
create index idx_idfuncionario_id on Funcionario(idFuncionario);
  
create table telefone(

  idTelefone int NOT NULL auto_increment primary key,
  operadora varchar(50) NOT NULL,
  numero varchar(13) NOT NULL,
  idFuncionario int,
  idCliente int,
  constraint fk_idFuncionario_Telefone foreign key(idFuncionario)
  references Funcionario(idFuncionario),
  constraint fk_idCliente_Telefone foreign key(idCliente)
  references Cliente(idCliente)
  );
  
create index idx_idtelefone_id on Telefone(idTelefone);
   
  
create table OS(
   
   idOS int NOT NULL auto_increment primary key,
   dataSolicitacao varchar(10) NOT NULL,
   dataPrevisao varchar(10) NOT NULL,
   resposta varchar(45) NOT NULL,
   idFuncionario int NOT NULL,
   idDepartamento int NOT NULL,
   idCliente int NOT NULL,
   constraint fk_idFuncionario_OS foreign key(idFuncionario)
   references Funcionario(idFuncionario),
   constraint fk_idDepartamento_OS foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idCliente_OS foreign key(idCliente)
   references Cliente(idCliente)
   
  
  );
  
create index idx_idOS_id on OS(idOS);
  
create table servico(
   
   idServico int NOT NULL auto_increment primary key,
   nomeServico varchar(120) NOT NULL,
   recursos varchar(200) NOT NULL
   
   );
   
create index idx_idServico_id on Servico(idServico);
   
create table itens_OS(


    idOS int NOT NULL,
    idServico int NOT NULL,
    constraint fk_idOS_itens foreign key(idOS)
    references OS(idOS),
    constraint fk_idServico_itens foreign key(idServico)
    references Servico(idServico),
    primary key(idOS, idServico)
    
    );
    
create index idx_idOS_id on Itens_OS(idOS);
create index idx_idservico_id on Itens_OS(idServico);



									-- VALUES --


INSERT INTO empresa (idEmpresa, nomeEmpresa, tipo) values (1, "PlanosCia", "Ar");
INSERT INTO departamento (idDepartamento, nomeDepartamento, descricaoDepartamento, idEmpresa) values (1, "Planos", "Reserve seus planos", 1);
INSERT INTO endereco (idEndereco, pais, estado, cidade, bairro, rua) values (1, "Brasil", "Bahia", "Salvador", "Limoeiro", "Rua do pão");
INSERT INTO endereco (idEndereco, pais, estado, cidade, bairro, rua) values (2, "Brasil", "São Paulo", "São Paulo", "Macieira", "Rua do grão");
INSERT INTO cliente (idCliente, nomeCliente, cpfCliente, idEndereco) values (1, "Juninho", "111.111.111-11", 1);
INSERT INTO funcionario (idFuncionario, nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values (1, "Rogério", "222.222.222-22", 2, 1);
INSERT INTO telefone (operadora, numero, idCliente) values ("oi", "1111-1111", 1);
INSERT INTO OS (idOS, dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values (1, "1/2/2009", "18/9/3021", "não", 1, 1, 1);
INSERT INTO servico (idServico, nomeServico, recursos) values (1, "Planos para tu", "coisas");
INSERT INTO itens_OS (idOS, idServico) values (1, 1);

UPDATE cliente set nomeCliente = "Jota" WHERE idCliente = 1;

INSERT INTO Departamento (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("dolor. Nulla","neque. Sed eget lacus.",1),
  ("vitae semper","erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.",1),
  ("consequat nec,","eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit",1),
  ("molestie sodales.","Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,",1),
  ("Donec est","sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer",1),
  ("Etiam imperdiet","felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.",1),
  ("at fringilla","elementum, lorem ut aliquam iaculis, lacus pede sagittis augue,",1),
  ("egestas hendrerit","diam eu dolor egestas rhoncus. Proin",1),
  ("facilisis non,","sed dictum eleifend, nunc risus varius orci, in consequat",1),
  ("libero et","scelerisque neque sed sem egestas blandit. Nam",1);
  
INSERT INTO funcionario (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento)
VALUES
  ("vitae, erat.","774.002.457-22",2,7),
  ("molestie. Sed","549.404.144-28",3,8),
  ("Nullam suscipit,","148.328.822-65",4,3),
  ("facilisis lorem","504.401.078-02",5,5),
  ("erat eget","757.984.348-80",6,4);


SELECT max(idDepartamento) FROM departamento;

SELECT count(idCliente) FROM cliente;
