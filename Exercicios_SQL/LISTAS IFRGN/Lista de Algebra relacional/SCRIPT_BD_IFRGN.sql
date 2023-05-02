-- drop database IFRGN;
create database IFRGN;
show databases;

use IFRGN;

create table Empregado(
		RG char(10) primary key,
        sexo char(1),
        dt_nasc date,
        pnome varchar(45),
        unome varchar(45),
        rua varchar(60),
        cidade varchar(20),
        estado varchar(10),
        salario float
);

create table Departamento(
		dnum int primary key,
        dnome varchar(45),
        dt_inicio date
);

create table Empregado_Departamento(
		Ednum int,
		gerRG char(10),
        gerente char(1),
		primary key(Ednum, gerRG),
        constraint fk_Empregado_Departamento_Empregado foreign key (gerRG) references Empregado(RG),
		constraint fk_Empregado_Departamento_Departamento foreign key (Ednum) references Departamento(dnum)
);

create table Projeto(
		pnum int,
        pnome varchar(45),
        localizacao varchar(45),
        Pdnum int,
		primary key(pnum, Pdnum),
		constraint fk_Projeto_Departamento foreign key (Pdnum) references Departamento(dnum)
);

create table Dependente(
		dep_nome varchar(45),
        dep_sexo varchar(45),
        dep_dt_nasc date,
        empRG char(10),
		primary key(dep_nome, empRG),
        constraint fk_Dependente_Empregado foreign key (empRG) references Empregado(RG)
);

create table Trabalha_em(
		TRG char(10),
        Tpnum int,
        horas varchar(20),
        primary key(TRG, Tpnum),
        constraint fk_Trabalha_em_Empregado foreign key (TRG) references Empregado(RG),
        constraint fk_Trabalha_em_Projeto foreign key (Tpnum) references Projeto(pnum)
);

create table Localizacao(
		localizacao varchar(45),
        Ldnum int primary key,
        constraint fk_Localizacao_Departamento foreign key (Ldnum) references Departamento(dnum)
);

insert into Empregado(RG, sexo, dt_nasc, pnome, unome, rua, cidade, estado, salario) values
		('1234567890', 'M', '1975-08-20', 'Ulisses', 'Menezes', 'Cacimbas, 1892', 'Florianópolis','SC', 3500),
        ('0987654321', 'F', '1985-09-25', 'Brenda', 'Rovaris', 'Greenwich, 100', 'Londrina','PR', 2000),
        ('2345678901', 'F', '1965-5-12', 'Luciola', 'Antunes', 'R. da Pátria, 590', 'Londrina','PR', 4000),
        ('5678901234', 'M', '1970-11-05', 'Antonio', 'Ruberval', 'R. do Arvoredo, 903', 'Porto Alegre', 'RS', 8000),
        ('6789012345', 'F', '1986-2-09', 'Nicole', 'Pereira', 'Bartolomeu, 12', 'Colombo','PR', 3500),
        ('9012345678', 'M', '1977-11-23', 'Alberto', 'Fernandes', 'Dom Jaime, 170', 'Porto Alegre', 'RS', 10000),
        ('0123456789', 'F', '1975-05-12', 'Lúcia', 'Oliveira', 'Mario Sobroza, 300', 'Londrina', 'PR', 4700),
        ('7890123456', 'F', '1976-07-25', 'Ana', 'Barroso', 'Av. do Forte, 912', 'Florianópolis', 'SC', 5000),
        ('8901234567', 'M', '1990-03-04', 'Renan', 'Ferreira', 'Av. Dique, 1012', 'Colombo', 'PR', 3700),
        ('9876543210', 'M', '1989-08-15', 'Lúcio', 'Antunes', 'Fernando Ferrari, 32', 'Colombo', 'PR', 4500),
        ('0864213579', 'F', '1991-05-03', 'Carla', 'Luz', 'Nereu Ramos, 1894', 'Florianópolis', 'SC', 3850),
        ('1357908642', 'M', '1980-07-18', 'Yuri', 'Pereira', 'Ori Kindler, 12', 'Camboríu', 'SC', 5600),
        ('2468013579', 'F', '1987-02-21', 'Claudia', 'Aline', 'Prudente Morais, 397', 'Porto Alegre', 'RS', 4200),
        ('4680123579', 'M', '1992-05-22', 'Pedro', 'Holand', 'R. Guarani, 05', 'Camboríu', 'SC', 4000),
        ('5791324680', 'F', '1995-11-17,', 'Alana', 'Rodrigues', 'Manoel Moura, 1027', 'Camboríu', 'SC', 1700);

insert into Departamento(dnum, dnome, dt_inicio) values
		(1, 'Biotecnologia', '2015-02-05'),
        (2, 'Farmacia', '2013-05-15'),
        (3, 'Botânica', '2010-01-10'),
        (4, 'Informática', '2010-01-20'),
        (5, 'Biblioteca', '2018-03-25');
        
insert into Empregado_Departamento(Ednum, gerRG, gerente) values
		(1, '1234567890', 'N'),
        (2, '0987654321', 'N'),
        (2, '2345678901', 'N'),
        (4, '5678901234', 'N'),
        (5, '6789012345', 'N'),
        (4, '9012345678', 'S'),
        (2, '0123456789', 'S'),
        (1, '7890123456', 'S'),
        (5, '8901234567', 'N'),
        (5, '9876543210', 'S'),
        (1, '0864213579', 'N'),
        (3, '1357908642', 'S'),
        (4, '2468013579', 'N'),
        (3, '4680123579', 'N'),
        (3, '5791324680', 'N');
        
insert into Projeto(pnum, pnome, localizacao, Pdnum) values
		(3, 'RNA', 'Florianópolis', '1'),
        (2, 'Medicamentos', 'Londrina', '2'),
        (4, 'Fungos', 'Camboríu', '3'),
        (1, 'Deep Learning', 'Porto Alegre', '4'),
        (5, 'Pesquisa', 'Colombo', '5');
        
insert into Dependente(dep_nome, dep_sexo, dep_dt_nasc, empRG) values
		('Ulisses', 'M', '2000-05-12', '1234567890'),
        ('Arthur', 'M', '2020-03-20', '0987654321'),
        ('Helena', 'F', '1995-08-03', '2345678901'),
        ('Theo', 'M', '2019-02-27', '5678901234'),
        ('Nicole', 'F', '2017-11-27', '6789012345'),
        ('Gabriel', 'M', '2018-12-05', '9012345678'),
        ('Alice', 'F', '2013-02-26', '0123456789'),
        ('Gael', 'M', '2010-07-20', '7890123456'),
        ('Maria', 'F', '2021-10-18', '8901234567'),
        ('Davi', 'M', '2020-09-27', '9876543210'),
        ('Carla', 'F', '2022-02-13', '0864213579'),
        ('Yuri', 'M', '2014-04-22', '1357908642'),
        ('Heloísa ', 'F', '2021-11-01', '2468013579'),
        ('Heitor', 'M', '2022-01-07', '4680123579'),
        ('Valentina', 'F', '2022-05-11', '5791324680');
      
insert into Trabalha_em(TRG, Tpnum, horas) values
		('1234567890', 3, '08H-17H'),
        ('0987654321', 2, '08:30H-17:30H'),
        ('2345678901', 2, '08:30H-17:30H'),
        ('5678901234', 1, '07:30H-16:30H'),
        ('6789012345', 5, '08:15H-17:15H'),        
        ('9012345678', 1, '07:30H-16:30H'),
        ('0123456789', 2, '08:30H-17:30H'),
        ('7890123456', 3, '08H-17H'),
        ('8901234567', 5, '08:15H-17:15H'),
        ('9876543210', 5, '08:15H-17:15H'),
        ('0864213579', 3, '08H-17H'),
        ('1357908642', 4, '08:30H-17:30H'),
        ('2468013579', 1, '07:30H-16:30H'),
        ('4680123579', 4, '08:30H-17:30H'),
        ('5791324680', 4, '08:30H-17:30H');
        
insert into Localizacao(localizacao, Ldnum) values
		('Florianópolis', 1),
        ('Londrina', 2),
        ('Camboríu', 3),
        ('Porto Alegre', 4),
        ('Colombo', 5);
        
-- 2)a) Retorne os empregados que trabalham no departamento 5
select t.TRG, p.Pdnum from Trabalha_em as t inner join Projeto as p on t.Tpnum = p.pnum where p.Pdnum = 5;

-- 2)b) Retorne os empregados com salário maior que 3000,00
select RG from Empregado where salario > 3000 order by salario desc;

-- 2)c) Retorne os empregados que trabalham no departamento 5 e têm salário maior que 3000,00
select ed.gerRG, ed.Ednum, e.salario from Empregado_Departamento as ed inner join Empregado as e on ed.gerRG = e.RG where ed.Ednum = 5 and e.salario > 3000 order by e.salario desc;

-- 2)d) Retorne os empregados que trabalham no departamento 5 e têm salário maior que 3000,00 ou que trabalham no departamento 4 e têm salário maior que 2000,00
select ed.gerRG, ed.Ednum, e.salario from Empregado_Departamento as ed inner join Empregado as e on ed.gerRG = e.RG where ed.Ednum = 5 and e.salario > 3000 or ed.Ednum = 4 and e.salario > 2000;

-- 2)e) Retorne o primeiro nome e o salário de cada empregado
select pnome, salario from empregado order by salario desc;

-- 2)f) Retorne o primeiro nome e o salário dos empregados que trabalham no departamento 5
select e.pnome, e.salario, ed.Ednum from Empregado as e inner join Empregado_Departamento as ed on e.RG = ed.gerRG where ed.Ednum = 5 and e.salario > 3000 order by e.salario desc; 

-- 2)g) Retorne o RG de todos os empregados que trabalham no departamento 5 ou supervisionam diretamente um empregado que trabalha no departamento 5
select gerRG, gerente from Empregado_Departamento where Ednum = 5;

-- 2)h) Retorne os primeiros nomes de empregados que são iguais a nomes de dependentes
select e.pnome, dp.dep_nome from Empregado as e inner join Dependente as dp on e.pnome = dp.dep_nome;

-- 2)i) Retorne todas as combinações de primeiro nome de empregados e nome de dependentes
select e.pnome, dp.dep_nome from Empregado as e cross join Dependente as dp;

-- 2)j) Retorne os nomes dos empregados e de seus respectivos dependentes
select e.pnome, dp.dep_nome from Empregado as e inner join Dependente as dp on e.RG = dp.empRG;

-- 2)k) Retorne o nome do gerente de cada departamento
select concat(e.pnome, ' ', e.unome) as Nome_completo from Empregado as e inner join Empregado_Departamento as ed on e.RG = ed.gerRG where ed.gerente = 'S';

-- 2)l) Retorne todas as localizações de cada departamento usando junção natural
select l.localizacao, d.dnum from Localizacao as l inner join Departamento as d on l.Ldnum = d.dnum;
select l.localizacao, p.Pdnum from Localizacao as l natural join Projeto as p;

-- 2)m) Retorne o nome do empregado e o nome de cada projeto que ele trabalha
select concat(e.pnome, ' ', e.unome) as Nome_completo, p.pnome as Nome_projeto from Empregado as e inner join Trabalha_em as te on e.RG = te.TRG inner join Projeto as p on p.pnum = te.Tpnum;

-- 2)n) Retorne o nome dos empregados que trabalham em algum projeto controlado pelo departamento 5
select concat(e.pnome, ' ', e.unome) as Nome_completo, p.pnome as Nome_projeto from Empregado as e inner join Trabalha_em as te on e.RG = te.TRG inner join Projeto as p on p.pnum = te.Tpnum where Pdnum = 5;

-- 2)o) Retorne o número de empregados da empresa
select count(RG) as Número_empregados from Empregado;

-- 2)p) Retorne o número do departamento e o número de empregados de CADA departamento da empresa
select d.dnum, count(ed.gerRG) as 'N°_funcionarios_setor' from Departamento as d inner join Empregado_Departamento as ed on ed.Ednum = d.dnum group by dnum;

-- 2)q) Retorne o número do departamento e a média do salário dos empregados de CADA departamento da empresa
select ed.Ednum, avg(e.salario) as Média_salário from Empregado_Departamento as ed inner join Empregado as e on e.RG = ed.gerRG inner join Departamento as d on ed.Ednum = d.dnum group by ed.Ednum;

-- 2)r) Retorne o nome e o endereço de todos os empregados que trabalham no departamento ‘Biblioteca’
select concat(e.pnome, ' ', e.unome) as Nome_completo, e.rua, e.cidade, e.estado, d.dnome from Empregado_Departamento as ed inner join Empregado as e on ed.gerRG = e.RG inner join Departamento as d on ed.Ednum = d.dnum;
select concat(e.pnome, ' ', e.unome) as Nome_completo, e.rua, e.cidade, e.estado, d.dnome from Empregado_Departamento as ed inner join Empregado as e on ed.gerRG = e.RG inner join Departamento as d on ed.Ednum = d.dnum where d.dnome = 'Biblioteca';

-- 2)s) Para cada projeto localizado em ‘Londrina’, retorne o número do projeto, o número do departamento que o controla, e o nome e sexo do gerente do departamento
select p.pnum, ed.Ednum, concat(e.pnome, ' ', e.unome) as Nome_completo, e.sexo from Projeto as p inner join Empregado_Departamento as ed on p.Pdnum = ed.Ednum inner join Empregado as e on ed.gerRG = e.RG where p.localizacao = 'Londrina' and ed.gerente = 'S';
select p.pnum, ed.Ednum, concat(e.pnome, ' ', e.unome) as Nome_completo, e.sexo from Projeto as p inner join Empregado_Departamento as ed on p.Pdnum = ed.Ednum inner join Empregado as e on ed.gerRG = e.RG where ed.gerente = 'S';