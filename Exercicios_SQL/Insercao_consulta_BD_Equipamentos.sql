use equipamentos;

show tables;

-- idCliente, Nome, Fabricante, Login, senha
       
insert into cliente (Nome, Fabricante, Login, senha) values 
		('MOTORMAC', 'GROWATT', 'Tayluan', '994048360'),
        ('LC CONTAINERS', 'GROWATT', 'LC CONTAINERS', '28ff3ed5'),
        ('GROSS', 'GROWATT', 'Valmir Gross', '123456'),
        ('DOMINGOS E TAVARES', 'WEG', 'mauriciodomingostavares@gmail.com', 'P%OYH0CH'),
        ('TORRES DEL PAINE', 'GROWATT', 'torressolar', 'torressolar'),
        ('CALÇADOS VST (Independencia)', null, 'motormacsolar@yahoo.com', 'economia$olar'),
        ('CALÇADOS VST (Espirito santo)', null, 'motormacsolar@yahoo.com', '$olar2020r'),
        ('COMERCIAL ELÉTRICA', 'GROWATT', 'comercial tc', '279100');
        
select * from cliente;

-- idInversor, idIcliente, Fabricante, Modelo, Potencia, Vmax_CC, Iisc_CC, Vmin_mppt, Vmax_mppt

insert into inversor (idInversor, idIcliente, Fabricante, Modelo, Potencia, Vmax_CC, Iisc_CC, Vmin_mppt, Vmax_mppt) values
		(1, 4, 'WEG','SIW500H ST030', 30000, 1100, 22, 480, 800),
        (2, 6,'Sungow', 'SG25CX-AS', 25000, 1100, 78, 400, 850),
        (3, 6,'Fronius', 'ECO 25.0-3-S', 25000, 1000, 71.6, 580, 850),
        (4, 6,'Fronius', 'ECO 27.0-3-S', 27000, 1000, 71.6, 580, 850),
		(5, 1,'GROWATT', 'MAC15KTL3-XL', 15000, 1100, 55, 250, 1100),
		(6, 2,'GROWATT', 'MAC20KTL3-XL', 20000, 1100, 55, 250, 1100),
		(7, 3,'GROWATT', 'MAC25KTL3-XL', 25000, 1100, 55, 250, 1100),
		(8, 5,'GROWATT', 'MAC30KTL3-XL', 30000, 1100, 55, 200, 1000),
		(9, 8,'GROWATT', 'MID40KTL3-XL',	40000, 1100, 32, 180, 1000),
		(10, 6,'Canadian', 'CSI-25KTL-GI-L', 25000, 1100, 44.5, 200, 850),
		(11, 6,'SOLIS', 'S5-GR3P20K', 20000, 1100, 40, 160, 1000),
		(12, 1,'GROWATT', 'MAX 75KTL3-XL2', 75000, 1100, 56.5, 180, 850);

select * from inversor;

select * from inversor where Fabricante='GROWATT';

select * from inversor where Fabricante='Fronius';

select * from inversor where Vmax_CC=1100;

select sum(Potencia) from inversor;

select avg(Potencia) from inversor;

select * from inversor where Vmax_CC=1000;

select Modelo from inversor where Vmax_CC=1000;

select Fabricante, Modelo from inversor where Potencia=25000;

-- idModulo, Fabricante, Modelo, Pmax_stc, Voc_stc, Isc_stc, Vop_nmot, Pmax_nmot, CT_voc, CT_isc, CT_pmax, Comprimento, Largura
insert into modulo (Fabricante, Modelo, Pmax_stc, Voc_stc, Isc_stc, Vop_nmot, Pmax_nmot, CT_voc, CT_isc, CT_pmax, Comprimento, Largura) values
		('Canadian', 'CS3U-380MS', 380, 47.8, 10.01, 37.2, 283, -0.0029, 0.0005, -0.0036, 2000, 992),
        ('Canadian', 'CS3W-450MS', 450, 48.7, 11.65, 37.7, 336, -0.0029, 0.0005, -0.0035, 2108, 1048),
        ('TRINA', 'TSM-DE17M(II)-450W', 450, 49.6, 11.53, 38.7, 340, -0.0025, 0.0004, -0.0034, 2102, 1040),
        ('JINKO', 'JKM535M-72HL4-BDVP', 535, 49.54, 13.83, 37.94, 398, -0.0028, 0.00048, -0.0035, 2274, 1134),
		('TRINA', 'TSM-405DE09.08', 405, 41.4, 12.34, 32.5, 306, -0.0025, 0.0004, -0.0034, 1754, 1096),
		('JINKO', 'JKM460M-60HL4-V', 460, 41.48, 14.01, 32.07, 342, -0.0028, 0.00048, -0.0035, 1903, 1134);
        
select * from modulo;

select * from modulo where Fabricante='JINKO';

select * from modulo order by Pmax_stc;

select * from modulo order by Pmax_stc desc;

select Fabricante, Modelo, Pmax_stc from modulo union all select Fabricante, Modelo, Potencia from inversor;

select avg(Pmax_stc) from modulo;

select sum(Pmax_stc) from modulo;

select * from inversor as i inner join modulo as m on i.idInversor = m.idModulo;

select i.Modelo, m.Modelo from inversor as i inner join modulo as m on i.Modelo = m.Modelo;

select i.Modelo, m.Modelo from inversor as i left join modulo as m on i.Modelo = m.Modelo;

select i.Modelo, m.Modelo from inversor as i right join modulo as m on i.Modelo = m.Modelo;

select i.Modelo, m.Modelo from inversor as i cross join modulo as m on i.Modelo = m.Modelo;

select i.Modelo, m.Modelo from inversor as i inner join modulo as m on i.idInversor = m.idModulo;

select i.Modelo, m.Modelo from inversor as i cross join modulo as m on i.idInversor = m.idModulo;

select i.Potencia, m.Pmax_stc from inversor as i inner join modulo as m on i.idInversor = m.idModulo;

select i.Potencia, m.Pmax_stc from inversor as i, modulo as m group by idInversor, idModulo;

select * from inversor as i, modulo as m group by idInversor, idModulo;

select * from modulo as m, inversor as i group by idInversor, idModulo;

select i.idInversor, i.Potencia, m.idModulo, m.Pmax_stc from inversor as i, modulo as m group by idInversor, idModulo order by Potencia desc;

select i.Fabricante, i.Modelo, i.Potencia, m.Fabricante, m.Modelo, m.Pmax_stc from inversor as i, modulo as m group by idInversor, idModulo order by Potencia desc, Pmax_stc desc;

select i.Fabricante, i.Modelo, i.Potencia, m.Fabricante, m.Modelo, m.Pmax_stc from inversor as i, modulo as m group by Potencia, Pmax_stc order by Potencia desc, Pmax_stc desc;

select i.Fabricante, i.Modelo, i.Potencia, m.Fabricante, m.Modelo, m.Pmax_stc from inversor as i, modulo as m group by Potencia, Pmax_stc having Potencia > 25000 order by Potencia desc, Pmax_stc desc;

select i.Fabricante, i.Modelo, i.Potencia, m.Fabricante, m.Modelo, m.Pmax_stc from inversor as i, modulo as m group by Potencia, Pmax_stc having Pmax_stc >= 450 order by Potencia desc, Pmax_stc desc;

select Pmax_stc + 10 from modulo order by Pmax_stc desc;

select Pmax_stc * 10 as Potencia_modulo_x10 from modulo;

select (Pmax_stc * 0.1) + Pmax_stc as Potencia_modulo_incremento_10percent from modulo order by Pmax_stc desc;

set @x=0.1;

select ((Pmax_stc * @x) + Pmax_stc) as Potencia_modulo_incremento_10percent from modulo order by Pmax_stc desc;

select format((Pmax_stc * @x) + Pmax_stc, 1) as 'Potencia_modulo_incremento_10%' from modulo order by Pmax_stc desc;

update modulo set Pmax_stc = 485 where idModulo = 6;

select Fabricante, Modelo, Pmax_stc from modulo where Modelo = 'JKM460M-60HL4-V';

select * from cliente as c, inversor as i where c.idCliente = idIcliente;

select * from cliente as c inner join inversor as i on c.idCliente = i.idIcliente;

select * from cliente as c inner join inversor as i on c.Fabricante = i.Fabricante;

select * from cliente as c, inversor as i group by c.Fabricante, i.Fabricante;

select * from cliente as c, inversor as i group by c.idCliente, i.idIcliente order by idCliente desc;