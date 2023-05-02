-- drop database equipamentos;
create database if not exists equipamentos;
show databases;

use equipamentos;

create table cliente(
		idCliente int auto_increment primary key,
        Nome varchar(30),
        Fabricante varchar(10),
        Login varchar(50),
        senha varchar(30)
);
desc cliente;

create table inversor(
		idInversor int,
        idIcliente int,
        primary key(idInversor,idIcliente),
        Fabricante varchar(10),
        Modelo varchar(30),
        Potencia int,
        Vmax_CC int,
        Iisc_CC float,
        Vmin_mppt int,
        Vmax_mppt int,
        constraint fk_inversor_cliente foreign key (idIcliente) references cliente(idCliente)
);
desc inversor;

create table modulo(
		idModulo int auto_increment primary key,
        Fabricante varchar(10),
        Modelo varchar(30),
        Pmax_stc int,
        Voc_stc float,
        Isc_stc float,
        Vop_nmot float,
        Pmax_nmot int,
        CT_voc float,
        CT_isc float,
        CT_pmax float,
        Comprimento int,
        Largura int
);
desc modulo;






