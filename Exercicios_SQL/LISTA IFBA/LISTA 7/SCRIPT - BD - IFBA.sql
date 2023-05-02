-- drop database IFBA;
create database IFBA;
show databases;

use IFBA;

create table authors(
	au_id int primary key auto_increment,
	au_fname varchar(45),
	au_lname varchar(45),  
	phone char(11), 
	address varchar(45), 
	city varchar(45), 
	state varchar(45), 
	zip char(8)
);

create table publishers(
	pub_id int primary key auto_increment, 
	pub_name varchar(45), 
	city varchar(45), 
	state varchar(45), 
	country varchar(45)
);

create table titles(
	title_id int auto_increment,
	Tpub_id int,
	title varchar(45), 
	t_type varchar(45), 
	price float, 
	pubdate date,
    edited char(1),
    primary key(title_id, Tpub_id),
    constraint fk_titles_publishers foreign key (Tpub_id) references publishers(pub_id)
);

create table title_author(
	TAau_id1 int,
    TAau_id2 int,
	TAtitle_id int,
    primary key(TAtitle_id),
    constraint fk_title_author1_authors foreign key (TAau_id1) references authors(au_id),
    constraint fk_title_author2_authors foreign key (TAau_id2) references authors(au_id)
);

create table jobs(
	job_id int primary key auto_increment, 
	job_desc varchar(45)
);

create table employee(
	emp_id int auto_increment, 
	fname varchar(45), 
	minit char(1), 
	lname varchar(45),
    Ejob_id int,
    Epub_id int,
	primary key(emp_id, Ejob_id, Epub_id),
    constraint fk_employee_jobs foreign key (Ejob_id) references jobs(job_id),
    constraint fk_employee_publishers foreign key (Epub_id) references publishers(pub_id)
);

create table stores(
	stor_id int primary key auto_increment, 
	stor_name varchar(45), 
	stor_address varchar(45),
    city varchar(45),
	state varchar(45), 
	zip char(8)
);

create table sales(
	Stitle_id int,
    Sstor_id int,
	ord_num char(6), 
	ord_date date, 
	qty int,
    payterms varchar(45),
    constraint fk_sales_titles foreign key (Stitle_id) references titles(title_id),
    constraint fk_sales_stores foreign key (Sstor_id) references stores(stor_id)
);

insert into authors(au_fname, au_lname, phone, address, city, state, zip) values 
		('Ulisses', 'Menezes', '48987654321','Cacimbas, 1892', 'Florianópolis','SC', 91750660),
        ('Brenda', 'Rovaris', '43876543219','Greenwich, 100', 'Londrina','PR', 90130902),
        ('Luciola', 'Antunes', '43765432198', 'R. da Pátria, 590', 'Londrina','PR', 93212908),
        ('Antonio', 'Ruberval', '51654321987', 'R. do Arvoredo, 903', 'Porto Alegre', 'RS', 86930120),
        ('Nicole', 'Pereira', '41654321987', 'Bartolomeu, 12', 'Colombo','PR', 71512750);
        
insert into publishers(pub_name, city, state, country) values 
		('Editora UFSC', 'Florianópolis', 'SC','Brasil'),
        ('Editora UFPR', 'Londrina', 'PR','Brasil'),
		('Editora UFPR', 'Londrina', 'PR','Brasil'),
		('Editora UFRGS', 'Porto Alegre', 'RS','Brasil'),
		('Editora Unespar', 'Colombo', 'PR','Brasil');
        
insert into titles(title, t_type, price, pubdate, Tpub_id, edited) values 
		('Fisica Geral e eletromagnetismo', 'Ciencias', '110.50','2015-02-05', 1, 'N'),
        ('Medicina Aplicada', 'Medicina', '236.90','2013-05-15', 2, 'S'),
		('Grámatica e interpretação de texto', 'Portugues', '96.99','2010-01-10', 3, 'N'),
		('Matematica Aplicada', 'Matematica', '156.90','2009-10-27', 4, 'S'),
		('Botanica', 'Biologia', '186.50','2018-03-25', 5, 'S'),
        ('Banco de dados', 'TI', '218.90','2020-05-29', 4, 'N'),
        ('Anatomia', 'Medicina', '205.99','2015-07-22', 2, 'S');
        
insert into title_author(TAau_id1, TAau_id2, TAtitle_id) values 
		(1, null, 1),
        (2, 5, 2),
		(3, null, 3),
		(4, null, 4),
		(5, null, 5),
        (4, 1, 6),
        (2, null, 7);
        
insert into jobs(job_desc) values 
		('Corretor'),
        ('Supervisor'),
		('Gerente'),
		('Redator'),
		('Analista de Banco de dados');
        
insert into employee(fname, minit, lname, Ejob_id, Epub_id) values
		('Paulo', 'R', 'Soares', 1, 1),
        ('Monica', 'P', 'Luz', 2, 2),
        ('Alberto', 'C', 'Filho', 3, 3),
        ('Luiza', 'P', 'Castro', 4, 4),
        ('Rodrigo', 'F', 'Silva', 5, 5);
        
insert into stores(stor_name, stor_address, city, state, zip) values
		('Livraria do Porto', 'Av. do Forte, 912', 'Florianópolis', 'SC', '91830696'),
        ('Artigos Academicos Vegas', 'Mario Sobroza, 300', 'Londrina', 'PR', 90218713),
		('Livraria Cassino', 'Greenwich, 1012', 'Londrina', 'PR', 90130902),
        ('Beco do Livro', 'Dom Jaime, 170', 'Porto Alegre', 'RS', 86200560),
        ('Livraria Colombo', 'Fernando Ferrari, 32', 'Colombo', 'PR', 71906201);
        
insert into sales(Stitle_id, Sstor_id, ord_num, ord_date, qty, payterms) values
		(1, 1, '982356','2019-05-18', 12, 'Cartão'),
        (2, 2, '375826', '2020-10-26', 5, 'Boleto'),
        (3, 3, '100837', '2022-03-20', 3, 'Pix'),
        (4, 4, '745134', '2021-11-05', 18, 'Cartão'),
        (5, 5, '012785', '2022-04-27', 0, 'Cartão'),
        (6, 4, '987654', '2020-09-12', 15, 'Cartão'),
        (7, 2, '123456', '2021-06-03', 2, 'Pix');
 
-- a) Selecionar todas as informações sobre todos os autores (authors);
select * from authors;

-- b) Selecionar o código, primeiro nome e último nome de todos os autores (authors) em ordem alfabética pelo último nome (au_lname);
select au_id, au_fname, au_lname from authors order by au_lname;

-- c) Selecionar todas as informações sobre todos os autores (authors) da cidade "Londrina";
select * from authors where city = 'Londrina';

-- d) Selecionar o código, título e preço dos livros (titles) em ordem decrescente de preço; 
select title_id, title, price from titles order by price desc;

-- e) Selecionar o código, título e preço dos livros (titles) cujo preço é superior a R$160;
select title_id, title, price from titles where price > 150;

-- f) Selecionar o código e título dos livros (titles), primeiro e último nome dos seus respectivos autores (authors); 
select t.title_id, t.title, a.au_fname, a.au_lname from titles as t inner join title_author as ta on TAtitle_id = t.title_id inner join authors as a on ta.TAau_id1 = a.au_id;

-- g) Selecionar o código e título dos livros e quantidade de autores de cada livro (titles); 
select t.title_id, t.title, count(ta.TAau_id1) as número_autores from titles as t inner join title_author as ta on TAtitle_id = t.title_id inner join authors as a on ta.TAau_id1 = a.au_id group by ta.TAau_id1;
select t.title_id, t.title, count(ta.TAau_id1) + count(ta.TAau_id2) as número_autores from titles as t inner join title_author as ta on TAtitle_id = t.title_id inner join authors as a on ta.TAau_id1 = a.au_id group by t.title;

-- h) Selecionar o código e título dos livros (titles) que foram escritos por mais de 2 autores; 
select t.title_id, t.title, count(ta.TAau_id1) as número_autores from titles as t inner join title_author as ta on TAtitle_id = t.title_id inner join authors as a on ta.TAau_id1 = a.au_id group by ta.TAau_id1 having número_autores > 1;

-- i) Selecionar o primeiro nome (fname), inicial do nome do meio (minit) e o último nome (lname) dos empregados (employee); 
select fname, minit, lname from employee;

-- j) Selecionar o código e a descrição dos cargos (jobs); 
select job_id, job_desc from jobs;

-- k) Selecionar o primeiro nome, inicial do nome do meio, ultimo nome dos empregados (employee) e a descrição do seu respectivo cargo (jobs);
select e.fname, e.minit, e.lname, j.job_desc from employee as e inner join jobs as j on j.job_id = e.Ejob_id;

-- l) Selecionar o código, nome e a cidade das editoras (publishers), ordenado pelo nome; 
select pub_id, pub_name, city, state from publishers order by pub_name;

-- m) Selecionar o código e título do livro (titles), código e nome da respectiva editora (publishers);
select t.title_id, t.title, p.pub_id, p.pub_name from titles as t inner join publishers as p on p.pub_id = Tpub_id;

-- n) Selecionar o código e título do livro (titles), código e nome da respectiva editora (publishers), cuja editora se localiza na cidade de “Porto Alegre”; 
select t.title_id, t.title, p.pub_id, p.pub_name from titles as t inner join publishers as p on p.pub_id = Tpub_id where p.city = 'Porto ALegre'; 

-- o) Selecionar o nome, endereço e cidade das lojas (stores) do estado "SC"; 
select stor_name, stor_address, city from stores where state = 'SC';

-- p) Selecionar código livro, titulo e a quantidade total de livros vendidos, em ordem decrescente da quantidade total de livros vendidos;
select t.title_id, t.title, s.qty from titles as t inner join sales as s on title_id = Stitle_id order by s.qty desc;

-- q) Selecionar código livro, titulo do livro, código e nome da loja (stores) e a quantidade total de livros vendidos pela loja (nas diversa vendas realizadas), em ordem decrescente da quantidade de livros vendidos; 
select t.title_id, t.title, st.stor_id, st.stor_name, s.qty from titles as t inner join sales as s on title_id = Stitle_id inner join stores as st on st.stor_id = Sstor_id order by s.qty desc;

-- r) Selecionar o código e nome da loja (stores), e a sua respectiva média de livros vendidos;
select st.stor_id, st.stor_name, avg(s.qty) from stores as st inner join sales as s on st.stor_id = Sstor_id group by st.stor_id;

-- s) Selecionar os livros (titles) que nunca foram vendidos;
select t.title_id, t.title from titles as t inner join sales as s on t.title_id = s.Stitle_id where qty = 0;

-- t) Selecionar as editoras (publishers) que não editaram nenhum livro.
select p.pub_id, p.pub_name from publishers as p inner join titles as t on p.pub_id = t.Tpub_id where edited = 'N';