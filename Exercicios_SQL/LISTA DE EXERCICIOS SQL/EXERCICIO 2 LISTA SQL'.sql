-- drop database universidade;
create database if not exists universidade;
show databases;

use universidade;

-- set SQL_SAFE_UPDATES=0;

create table Alunos(
	MAT char(10) primary key,
    nome varchar(50),
    endereço varchar(50),
    cidade varchar(30)
);

desc Alunos;

create table Disciplinas(
	COD_DISC varchar(10) primary key,
    nome_disc varchar(50),
    carga_hor int
);

desc Disciplinas;

create table Professores(
	COD_PROF char(6) primary key,
    nome varchar(30),
    endereço varchar(50),
    cidade varchar(30)
);

desc Professores;

create table Turma(
	TCOD_DISC varchar(10),
    COD_TURMA int,
    TCOD_PROF char(6),
	ANO int,
    horário varchar(10),
    primary key(TCOD_DISC, COD_TURMA, TCOD_PROF, ANO),
    constraint fk_Turma_Disciplinas foreign key (TCOD_DISC) references Disciplinas(COD_DISC),
    constraint fk_Turma_Professores foreign key (TCOD_PROF) references Professores(COD_PROF)
);

desc Turma;

create table Historico(
	HMAT char(10),
    HCOD_DISC varchar(10),
	HCOD_TURMA int,
	HCOD_PROF char(6),
    HANO int,
    frequência int,
    nota1 float,
    nota2 float,
    nota3 float,
    primary key(HMAT, HCOD_DISC, HCOD_TURMA, HCOD_PROF, HANO),
    constraint fk_Historico_Alunos foreign key (HMAT) references Alunos(MAT),
    constraint fk_Historico_Disciplinas foreign key (HCOD_DISC) references Turma(TCOD_DISC),
    #constraint fk_Historico_Turma foreign key (HCOD_TURMA) references Turma(COD_TURMA),
    constraint fk_Historico_Professores foreign key (HCOD_PROF) references Turma(TCOD_PROF)
    #constraint fk_Historico_Ano foreign key (HANO) references Turma(ANO)
);

desc Historico;

insert into Alunos(MAT, nome, endereço, cidade) values
		('2015010101', 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
		('2015010102', 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
		('2015010103', 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
		('2015010104', 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
		('2015010105', 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
		(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
        
select * from Alunos;

insert into Disciplinas(COD_DISC, nome_disc, carga_hor) values
		('BD', 'BANCO DE DADOS', 100),
		('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
		('WEB', 'AUTORIA WEB', 50),
		('ENG', 'ENGENHARIA DE SOFTWARE', 80);
        
select * from Disciplinas;

insert into Professores(COD_PROF, nome, endereço, cidade) values
		('212131', 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
		('122135', 'ADORILSON BEZERRA','AVENIDA SALGADO FILHO', 'NATAL'),
		('192011', 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');
        
select * from Professores;

insert into Turma(TCOD_DISC, COD_TURMA, TCOD_PROF, ANO, horário) values
		('BD', 1, '212131', 2015, '11H-12H'),
		('BD', 2, '212131', 2015, '13H-14H'),
		('POO', 1, '192011', 2015, '08H-09H'),
		('WEB', 1, '192011', 2015, '07H-08H'),
		('ENG', 1, '122135', 2015, '10H-11H');
  
select * from Turma;

insert into Historico(HMAT, HCOD_DISC, HCOD_TURMA, HCOD_PROF, HANO, frequência, nota1, nota2, nota3) values
		('2015010101', 'BD', 1, '212131', 2015, 95, 9.5, 9, 7.5),
        ('2015010101', 'POO', 1, '192011', 2015, 90, 8, 6, 7.8),
        ('2015010101', 'WEB', 1, '192011', 2015, 97, 7.5, 4.5, 8),
		('2015010101', 'ENG', 1, '122135', 2015, 99, 8.5, 9, 6.5),
        
        ('2015010102', 'BD', 1, '212131', 2015, 98, 7.5, 4, 5.5),
        ('2015010102', 'POO', 1, '192011', 2015, 93, 6, 7, 7.7),
        ('2015010102', 'WEB', 1, '192011', 2015, 97, 8, 8.8, 6.3),
		('2015010102', 'ENG', 1, '122135', 2015, 95, 8.3, 8, 7.4),
        
        ('2015010103', 'BD', 1, '212131', 2015, 70, 2, 1, 0),
        ('2015010103', 'POO', 1, '192011', 2015, 93, 7.5, 6, 7.7),
        ('2015010103', 'WEB', 1, '192011', 2015, 84, 3.5, 6, 5.3),
		('2015010103', 'ENG', 1, '122135', 2015, 90, 6, 8, 7.4),
        
        ('2015010104', 'BD', 2, '212131', 2015, 98, 9.8, 9, 7),
        ('2015010104', 'POO', 1, '192011', 2015, 63, 1, 2.3, 0.7),
        ('2015010104', 'WEB', 1, '192011', 2015, 50, 0.5, 1, 0),
		('2015010104', 'ENG', 1, '122135', 2015, 96, 6, 7, 3.7),
        
        ('2015010105', 'BD', 2, '212131', 2015, 50, 4.5, 3, 0),
        ('2015010105', 'POO', 1, '192011', 2015, 60, 3, 1, 1.8),
        ('2015010105', 'WEB', 1, '192011', 2015, 79, 4.4, 6.7, 8),
		('2015010105', 'ENG', 1, '122135', 2015, 30, 2, 4.5, 6),
        
        ('2015010106', 'BD', 2, '212131', 2015, 100, 9.7, 9, 8.3),
        ('2015010106', 'POO', 1, '192011', 2015, 98, 8.3, 7.7, 9.3),
        ('2015010106', 'WEB', 1, '192011', 2015, 95, 9, 7.5, 8),
		('2015010106', 'ENG', 1, '122135', 2015, 99, 9.5, 8.8, 9);
        
select * from Historico;
        
select HMAT, nota1, nota2, nota3 from Historico where HCOD_DISC = 'BD' and nota1 < 5 or HCOD_DISC = 'BD' and nota2 <5 or HCOD_DISC = 'BD' and nota3 <5;

select HMAT, (nota1+nota2+nota3)/3 as MEDIA from Historico where HCOD_DISC = 'POO' group by HMAT;

select HMAT, (nota1+nota2+nota3)/3 as MEDIA from Historico where HCOD_DISC = 'POO' group by HMAT having MEDIA > 6;

select HMAT, format(((nota1+nota2+nota3)/3), 1) as MEDIA from Historico where HCOD_DISC = 'POO' group by HMAT having MEDIA > 6;

select count(MAT) from Alunos where cidade != 'NATAL';