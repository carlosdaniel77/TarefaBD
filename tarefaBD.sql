create database Suporte;
use Suporte;

create table usuario(
idUsuario int primary key auto_increment,
password varchar(100)not null,
nomeUsuario varchar(50)not null,
ramal int not null,
especialidade varchar(20)not null
);

create table maquina(
idMaquina int primary key auto_increment,
tipo varchar(20) not null,
velocidade varchar(20) not null,
hardDisk varchar(15) not null,
placaRede varchar(20) not null,
memoriaRam varchar(15) not null
);

create table software(
idSoftware int primary key auto_increment,
produto varchar(30) not null,
hardDisk varchar(15) not null,
memoriaRam varchar(15) not null
);

create table possuem(
idPossuem int primary key auto_increment,
idUsuario int,
idMaquina int,
foreign key(idUsuario) references usuario(idUsuario),
foreign key(idMaquina) references maquina(idMaquina)
);

create table instalado(
idInstalado int primary key auto_increment,
idMaquina int,
idSoftware int,
foreign key(idMaquina) references maquina (idMaquina),
foreign key(idSoftware) references software (idSoftware)
);


--1º
select*from usuario where especialidade like 'técnico';
--2º
select tipo, velocidade from maquina;
--3º
select tipo, velocidade from maquina where tipo in('Core ||', 'Pentium');
--4º
select tipo, placaRede from maquina where placaRede < 10;
--5º
select u.nomeUsuario, m.tipo from usuario as u 
inner join possuem as p ON u.idUsuario = p.idUsuario
inner join maquina as m  ON m.idMaquina = p.idMaquina
where m.tipo = 'CORE |||' OR m.tipo = 'CORE V';
--6º
select m.idMaquina from maquina as m
INNER JOIN instalado as i ON m.idMaquina = i.idInstalado
where i.idMaquina = "C++";
--7º
select m.idMaquina, m.memoriaRam, produto, s.memoriaRam 
from maquina as m inner join software as s where ((m.memoriaRam<s.memoriaRam));
--8º
select distinct u.nomeUsuario, m.velocidade from usuario as u 
INNER JOIN maquina as m 
INNER JOIN possuem as p 
where u.idUsuario = p.idUsuario and
m.idMaquina = p.idPossuem;
--9º
select distinct u.nomeUsuario, u.idUsuario from usuario as u, usuario as s
where s.nomeUsuario = "Maria" and s.idUsuario > u.idUsuario;
--10º
select count(*) idMaquina from maquina 
where velocidade > 2.4;
--11º
select count(*) idMaquina
from possuem;
--12º
select tipo, count(possuem.idUsuario) 
from maquina inner join possuem
where maquina.idMaquina = possuem.idMaquina
group by maquina.tipo;
--13º
select count(possuem.idUsuario) as contardeidUsuario
from maquina inner join possuem 
on maquina.idMaquina = possuem.idMaquina
and tipo="Dual Core";
--14º
select sum(hardDisk) as somaRAM
from software
where produto = "word" or produto = "lotus";
--15º
select instalado.idMaquina, sum(software.hardDisk) as somaDisk
from software inner join instalado
where instalado.idSoftware = software.idSoftware
group by instalado.idMaquina; 
--16º
select avg(hardDisk) as mediaHardDisk
from software;
--17°
select tipo, count(idMaquina)
from maquina
group by tipo;
--18º
select count(idSoftware) as contagem
from software
where hardDisk between 90 and 250;
--19º
select idSoftware, produto
from software 
where produto like "O";
--20º
select maquina.idMaquina, maquina.hardDisk
from maquina 
where hardDisk > all 
(select hardDisk 
from software);
--21º
select distinct produto
from software
where exists
(select *
from instalado 
where software.idSoftware = instalado.idSoftware);
--22º
select distinct produto
from software
where not exists
(select *
from instalado
where software.idSoftware = instalado.idSoftware);
--23º
select idUsuario, nomeUsuario
from usuario
where especialidade is null;
--24º
select idUsuario, nomeUsuario
from usuario
order by nomeUsuario;
--25º
create table maquina(
idMaquina int primary key auto_increment,
tipo varchar(20) not null,
velocidade varchar(20) not null,
hardDisk varchar(15) not null,
placaRede varchar(20) not null,
memoriaRam varchar(15) not null
);
create table Instalado(
idInstalado int primary key auto_increment,
idMaquina int,
idSoftware int,
foreign key(idMaquina) references maquina (idMaquina),
foreign key(idSoftware) references software (idSoftware)
);
--26º
delete from software
where hardDisk < 200;
--27º
insert into software(idSoftware, produto, hardDisk, memoriaRam)
values ('202', 'Video Litht', 300, 50);
--28º
update maquina
set memoriaRam = memoriaRam * 1.2
where tipo='Ultra New';