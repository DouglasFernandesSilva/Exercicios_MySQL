-- drop database mundo;
create database mundo;
show databases;

use mundo;

create table pais(
		nome varchar(35) primary key,
        continente varchar(35),
        pop float,
        pib float,
        expc_vida float
);

create table cidade(
		nome varchar(35),
        Cpais varchar(35),
        pais varchar(35),
        pop float,
        capital varchar(1),
		primary key(nome, Cpais),
        constraint fk_cidade_pais foreign key (Cpais) references pais(nome)
);

create table rio(
		nome varchar(35),
        origem varchar(35),
        comprimento integer,
        Rnome varchar(35),
        primary key(nome, Rnome),
        constraint fk_rio_pais foreign key (Rnome) references pais(nome)
);


insert into pais(nome, continente, pop, pib, expc_vida) values
		('Canada', 'Am. Norte', 30.1, 658, 77.08),
        ('Mexico', 'Am. Norte', 107.5, 694, 69.1),
        ('Brasil', 'Am. Sul', 183.3, 10004, 65.2),
        ('USA', 'Am. Norte', 270, 8003, 75.5);
        
insert into cidade(nome, Cpais, pais, pop, capital) values
		('Washington', 'USA', 'USA', 3.3, 'S'),
		('Monterrey', 'Mexico', 'Mexico', 2, 'N'),
		('Brasilia', 'Brasil',  'Brasil', 1.5, 'S'),
		('São Paulo', 'Brasil', 'Brasil', 15, 'N'),
		('Ottawa', 'Canada',  'Canada', 0.8, 'S'),
		('Cid. Mexico', 'Mexico', 'Mexico', 14.1, 'S');
        
insert into rio(nome, origem, Rnome, comprimento) values
		('St. Lawrence', 'USA', 'USA', 3.3),
		('Grande', 'USA', 'Mexico', 2),
		('Parana', 'Brasil', 'Brasil', 1.5),
		('Mississipi', 'USA', 'USA', 15);
        
        
-- 1. Liste todas as cidades e os países aos quais pertencem. 
select nome, pais from cidade;

-- 2. Liste todas as cidades que são capitais.
select nome, capital from cidade where capital = 'S';

-- 3. Liste todos os atributos dos países onde a expectativa de vida é menor que 70 anos.
select * from pais where expc_vida < 70;

-- 4. Liste todas as capitais e as populações dos países cujos PIB é maior que 1 trilhão de dólares. 
select c.nome, p.pop from cidade as c inner join pais as p on c.Cpais = p.nome where p.pib > 1000 and c.capital = 'S';

-- 5. Qual é o nome e a população da capital do país onde o rio St. Lawrence tem sua nascente.
select c.nome, c.pop from cidade as c inner join pais as p on c.Cpais = p.nome inner join rio as r on r.Rnome = p.nome where r.nome = 'St. Lawrence' and c.capital = 'S';

-- 6. Qual é a média da população das cidades que não são capitais.
select avg(pop) as média_pop_cidade_milhões from cidade where capital = 'N';

-- 7. Para cada continente retorne o PIB médio de seus países.
select continente, avg(pib) as PIB_médio from pais group by continente;

-- 8. Para cada país onde pelo menos 2 rios tem nascente, encontre o comprimento do menor rio.
select min(comprimento) as comprimento_km, count(origem) as pais_2_rios_nascente from rio group by origem having count(origem) > 2;

-- 9. Liste os países cujo PIB é maior que o PIB do Canada. 
select nome from pais where pib > 658; 
