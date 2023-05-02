-- drop database loja;
create database if not exists loja;
show databases;

use loja;

create table vendas(
		ID_NF int,
        ID_ITEM int,
        COD_PROD int,
        VALOR_UNIT float,
        QUANTIDADE int,
        DESCONTO int null
);

insert into vendas(ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) values
		(1, 1, 1, 25, 10, 5),
        (1, 2, 2, 13.5, 3, null),
        (1, 3, 3, 15, 2, null),
        (1, 4, 4, 10, 1, null),
        (1, 5, 5, 30, 1, null),
        (2, 1, 3, 15, 4, null),
        (2, 2, 4, 10, 5, null),
        (2, 3, 5, 30, 7, null),
        (3, 1, 1, 25, 5, null),
        (3, 2, 4, 10, 4, null),
        (3, 3, 5, 30, 5, null),
        (3, 4, 2, 13.5, 7, null),
        (4, 1, 5, 30, 10, 15),
        (4, 2, 4, 10, 12, 5),
        (4, 3, 1, 25, 13, 5),
        (4, 4, 2, 13.5, 15, 5),
        (5, 1, 3, 15, 3, null),
        (5, 2, 5, 30, 6, null),
        (6, 1, 1, 25, 22, 15),
        (6, 2, 3, 15, 25, 20),
        (7, 1, 1, 25, 10, 3),
        (7, 2, 2, 13.5, 10, 4),
        (7, 3, 3, 15, 10, 4),
        (7, 4, 5, 30, 10, 1);

select * from vendas;

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT from vendas where DESCONTO is null;

-- alter table vendas add VALOR_VENDIDO float;

-- set @VALOR_VENDIDO = VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100));

-- update vendas set VALOR_VENDIDO = VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100));

select VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as VALOR_VENDIDO from vendas;

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as VALOR_VENDIDO from vendas;

set SQL_SAFE_UPDATES=0;

update vendas set DESCONTO = 0 where DESCONTO is null;

select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE * VALOR_UNIT as VALOR_TOTAL, VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)) as VALOR_VENDIDO from vendas;

select ID_NF, sum(QUANTIDADE * VALOR_UNIT) as VALOR_TOTAL from vendas group by ID_NF order by VALOR_TOTAL desc;

-- select ID_NF, QUANTIDADE * VALOR_UNIT as VALOR_TOTAL from vendas order by VALOR_TOTAL desc;

select ID_NF, sum(VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100))) as VALOR_VENDIDO from vendas group by ID_NF order by VALOR_VENDIDO desc;

select ID_NF, sum(VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)))*QUANTIDADE as VALOR_TOTAL_VENDIDO from vendas group by ID_NF order by VALOR_TOTAL_VENDIDO desc; ## NÃO ESTÁ NA LISTA

select COD_PROD, sum(QUANTIDADE) from vendas group by COD_PROD order by sum(QUANTIDADE) desc;

select ID_NF, COD_PROD, QUANTIDADE from vendas where QUANTIDADE > 10 group by ID_NF, COD_PROD;

-- alter table vendas add VALOR_TOTAL float;

-- update vendas set VALOR_TOTAL = sum(QUANTIDADE * VALOR_UNIT);

select ID_NF, sum(QUANTIDADE * VALOR_UNIT) as VALOR_TOTAL from vendas group by ID_NF having VALOR_TOTAL > 500 order by VALOR_TOTAL desc;

-- select ID_NF, sum(QUANTIDADE * VALOR_UNIT) as VALOR_TOTAL from vendas group by ID_NF order by VALOR_TOTAL desc;

select COD_PROD, avg(VALOR_UNIT * (DESCONTO/100)) as MEDIA from vendas group by COD_PROD order by MEDIA desc;

select COD_PROD, max(VALOR_UNIT * (DESCONTO/100)) as MAIOR, avg(VALOR_UNIT * (DESCONTO/100)) as MEDIA, min(VALOR_UNIT * (DESCONTO/100)) as MENOR from vendas group by COD_PROD;

select ID_NF, count(COD_PROD) as QTDE_ITENS from vendas group by ID_NF having QTDE_ITENS > 3 order by QTDE_ITENS desc;
