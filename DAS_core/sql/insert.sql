/*
BEGIN;
USE das_db;

CREATE TABLE `telefone` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `numero` varchar(200) NOT NULL,
    `tipo` varchar(3) NOT NULL
)
;
CREATE TABLE `endereco` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `rua` varchar(200) NOT NULL,
    `complemento` varchar(200),
    `cep` varchar(200) NOT NULL,
    `bairro` varchar(200),
    `cidade` varchar(200) NOT NULL,
    `estado` varchar(200) NOT NULL
)
;
CREATE TABLE `horario` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `dia` varchar(3) NOT NULL,
    `horario` varchar(5) NOT NULL
)
;
CREATE TABLE `periodo` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `periodo` varchar(10) NOT NULL
)
;
CREATE TABLE `disciplina` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `nome` varchar(200) NOT NULL,
    `cod` varchar(20) NOT NULL
)
;
CREATE TABLE `curso_disciplina` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `curso_id` integer NOT NULL,
    `disciplina_id` integer NOT NULL,
    UNIQUE (`curso_id`, `disciplina_id`)
)
;
ALTER TABLE `curso_disciplina` ADD CONSTRAINT `disciplina_id_refs_id_2a60018b` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`);
CREATE TABLE `curso` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `nome` varchar(200) NOT NULL,
    `cod` varchar(20) NOT NULL
)
;
ALTER TABLE `curso_disciplina` ADD CONSTRAINT `curso_id_refs_id_089af601` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);
CREATE TABLE `aluno_disciplinas` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `aluno_id` integer NOT NULL,
    `disciplina_id` integer NOT NULL,
    UNIQUE (`aluno_id`, `disciplina_id`)
)
;
ALTER TABLE `aluno_disciplinas` ADD CONSTRAINT `disciplina_id_refs_id_65a71941` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`);
CREATE TABLE `aluno` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `nome` varchar(200) NOT NULL,
    `email` varchar(200) NOT NULL,
    `endereco_id` integer NOT NULL UNIQUE,
    `telefone_id` integer NOT NULL,
    `matricula` varchar(30) NOT NULL,
    `curso_id` integer NOT NULL,
    `data_ingresso` date NOT NULL
)
;
ALTER TABLE `aluno` ADD CONSTRAINT `curso_id_refs_id_a3724184` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);
ALTER TABLE `aluno` ADD CONSTRAINT `telefone_id_refs_id_6443a77f` FOREIGN KEY (`telefone_id`) REFERENCES `telefone` (`id`);
ALTER TABLE `aluno` ADD CONSTRAINT `endereco_id_refs_id_709caeba` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`);
ALTER TABLE `aluno_disciplinas` ADD CONSTRAINT `aluno_id_refs_id_5bf38d40` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);
CREATE TABLE `professor` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `nome` varchar(200) NOT NULL,
    `email` varchar(200) NOT NULL,
    `endereco_id` integer NOT NULL UNIQUE,
    `telefone_id` integer NOT NULL,
    `matricula` varchar(30) NOT NULL,
    `tipo_contrato` varchar(200) NOT NULL,
    `data_contratacao` date NOT NULL,
    `data_recisao` date
)
;
ALTER TABLE `professor` ADD CONSTRAINT `telefone_id_refs_id_b2839773` FOREIGN KEY (`telefone_id`) REFERENCES `telefone` (`id`);
ALTER TABLE `professor` ADD CONSTRAINT `endereco_id_refs_id_262747e0` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`);
CREATE TABLE `unidade` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `label` varchar(3) NOT NULL
)
;
CREATE TABLE `noticia` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `titulo` varchar(200) NOT NULL,
    `corpo` varchar(900) NOT NULL,
    `data_noticia` date NOT NULL
)
;
CREATE TABLE `arquivo` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `titulo_arquivo` varchar(200) NOT NULL,
    `descricao_arquivo` varchar(200),
    `arquivo` varchar(100) NOT NULL
)
;
CREATE TABLE `turma_alunos` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `turma_id` integer NOT NULL,
    `aluno_id` integer NOT NULL,
    UNIQUE (`turma_id`, `aluno_id`)
)
;
ALTER TABLE `turma_alunos` ADD CONSTRAINT `aluno_id_refs_id_3216f867` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);
CREATE TABLE `turma_professor` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `turma_id` integer NOT NULL,
    `professor_id` integer NOT NULL,
    UNIQUE (`turma_id`, `professor_id`)
)
;
ALTER TABLE `turma_professor` ADD CONSTRAINT `professor_id_refs_id_b0fae1b9` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`);
CREATE TABLE `turma_horario` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `turma_id` integer NOT NULL,
    `horario_id` integer NOT NULL,
    UNIQUE (`turma_id`, `horario_id`)
)
;
ALTER TABLE `turma_horario` ADD CONSTRAINT `horario_id_refs_id_1794ba13` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`);
CREATE TABLE `turma_arquivo` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `turma_id` integer NOT NULL,
    `arquivo_id` integer NOT NULL,
    UNIQUE (`turma_id`, `arquivo_id`)
)
;
ALTER TABLE `turma_arquivo` ADD CONSTRAINT `arquivo_id_refs_id_b912419c` FOREIGN KEY (`arquivo_id`) REFERENCES `arquivo` (`id`);
CREATE TABLE `turma_noticia` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `turma_id` integer NOT NULL,
    `noticia_id` integer NOT NULL,
    UNIQUE (`turma_id`, `noticia_id`)
)
;
ALTER TABLE `turma_noticia` ADD CONSTRAINT `noticia_id_refs_id_92c4d57b` FOREIGN KEY (`noticia_id`) REFERENCES `noticia` (`id`);
CREATE TABLE `turma` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `disciplina_id` integer NOT NULL UNIQUE,
    `nome` varchar(200) NOT NULL,
    `periodo_id` integer NOT NULL,
    `data_inicio` date NOT NULL,
    `data_termino` date NOT NULL,
    `qtd_aulas` integer NOT NULL,
    `qtd_alunos` integer NOT NULL
)
;
ALTER TABLE `turma` ADD CONSTRAINT `disciplina_id_refs_id_2b777eb1` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id`);
ALTER TABLE `turma` ADD CONSTRAINT `periodo_id_refs_id_10ce50a3` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`);
ALTER TABLE `turma_alunos` ADD CONSTRAINT `turma_id_refs_id_e62a9b25` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
ALTER TABLE `turma_professor` ADD CONSTRAINT `turma_id_refs_id_646204bc` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
ALTER TABLE `turma_horario` ADD CONSTRAINT `turma_id_refs_id_457a6045` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
ALTER TABLE `turma_arquivo` ADD CONSTRAINT `turma_id_refs_id_42de6b77` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
ALTER TABLE `turma_noticia` ADD CONSTRAINT `turma_id_refs_id_3305787f` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
CREATE TABLE `nota` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `valor` integer NOT NULL,
    `peso` integer NOT NULL,
    `aluno_id` integer NOT NULL,
    `turma_id` integer NOT NULL,
    `unidade_id` integer NOT NULL
)
;
ALTER TABLE `nota` ADD CONSTRAINT `aluno_id_refs_id_1f818807` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);
ALTER TABLE `nota` ADD CONSTRAINT `turma_id_refs_id_aeb76e15` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
ALTER TABLE `nota` ADD CONSTRAINT `unidade_id_refs_id_7de8a727` FOREIGN KEY (`unidade_id`) REFERENCES `unidade` (`id`);
CREATE TABLE `frequencia` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `aluno_id` integer NOT NULL,
    `turma_id` integer NOT NULL,
    `n_faltas` integer NOT NULL
)
;
ALTER TABLE `frequencia` ADD CONSTRAINT `aluno_id_refs_id_0cbda87a` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);
ALTER TABLE `frequencia` ADD CONSTRAINT `turma_id_refs_id_55b719a6` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);
COMMIT;*/
BEGIN;
USE das_db;
/*lmpando as tabelas*/
set foreign_key_checks=0;truncate  frequencia;
set foreign_key_checks=0;truncate  nota;
set foreign_key_checks=0;truncate  turma;
set foreign_key_checks=0;truncate  turma_noticia;
set foreign_key_checks=0;truncate  turma_horario;
set foreign_key_checks=0;truncate  turma_arquivo;
set foreign_key_checks=0;truncate  turma_professor;
set foreign_key_checks=0;truncate  arquivo;
set foreign_key_checks=0;truncate  noticia;
set foreign_key_checks=0;truncate  unidade;
set foreign_key_checks=0;truncate  professor;
set foreign_key_checks=0;truncate  aluno;
set foreign_key_checks=0;truncate  aluno_disciplinas;
set foreign_key_checks=0;truncate  curso;
set foreign_key_checks=0;truncate  curso_disciplina;
set foreign_key_checks=0;truncate  disciplina;
set foreign_key_checks=0;truncate  endereco;
set foreign_key_checks=0;truncate  horario;
set foreign_key_checks=0;truncate  periodo;
set foreign_key_checks=0;truncate  telefone;



insert into telefone(numero,tipo)values("9999-8888","CE");
insert into telefone(numero,tipo)values("9999-8822","CE");
insert into telefone(numero,tipo)values("9999-8118","CE");
insert into telefone(numero,tipo)values("9999-0909","CE");
insert into telefone(numero,tipo)values("9911-8888","CE");
insert into telefone(numero,tipo)values("9469-8822","CE");
insert into telefone(numero,tipo)values("2671-8118","TE");
insert into telefone(numero,tipo)values("2134-0909","TE");


insert into endereco(rua,cep,cidade,estado)values("Rua A","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua B","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua C","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua D","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua E","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua F","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua G","59300000","Caico","RN");
insert into endereco(rua,cep,cidade,estado)values("Rua H","59300000","Caico","RN");


insert into horario(dia,horario)values("Seg","M12");	
insert into horario(dia,horario)values("Ter","M34");
insert into horario(dia,horario)values("Qua","M12");


insert into periodo(periodo) values("2012.1");
insert into periodo(periodo) values("2012.2");

insert into curso(nome,cod) values("B. Sistemas de Informacao","BSI0");
insert into curso(nome,cod) values("Direito","DIR0");
insert into curso(nome,cod) values("Historia","HIS0");

insert into disciplina(nome,cod) values("Algoritmos","BSI001");
insert into disciplina(nome,cod) values("REDES","BSI002");
insert into disciplina(nome,cod) values("Eng. Software","BSI003");
insert into disciplina(nome,cod) values("Direito Básico I","DIR001");
insert into disciplina(nome,cod) values("Filosofia","DIR003");
insert into disciplina(nome,cod) values("História do RN","HIS003");

insert into curso_disciplina(curso_id,disciplina_id) values(1,1);
insert into curso_disciplina(curso_id,disciplina_id) values(1,2);
insert into curso_disciplina(curso_id,disciplina_id) values(1,3);


insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Eduardo","edu@mail.com",1,1,"201202222",1,"2012-01-01");
insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Jeferson","jef@mail.com",2,2,"201202223",1,"2012-01-01");
insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Abelardo","abel@mail.com",3,3,"201202224",1,"2012-01-01");
insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Jurema","jur@mail.com",4,4,"201202225",1,"2012-01-01");
insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Teobaldo","teo@mail.com",5,5,"201202456",1,"2012-01-01");
insert into aluno(nome,email,endereco_id,telefone_id,matricula,curso_id,data_ingresso) values("Juca","juca@mail.com",6,6,"201202499",1,"2012-01-01");

insert into turma(disciplina_id,nome,periodo_id,data_inicio,data_termino,qtd_aulas,qtd_alunos) values(1,"Turma da Zueira",1,"2012-01-01","2017-01-01",70,50);


insert into frequencia(aluno_id,turma_id,n_faltas)values(1,1,20);

COMMIT;