-- drop database IFRGN;
create database IFRGN;
show databases;

use IFRGN;

create table Empregado(
		RG char(10) primary key,
        sexo varchar(45),
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
		('1234567890', 'M', '1975-08-20', 'Ulisses', 'Menezes', 'Cacimbas, 1892', 'Florianópolis','PR', 3500),
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
        ('5791324680', 'F', '1995-05-22', 'Alana', 'Rodrigues', 'Manoel Moura, 1027', 'Camboríu', 'SC', 1700);

insert into Departamento(dnum, dnome, dt_inicio) values
		(1, 'Biotecnologia', '2015-02-05'),
        (2, 'Farmacia', '2013-05-15'),
        (3, 'Botânica', '2010-01-10'),
        (4, 'Informática', '2010-01-20'),
        (5, 'Biblioteca', '2018-03-25');
        
insert into Empregado_Departamento(Ednum, gerRG) values
		(1, '7890123456'),
        (2, '0123456789'),
        (3, '1357908642'),
        (4, '9012345678'),
        (5, '9876543210');

        
insert into Projeto(pnum, pnome, localizacao, Pdnum) values
		(3, 'RNA', 'Florianópolis', '1'),
        (2, 'Medicamentos', 'Londrina', '2'),
        (4, 'Fungos', 'Camboríu', '3'),
        (1, 'Deep Learnig', 'Porto Alegre', '4'),
        (5, 'Pesquisa', 'Colombo', '5');
        
insert into Dependente(dep_nome, dep_sexo, dep_dt_nasc, empRG) values
		('Miguel', 'M', '2000-05-12', '1234567890'),
        ('Arthur', 'M', '2020-03-20', '0987654321'),
        ('Helena', 'F', '1995-08-03', '2345678901'),
        ('Theo', 'M', '2019-02-27', '5678901234'),
        ('Laura', 'F', '2017-11-27', '6789012345'),
        ('Gabriel', 'M', '2018-12-05', '9012345678'),
        ('Alice', 'F', '2013-02-26', '0123456789'),
        ('Gael', 'M', '2010-07-20', '7890123456'),
        ('Maria', 'F', '2021-10-18', '8901234567'),
        ('Davi', 'M', '2020-09-27', '9876543210'),
        ('Sophia', 'F', '2022-02-13', '0864213579'),
        ('Bernardo', 'M', '2014-04-22', '1357908642'),
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
 
-- 2)a)
select t.TRG, p.Pdnum from Trabalha_em as t inner join Projeto as p on t.Tpnum = p.pnum where p.Pdnum = 5;

-- 2)b)
select RG from Empregado where salario > 3000 order by salario desc;

-- 2)c)
-- select t.TRG, p.Pdnum, e.salario from Trabalha_em as t inner join Projeto as p inner join Empregado as e on t.Tpnum = p.pnum group by TRG having p.Pdnum = 5 and salario > 3000;
-- select e.RG, e.salario, p.Pdnum from Empregado as e, Projeto as p inner join Localizacao as l on l.localizacao = p.localizacao where salario > 3000 and Pdnum = 5;
-- select e.RG, e.salario, d.dnum from Empregado as e, Departamento as d inner join Empregado_Departamento as ed on d.dnum = ed.Ednum where e.salario > 3000 and d.dnum = 5;
select e.RG, e.salario from Empregado as e inner join Localizacao as l on e.cidade = l.localizacao where e.salario > 3000 and e.cidade = 'Colombo';

-- 2)d)
select e.RG, e.salario, l.Ldnum from Empregado as e inner join Localizacao as l on e.cidade = l.localizacao where e.salario > 3000 and e.cidade = 'Colombo' or e.salario > 2000 and e.cidade = 'Porto Alegre';

-- 2)e)
select pnome, salario from Empregado;

-- 2)f)
select pnome, salario from Empregado;