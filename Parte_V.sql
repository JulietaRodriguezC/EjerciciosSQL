------------------------------------------------------------------------------------------------------------------------------
/*TIPOS DE ÍNDICES*/
------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
1- Cree la tabla con la siguiente estructura:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
 );

2- Ingrese los siguientes registros:
 insert into agenda values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
 insert into agenda values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
 insert into agenda values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
 insert into agenda values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
 insert into agenda values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
 insert into agenda values('Ferreyra','Patricia','Colon 1534','4585858',null);
 insert into agenda values('Perez','Susana','San Martin 333',null,null);
 insert into agenda values('Perez','Luis','Urquiza 
444','0354545256','perezluisalberto@hotmail.com');
 insert into agenda values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

3- Cree un índice común por el campo apellido.

4- Cree un índice único por el mail.

5- Borre los dos índices.*/

--1
drop table if exists agenda;

create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
);
 
--2
insert into agenda values ('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
insert into agenda values ('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
insert into agenda values ('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
insert into agenda values ('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
insert into agenda values ('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
insert into agenda values ('Ferreyra','Patricia','Colon 1534','4585858',null);
insert into agenda values ('Perez','Susana','San Martin 333',null,null);
insert into agenda values ('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
insert into agenda values ('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

--3
create index I_agenda_apellido on agenda(apellido);

--4
create unique index I_agenda_mail on agenda(mail);

--5
drop index I_agenda_apellido;
drop index I_agenda_mail;

------------------------------------------------------------------------------------------------------------------------------
/*CLÁUSULAS LIMIT Y OFFSET DEL COMANDO SELECT*/
------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Cree la tabla con la siguiente estructura:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30)
 );

2- Ingrese 5 registros.

3- Realice una consulta limitando la salida a sólo 3 registros.

4- Muestre los registros desde el 2 al 4.

5- Muestre 4 registros a partir del 2 ordenado por apellido.*/

--1
drop table if exists agenda;

create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30)
);

--2
insert into agenda(apellido,nombre,telefono) values ('Perez','Sebastian','2494999999');
insert into agenda(apellido,nombre,telefono) values ('Cruz','Mirta','2494001998');
insert into agenda(apellido,nombre,telefono) values ('Olmedo','Beatriz','443567');
insert into agenda values ('Martin','Osvaldo','Las heras 453','211345467','martinosvaldo@gmail.com');
insert into agenda values ('Torres','Viviana','Saenz Peña 112',null,'vivianatorres@gmail.com');

--3
select *
from agenda
limit 3;

--4
select *
from agenda
limit 3
offset 2;

--5
select *
from agenda
order by apellido
limit 4
offset 2;

--------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIÓN INTERNA (INNER JOIN)*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra
los nombres de las provincias.

1- Créelas con las siguientes estructuras:
 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
   values ('Torres Fabiola','Alem 777','Ibera',3);

3- Obtenga los datos de ambas tablas, usando alias

4- Obtenga la misma información anterior pero ordenada por nombre de provincia.

5- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos)*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
);

drop table if exists provincias;
 
 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
);
 
--2
insert into provincias (nombre) values ('Cordoba');
insert into provincias (nombre) values ('Santa Fe');
insert into provincias (nombre) values ('Corrientes');

insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Torres Fabiola','Alem 777','Ibera',3);

--3
select *
from clientes as c inner join provincias p on (c.codigoprovincia = p.codigo);

--4
select *
from clientes as c inner join provincias as p on (c.codigoprovincia = p.codigo)
order by p.nombre;

--5
select c.nombre, c.domicilio, c.ciudad
from clientes as c inner join provincias as p on (c.codigoprovincia = p.codigo)
where p.nombre like 'Santa Fe';

/*Segundo problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "inscriptos" que incluye el 
documento, el nombre, el deporte y si la matricula esta paga o no y una tabla llamada "inasistencias" que incluye el 
documento, el deporte y la fecha de la inasistencia.
1 - Cree las tablas:

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 );

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
 );

2- Ingrese algunos registros para ambas tablas:
 insert into inscriptos values('Juan Perez','22222222','tenis','s');
 insert into inscriptos values('Maria Lopez','23333333','tenis','s');
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
 insert into inscriptos values('Marta Garcia','25555555','natacion','s');
 insert into inscriptos values('Juan Perez','22222222','natacion','s');
 insert into inscriptos values('Maria Lopez','23333333','natacion','n');

 insert into inasistencias values('22222222','tenis','2006-12-01');
 insert into inasistencias values('22222222','tenis','2006-12-08');
 insert into inasistencias values('23333333','tenis','2006-12-01');
 insert into inasistencias values('24444444','tenis','2006-12-08');
 insert into inasistencias values('22222222','natacion','2006-12-02');
 insert into inasistencias values('23333333','natacion','2006-12-02');

3- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte. Note que la condición es 
compuesta porque para identificar los registros de la tabla "inasistencias" necesitamos ambos campos.

4- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado inscripto en un determinado deporte (3 registros)

5- Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la matrícula(4 registros)
*/

--1
drop table if exists inscriptos;

create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
);

drop table if exists inasistencias;

create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha date
);

--2
insert into inscriptos values ('Juan Perez','22222222','tenis','s');
insert into inscriptos values ('Maria Lopez','23333333','tenis','s');
insert into inscriptos values ('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values ('Marta Garcia','25555555','natacion','s');
insert into inscriptos values ('Juan Perez','22222222','natacion','s');
insert into inscriptos values ('Maria Lopez','23333333','natacion','n');

insert into inasistencias values ('22222222','tenis','2006-12-01');
insert into inasistencias values ('22222222','tenis','2006-12-08');
insert into inasistencias values ('23333333','tenis','2006-12-01');
insert into inasistencias values ('24444444','tenis','2006-12-08');
insert into inasistencias values ('22222222','natacion','2006-12-02');
insert into inasistencias values ('23333333','natacion','2006-12-02');

--3
select inscr.nombre, inscr.deporte, inas.fecha
from inscriptos as inscr inner join inasistencias as inas on (inscr.documento = inas.documento and inscr.deporte = inas.deporte)
order by inscr.nombre,inscr.deporte;
															  
--4
select inscr.nombre, inscr.deporte, inas.fecha
from inscriptos as inscr inner join inasistencias as inas on (inscr.documento = inas.documento and inscr.deporte = inas.deporte)
where inscr.documento like '22222222'
order by inscr.nombre,inscr.deporte;

--5
select inscr.nombre, inscr.deporte, inas.fecha
from inscriptos as inscr inner join inasistencias as inas on (inscr.documento = inas.documento and inscr.deporte = inas.deporte)
where inscr.matricula like 's'
order by inscr.nombre,inscr.deporte;

--------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIÓN EXTERNA IZQUIERDA (LEFT JOIN)*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra 
los nombres de las provincias.
1- Cree las tablas:

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values ('Garcia Luis','Sucre 475','Santa Rosa',5);

3- Muestre todos los datos de los clientes, incluido el nombre de la provincia

4- Realice la misma consulta anterior pero alterando el orden de las tablas

5- Muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)

6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por nombre del cliente (2 registros)

7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros)*/

--1
drop table if exists clientes;

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
);

drop table if exists provincias;

create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
);

--2
insert into provincias (nombre) values ('Cordoba');
insert into provincias (nombre) values ('Santa Fe');
insert into provincias (nombre) values ('Corrientes');

insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3
select c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre
from clientes as c left join provincias as p on (c.codigoprovincia = p.codigo);

--4
select c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre
from provincias as p left join clientes as c on (p.codigo = c.codigoprovincia);

--5
select c.nombre
from clientes as c left join provincias as p on (c.codigoprovincia = p.codigo)
where p.codigo is not null;

--6
select c.nombre
from clientes as c left join provincias as p on (c.codigoprovincia = p.codigo)
where c.codigoprovincia is null
order by c.nombre;

--7
select c.codigo, c.nombre, c.domicilio, c.ciudad
from clientes as c left join provincias as p on (c.codigoprovincia = p.codigo)
where p.nombre like 'Cordoba';

--------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIÓN EXTERNA DERECHA (RIGHT JOIN)*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra 
los nombres de las provincias.
1-Cree las tablas:
 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
   values ('Garcia Luis','Sucre 475','Santa Rosa',5);

3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right join".

4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".

5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)

6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por ciudad (2 registros)*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint not null,
  primary key(codigo)
);

drop table if exists provincias;

create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
);

--2
insert into provincias (nombre) values('Cordoba');
insert into provincias (nombre) values('Santa Fe');
insert into provincias (nombre) values('Corrientes');

insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Torres Fabiola','Alem 777','La Plata',4);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Garcia Luis','Sucre 475','Santa Rosa',5);

--3
select c.nombre,c.domicilio,c.ciudad,p.nombre
from clientes as c right join provincias as p on (c.codigoprovincia = p.codigo);

--4
select c.nombre,c.domicilio,c.ciudad,p.nombre
from provincias as p left join clientes as c on (p.codigo = c.codigoprovincia);

--5
select c.nombre,c.domicilio,c.ciudad,p.nombre
from clientes as c right join provincias as p on (c.codigoprovincia = p.codigo)
where p.codigo is not null;

--6
select c.nombre,c.domicilio,c.ciudad,p.nombre
from clientes as c right join provincias as p on (c.codigoprovincia = p.codigo)
where p.codigo is null
order by ciudad;

--------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIÓN EXTERNA COMPLETA (FULL JOIN)*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "deportes" en la cual incluye el nombre 
del deporte y el nombre del profesor y en otra tabla llamada "inscriptos" que incluye el documento del socio que se inscribe, el 
deporte y si la matricula está paga o no.
1- Cree las tablas:

 create table deportes(
  codigo serial,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte smallint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

2- Ingrese algunos registros para ambas tablas:
 insert into deportes(nombre,profesor) values('tenis','Marcelo Roca');
 insert into deportes(nombre,profesor) values('natacion','Marta Torres');
 insert into deportes(nombre,profesor) values('basquet','Luis Garcia');
 insert into deportes(nombre,profesor) values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('22222222',5,'n'); 
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 

3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para obtener el nombre de 
cada deporte (6 registros)

4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)

5- Obtenga la misma salida anterior empleando un "rigth join".

6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)

7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 registro)

8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones a deportes inexistentes 
en "deportes" y los deportes que no tienen inscriptos (8 registros)*/

--1
drop table if exists deportes;

create table deportes(
  codigo serial,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
);

drop table if exists inscriptos;

create table inscriptos(
  documento char(8),
  codigodeporte smallint not null,
  matricula char(1) --'s'=paga 'n'=impaga
);

--2
insert into deportes(nombre,profesor) values ('tenis','Marcelo Roca');
insert into deportes(nombre,profesor) values ('natacion','Marta Torres');
insert into deportes(nombre,profesor) values ('basquet','Luis Garcia');
insert into deportes(nombre,profesor) values ('futbol','Marcelo Roca');
 
insert into inscriptos values ('22222222',3,'s');
insert into inscriptos values ('23333333',3,'s');
insert into inscriptos values ('24444444',3,'n');
insert into inscriptos values ('22222222',2,'s');
insert into inscriptos values ('22222222',5,'n'); 
insert into inscriptos values ('23333333',2,'s');
insert into inscriptos values ('22222222',4,'n');

--3
select i.documento, i.matricula, d.nombre
from inscriptos as i join deportes as d on (i.codigodeporte = d.codigo);

--4
select i.documento, i.matricula, d.nombre, d.profesor
from inscriptos as i left join deportes as d on (i.codigodeporte = d.codigo);

--5
select i.documento, i.matricula, d.nombre, d.profesor
from deportes as d right join inscriptos as i on (d.codigo = i.codigodeporte);

--6
select d.nombre
from deportes as d left join inscriptos as i on (d.codigo = i.codigodeporte)
where i.codigodeporte is null;

--7
select documento
from inscriptos as i left join deportes as d on (i.codigodeporte = d.codigo)
where d.codigo is null;

--8
select *
from inscriptos as i full join deportes as d on (i.codigodeporte = d.codigo);

--------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIONES CRUZADAS (CROSS JOIN)*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una agencia matrimonial almacena la información de sus clientes de sexo femenino en una tabla llamada "mujeres" y en otra la de 
sus clientes de sexo masculino llamada "varones".
1- Cree las tablas:

 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

2- Ingrese los siguientes registros:
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo masculino. Use un "cross join" (12 registros)

4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 registros)

5- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 registros)*/

--1
drop table if exists mujeres;

create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
);

drop table if exists varones;

create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
);

--2
insert into mujeres values ('Maria Lopez','Colon 123',45);
insert into mujeres values ('Liliana Garcia','Sucre 456',35);
insert into mujeres values ('Susana Lopez','Avellaneda 98',41);

insert into varones values ('Juan Torres','Sarmiento 755',44);
insert into varones values ('Marcelo Oliva','San Martin 874',56);
insert into varones values ('Federico Pereyra','Colon 234',38);
insert into varones values ('Juan Garcia','Peru 333',50);

--3
select m.nombre, v.nombre
from mujeres m cross join varones v;

--4
select m.nombre, v.nombre
from mujeres m cross join varones v
where m.edad > 40 
  and v.edad > 40;

--5
select m.nombre, v.nombre
from mujeres m cross join varones v
where abs(m.edad - v.edad) <= 10;

/*Segundo problema:
Una empresa de seguridad almacena los datos de sus guardias de seguridad en una tabla llamada "guardias". También almacena 
los distintos sitios que solicitaron sus servicios en una tabla llamada "tareas".

1- Cree las tablas:
 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), -- 'f' o 'm'
  domicilio varchar(30),
  primary key (documento)
 );

 create table tareas(
  codigo serial,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), -- 'AM' o 'PM'
  primary key (codigo)
 );

2- Ingrese los siguientes registros:
 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas(domicilio,descripcion,horario) 
   values('Colon 1111','vigilancia exterior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas(domicilio,descripcion,horario)
   values('Peru 345','vigilancia interior','AM');
 insert into tareas(domicilio,descripcion,horario)
   values('Avellaneda 890','vigilancia interior','PM');

3- La empresa quiere que todos sus empleados realicen todas las tareas. Realice una "cross join" (20 registros)

4- En este caso, la empresa quiere que todos los guardias de sexo femenino realicen las tareas de "vigilancia interior" 
y los de sexo masculino de "vigilancia exterior". Realice una "cross join" con un "where" que controle tal requisito 
(10 registros)*/

--1
drop table if exists guardias;

create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), -- 'f' o 'm'
  domicilio varchar(30),
  primary key (documento)
);

drop table if exists tareas;

create table tareas(
  codigo serial,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), -- 'AM' o 'PM'
  primary key (codigo)
);

--2
insert into guardias values ('22333444','Juan Perez','m','Colon 123');
insert into guardias values ('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values ('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values ('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values ('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas(domicilio,descripcion,horario) values ('Colon 1111','vigilancia exterior','AM');
insert into tareas(domicilio,descripcion,horario) values ('Urquiza 234','vigilancia exterior','PM');
insert into tareas(domicilio,descripcion,horario) values ('Peru 345','vigilancia interior','AM');
insert into tareas(domicilio,descripcion,horario) values ('Avellaneda 890','vigilancia interior','PM');

--3
select g.documento, g.nombre, t.domicilio, t.descripcion, t.horario
from guardias g cross join tareas t;

--4
select g.documento, g.nombre, g.sexo, t.domicilio, t.descripcion
from guardias g cross join tareas t
where (g.sexo like 'f' and t.descripcion like 'vigilancia interior')
   or (g.sexo like 'm' and t.descripcion like 'vigilancia exterior');
 
--------------------------------------------------------------------------------------------------------------------------------
/*AUTOCOMBINACIÓN*/
--------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una agencia matrimonial almacena la información de sus clientes en una tabla llamada "clientes".
1- Cree la tabla:
 create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo masculino. Use un  "cross join" 
(12 registros)

4- Obtenga la misma salida anterior pero realizando un "join".

5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no tengan una diferencia superior 
a 5 años (5 registros)*/

--1
drop table if exists clientes;

create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
);

--2
insert into clientes values ('Maria Lopez','f',45,'Colon 123');
insert into clientes values ('Liliana Garcia','f',35,'Sucre 456');
insert into clientes values ('Susana Lopez','f',41,'Avellaneda 98');
insert into clientes values ('Juan Torres','m',44,'Sarmiento 755');
insert into clientes values ('Marcelo Oliva','m',56,'San Martin 874');
insert into clientes values ('Federico Pereyra','m',38,'Colon 234');
insert into clientes values ('Juan Garcia','m',50,'Peru 333');

--3
select c1.nombre, c2.nombre
from clientes c1 cross join clientes c2
where c1.sexo like 'f'
  and c2.sexo like 'm';
  
--4
select c1.nombre, c2.nombre
from clientes c1 join clientes c2 on (c1.nombre <> c2.nombre)
where c1.sexo like 'f'
  and c2.sexo like 'm';
  
--5
select c1.nombre, c1.edad, c2.nombre, c2.edad
from clientes c1 cross join clientes c2
where c1.sexo like 'f'
  and c2.sexo like 'm'
  and abs(c1.edad - c2.edad) <= 5;
  
/*Segundo problema:
Varios clubes de barrio se organizaron para realizar campeonatos entre ellos. La tabla llamada "equipos" guarda la 
información de los distintos equipos que jugarán.
1- Cree la tabla:
 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

3- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" para combinar los 
equipos teniendo en cuenta que un equipo no juega consigo mismo (12 registros)

4- Obtenga el mismo resultado empleando un "join".*/

--1
drop table if exists equipos;

create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
);

--2
insert into equipos values ('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into equipos values ('Los leones','Centro','Colon 123','Gustavo Fuentes');
insert into equipos values ('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into equipos values ('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

--3
select eq1.nombre, eq2.nombre, eq1.barrio
from equipos eq1 cross join equipos eq2 
where eq1.nombre <> eq2.nombre;

--4
select eq1.nombre, eq2.nombre, eq1.barrio
from equipos eq1 join equipos eq2 on (eq1.nombre <> eq2.nombre);

-------------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIONES Y FUNCIONES DE AGRUPAMIENTO*/
-------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan 
o compran en su stand para luego enviarle publicidad de sus productos y en otra tabla llamada "ciudades" los nombres de las ciudades.
1- Cree las tablas:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad smallint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
 );
 
2- Ingrese algunos registros:
 insert into ciudades(nombre) values('Cordoba');
 insert into ciudades(nombre) values('Carlos Paz');
 insert into ciudades(nombre) values('La Falda');
 insert into ciudades(nombre) values('Cruz del Eje');

 insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);

3- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)

4- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)

5- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)

6- Obtenga el monto de compra más alto de cada ciudad (3 filas)*/

--1
drop table if exists visitantes;

create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad smallint not null,
  mail varchar(30),
  montocompra decimal (6,2)
);

drop table if exists ciudades;

create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
);

--2
insert into ciudades(nombre) values('Cordoba');
insert into ciudades(nombre) values('Carlos Paz');
insert into ciudades(nombre) values('La Falda');
insert into ciudades(nombre) values('Cruz del Eje');

insert into visitantes values ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
insert into visitantes values ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
insert into visitantes values ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
insert into visitantes values ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
insert into visitantes values ('Alejandra Garcia',28,'f',null,2,null,280.50);
insert into visitantes values ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
insert into visitantes values ('Mariana Juarez',33,'f',null,2,null,90);

--3
select c.nombre, count(*) as "#Visitantes"
from visitantes v inner join ciudades c on (v.codigociudad = c.codigo)
group by c.nombre;

--4
select c.nombre, v.sexo, avg(montocompra) as "Promedio de gastos"
from visitantes v inner join ciudades c on (v.codigociudad = c.codigo)
group by c.nombre, v.sexo;

--5
select c.nombre, count(v.mail) as "#Visitantes con mail"
from visitantes v inner join ciudades c on (v.codigociudad = c.codigo)
group by c.nombre;

--6
Obtenga el monto de compra más alto de cada ciudad 
select c.nombre, max(v.montocompra) as "Máx montocompra"
from visitantes v inner join ciudades c on (v.codigociudad = c.codigo)
group by c.nombre;
