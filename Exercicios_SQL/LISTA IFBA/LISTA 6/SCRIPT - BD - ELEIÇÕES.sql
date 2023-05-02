-- drop database eleicoes;
create database eleicoes;
-- show databases;

use eleicoes;

set SQL_SAFE_UPDATES=0;

-- a) Criação das tabelas Candidato, Votacao e Zona_Secao, especificando chave primária e chaves estrangeiras;
create table cargo(
		cod_cargo int primary key,
        nome_cargo varchar(45)
);

create table partido(
		cod_partido int primary key,
        nome_partido varchar(45)
);

create table candidato(
		num_candidato int,
        nome_candidato varchar(45),
        Ccod_cargo int,
        Ccod_partido int,
        primary key(num_candidato, Ccod_cargo, Ccod_partido),
        constraint fk_candidato_cargo foreign key (Ccod_cargo) references cargo(cod_cargo),
        constraint fk_candidato_partido foreign key (Ccod_partido) references partido(cod_partido)
);

create table zona_secao(
		num_zona int unique,
        num_secao int unique,
        nome_zona_secao varchar(45),
        qtd_eleitores int,
        primary key(num_zona, num_secao)
);

create table votacao(
		Vnum_zona int,
        Vnum_secao int,
		Vnum_candidato int,
        qtd_votos int,
        constraint fk_votacao_candidato foreign key (Vnum_candidato) references candidato(num_candidato),
        constraint fk_votacao_zona_secao1 foreign key (Vnum_zona) references zona_secao(num_zona),
        constraint fk_votacao_zona_secao2 foreign key (Vnum_secao) references zona_secao(num_secao)
);

-- b) Alteração da estrutura da tabela Votacao, adicionando um atributo data_votacao; 
alter table votacao add data_votacao date;
select * from votacao;

-- c) Alteração da estrutura da tabela Candidato, removendo a chave estrangeira com a tabela Partido;
alter table candidato drop foreign key fk_candidato_partido;
alter table candidato drop Ccod_partido;
select * from candidato;

-- d) Criar um índice “não-clustered” na tabela Candidato, com os atributos cod_cargo e cod_partido;
create index idx_candidato on candidato(Ccod_cargo, Ccod_partido);

-- e) Inserir um registro na tabela Votacao. (qtd_votos = 1000, num_secao = 10, num_zona = 5, num_candidato = 555);
insert into cargo(cod_cargo, nome_cargo) values
		(1, 'Governador');
insert into partido(cod_partido, nome_partido) values
		(5, 'Partido Democrático');
insert into zona_secao(num_zona, num_secao) values
		(5, 10);
insert into candidato(num_candidato, nome_candidato, Ccod_cargo, Ccod_partido) values 
		(555, 'Alberto', 1, 5);
insert into votacao(qtd_votos, Vnum_secao, Vnum_zona, Vnum_candidato) values
		(1000, 10, 5, 555);

-- f) Inserir um registro na tabela Zona_Secao (qtd_eleitores = 300, nome_zona_secao = “Zona Teste”, num_zona = 7, num_secao = 99).
insert into zona_secao(qtd_eleitores, nome_zona_secao, num_zona, num_secao) values
		(300, 'Zona Teste', 7, 99);
        
-- g) Alterar a quantidade de votos, multiplicando por 2, para os candidatos a governador (código do cargo = 1) e do Partido Democrático (código de partido = 5); 
select * from votacao;
select * from candidato;
update votacao set qtd_votos = (qtd_votos * 2) where Vnum_zona = 5;
update votacao as v inner join candidato as c on v.Vnum_candidato = c.num_candidato set v.qtd_votos = (v.qtd_votos * 2) where c.Ccod_cargo = 1 and c.Ccod_partido = 5;

-- h) Alterar a quantidade de eleitores, somando 100, para as zonas/seções onde ocorreu votação para candidatos ao Senado (código do cargo = 2);
insert into cargo(cod_cargo, nome_cargo) values
		(2, 'Prefeito');
select * from cargo;
insert into partido(cod_partido, nome_partido) values
		(6, 'Partido Patriota');
select * from partido;
insert into candidato(num_candidato, nome_candidato, Ccod_cargo, Ccod_partido) values 
		(556, 'Carlos', 2, 6);
select * from candidato;
insert into zona_secao(num_zona, num_secao, qtd_eleitores) values
		(6, 11, 500);
insert into votacao(Vnum_secao, Vnum_zona, Vnum_candidato) values
		(11, 6, 556);
update zona_secao as zs inner join votacao as v on zs.num_zona = v.Vnum_zona inner join candidato as c on v.Vnum_candidato = c.num_candidato inner join cargo as ca on c.Ccod_cargo = ca.cod_cargo set zs.qtd_eleitores = zs.qtd_eleitores + 100 where c.Ccod_cargo = 2;
select * from zona_secao;

-- i) Apagar todos os cargos que não possuem candidatos;
insert into cargo(cod_cargo, nome_cargo) values
		(3, 'Deputado Estadual');
insert into partido(cod_partido, nome_partido) values
		(7, 'Partido Liberal');
insert into candidato(num_candidato, nome_candidato, Ccod_cargo, Ccod_partido) values 
		(557, null, 3, 7);
select ca.cod_cargo, c.num_candidato, c.nome_candidato from cargo as ca inner join candidato as c on ca.cod_cargo = c.Ccod_cargo;
delete from candidato where nome_candidato is null;
select * from candidato;

-- j) Apagar as zonas/seções que possuam menos de 1.000 eleitores e que o nome comecem com a letra “A”;
insert into zona_secao(num_zona, num_secao, qtd_eleitores, nome_zona_secao) values
		(8, 100, 700, 'Amapa'),
        (9, 101, 500,'Anapolis'),
        (10, 102, 1100, 'Agronomia');
select * from zona_secao;
delete from zona_secao where nome_zona_secao like 'A%';
delete from zona_secao where nome_zona_secao like 'A%' and qtd_eleitores < 1000;

-- k) Selecionar nome do partido, nome do candidato e nome do cargo, em ordem alfabética do nome do partido; 
select p.nome_partido, ca.nome_cargo, c.nome_candidato from candidato as c inner join cargo as ca on c.Ccod_cargo = ca.cod_cargo inner join partido as p on p.cod_partido = c.Ccod_partido order by p.nome_partido;

-- l) Selecionar código e nome do partido, nome do cargo e a quantidade de candidatos por partido, para cada cargo;
select p.cod_partido, p.nome_partido, ca.nome_cargo, count(c.nome_candidato) as numero_candidatos_partido from partido as p inner join candidato as c on p.cod_partido = c.Ccod_partido inner join cargo as ca on ca.cod_cargo = c.Ccod_cargo group by c.nome_candidato;

-- m) Selecionar as zonas/seções onde não ocorreu votação;
-- select zs.num_zona, zs.num_secao, zs.nome_zona_secao, v.qtd_votos from zona_secao as zs inner join votacao as v on zs.num_zona = v.Vnum_zona;
-- select zs.num_zona, zs.num_secao, zs.nome_zona_secao, v.qtd_votos from zona_secao as zs inner join votacao as v group by zs.num_zona;
select zs.num_zona, zs.num_secao, zs.nome_zona_secao from zona_secao as zs inner join votacao as v on zs.num_zona = v.Vnum_zona where qtd_votos is null;

-- n) Selecionar número do candidato, nome do candidato, nome do cargo, nome do partido e quantidade total de votos de cada candidato, apenas para os candidatos que tiveram uma votação superior 100.000 votos;
insert into cargo(cod_cargo, nome_cargo) values
		(4, 'Presidente');
insert into partido(cod_partido, nome_partido) values
		(8, 'Partido do Povo');
insert into zona_secao(num_zona, num_secao) values
		(8, 12);
insert into candidato(num_candidato, nome_candidato, Ccod_cargo, Ccod_partido) values 
		(600, 'Alexandre', 4, 8);
insert into votacao(qtd_votos, Vnum_secao, Vnum_zona, Vnum_candidato) values
		(150000, 12, 8, 600);
select c.num_candidato, c.nome_candidato, ca.nome_cargo, p.nome_partido, v.qtd_votos from candidato as c inner join cargo as ca on c.Ccod_cargo = ca.cod_cargo inner join partido as p on c.Ccod_partido = p.cod_partido inner join votacao as v on c.num_candidato = v.Vnum_candidato;
select c.num_candidato, c.nome_candidato, ca.nome_cargo, p.nome_partido, v.qtd_votos from candidato as c inner join cargo as ca on c.Ccod_cargo = ca.cod_cargo inner join partido as p on c.Ccod_partido = p.cod_partido inner join votacao as v on c.num_candidato = v.Vnum_candidato where v.qtd_votos > 100000;

-- o) Selecionar o número do candidato, nome do candidato e a sua média de votos obtidos nas zonas/seções; 
select c.num_candidato, c.nome_candidato, avg(v.qtd_votos) from candidato as c inner join votacao as v on c.num_candidato = v.Vnum_candidato group by c.num_candidato;

-- p) Selecionar o código do partido, nome do partido, nome do candidato e a média de votos obtidos, apenas para os candidatos que tiveram média de votos superior à média de votos do seu partido.
