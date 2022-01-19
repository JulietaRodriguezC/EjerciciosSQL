--------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES DE AGRUPAMIENTO*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".

1- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

3- Muestre la cantidad de empleados usando "count" (9 empleados)

4- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)

5- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)

6- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	

7- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
tenido en cuenta)

8- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)

9- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)*/

--1
drop table if exists empleados;

create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  primary key(documento)
 );

 --2
insert into empleados values ('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
insert into empleados values ('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
insert into empleados values ('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
insert into empleados values ('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
insert into empleados values ('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
insert into empleados values ('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
insert into empleados values ('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
insert into empleados values ('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
insert into empleados values ('Andres Costa','28444555',default,'Secretaria',null,null);

--3
select count(documento) as "#empleados"
from empleados;

--4
select count(sueldo) as "#secretarias con sueldo"
from empleados
where seccion like 'Secretaria';

--5
select max(sueldo) as "Sueldo máx", min(sueldo) as "Sueldo mín"
from empleados;

--6
select max(cantidadhijos) as "Mayor #hijos"
from empleados
where nombre like 'Perez';

--7 
select avg(sueldo) as "Sueldo promedio"
from empleados;

--8
select avg(sueldo) as "Sueldo promedio secretaría"
from empleados
where seccion like 'Secretaria';

--9
select avg(cantidadhijos) as "Promedio de hijos de sist"
from empleados
where seccion like 'Sistemas';

------------------------------------------------------------------------------------------------------------------------------------
/*AGRUPAR REGISTROS*/
------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o 
compran en su stand para luego enviarle publicidad de sus productos.

1- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

2- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

3- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)

4- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)

5- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)

6- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)

7- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)

8- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (4 filas)*/

--1
drop table if exists visitantes;

create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
);

--2
insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
insert into visitantes (nombre, edad,sexo,telefono, mail) values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
insert into visitantes (nombre, ciudad, montocompra) values ('Alejandra Gonzalez','La Falda',280.50);
insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra) values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
insert into visitantes values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
insert into visitantes values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

--3
select ciudad,count(*) as "#visitantes"
from visitantes
group by ciudad;

--4
select ciudad,count(telefono) as "#visitantes"
from visitantes
group by ciudad;

--5
select sexo, sum(montocompra) as "Monto Total"
from visitantes
group by sexo;

--6
select sexo, ciudad, max(montocompra) as "Máx monto compra", min(montocompra) as "Mín monto compra"
from visitantes
group by sexo, ciudad;

--7
select ciudad, avg(montocompra) as "Promedio monto compra"
from visitantes
group by ciudad;

--8
select ciudad, count(mail) as "#visitantes"
from visitantes
group by ciudad;

/*Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".
1- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  fechaingreso date,
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);

3- Cuente la cantidad de empleados agrupados por sección (5 filas)

4- Calcule el promedio de hijos por sección (5 filas)

5- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)

6- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)*/

--1
drop table if exists empleados;

create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos smallint,
  fechaingreso date,
  primary key(documento)
);

--2
insert into empleados values ('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
insert into empleados values ('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
insert into empleados values ('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
insert into empleados values ('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
insert into empleados values ('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
insert into empleados values ('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
insert into empleados values ('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
insert into empleados values ('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
insert into empleados values ('Andres Costa','28444555',default,'Secretaria',null,null,null);

--3
select seccion, count(*) as "#Empleados"
from empleados
group by seccion;

--4
select seccion, avg(cantidadhijos) as "#Hijos"
from empleados
group by seccion;

--5
select extract(year from fechaingreso) as "Año", count(*) as "#Empleados que ingresaron"
from empleados
group by 1
order by 1;

--6
select seccion, avg(sueldo) as "Promedio Sueldo"
from empleados
where cantidadhijos > 0
  and cantidadhijos is not null
group by seccion;

-----------------------------------------------------------------------------------------------------------------------------------------
/*SELECCIONAR GRUPOS*/
-----------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabajemos con la tabla "libros" de una librería.

1- Cree la tabla con la siguiente estructura:
 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
 );
2- Ingrese algunos registros:

 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',35,null);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Planeta',40,200);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Mario Molina','Emece',18,null);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('PHP de la A a la Z',null,null,110,0);
 insert into libros(titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta',25,null);
3- Obtenga la cantidad de libros agrupados por editorial pero considerando sólo los grupos que devuelvan un valor mayor a 2.

4- Obtenga el promedio de los precios de los libros agrupados por editorial, pero solamente de aquellos grupos cuyo promedio supere los 25 pesos.

5- Obtenga la cantidad de libros, sin considerar los que tienen precio nulo (where), agrupados por editorial (group by), sin considerar la 
editorial "Planeta" (having).

6- Obtenga el promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros distintos.

7- Obtenga el mayor valor de los libros agrupados y ordenados por editorial y seleccionamos las filas que tienen un valor menor a 100 y mayor a 30.*/

--1
drop table if exists libros;

create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
);

--2
insert into libros(titulo,autor,editorial,precio,cantidad) values ('El aleph','Borges','Planeta',35,null);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Martin Fierro','Jose Hernandez','Planeta',40,200);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Aprenda PHP','Mario Molina','Emece',18,null);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('PHP de la A a la Z',null,null,110,0);
insert into libros(titulo,autor,editorial,precio,cantidad) values ('Uno','Richard Bach','Planeta',25,null);

--3
select editorial, count(*) as "#Libros"
from libros
group by editorial
having count(*) > 2;

--4
select editorial, avg(precio) as "Promedio de precios"
from libros
group by editorial
having avg(precio) > 25;

--5
select editorial, count(*) as "#Libros"
from libros
where precio is not null 
group by editorial
having editorial not like 'Planeta';

--otra forma
select editorial, count(precio) as "#Libros"
from libros
group by editorial
having editorial not like 'Planeta';

--6
select editorial, avg(precio) as "Promedio de precios"
from libros
group by editorial
having count(*) > 2;

--7
select editorial, max(precio) as "Mayor precio"
from libros
group by editorial
having max(precio) between 30 and 100
order by editorial;

/*Segundo problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran 
en su stand para luego enviarle publicidad de sus productos.

1- Créela con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

2- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

3- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un valor superior a 50 (3 filas)

4- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras y el promedio de compras, ordenado por 
la suma total y considerando las filas con promedio superior a 30 (3 filas)*/

--1
drop table if exists visitantes;

create table visitantes(
  nombre varchar(30),
  edad smallint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
);

--2
insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

--3
select ciudad, sexo, sum(montocompra) as "#Compras"
from visitantes
group by ciudad, sexo
having sum(montocompra) > 50;

--4
select ciudad, sexo, count(*) as "#Visitantes", sum(montocompra) as "Suma compras", avg(montocompra) as "Promedio compras"
from visitantes
group by ciudad, sexo
having avg(montocompra) > 30
order by 4;

------------------------------------------------------------------------------------------------------------------------------------------
/*REGISTROS DUPLICADOS*/
------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes".

1- Créela con la siguiente estructura:
 create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

2- Ingrese algunos registros:
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes(nombre,domicilio,ciudad,provincia)
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

3- Obtenga las provincias sin repetir (3 registros)

4- Cuente las distintas provincias.

5- Se necesitan los nombres de las ciudades sin repetir (6 registros)

6- Obtenga la cantidad de ciudades distintas.

7- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)

8- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

--2
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clientes(nombre,domicilio,ciudad,provincia) values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

--3
select distinct provincia
from clientes;

--4
select count(distinct provincia) as "#Provincias distintas"
from clientes;

--5
select distinct ciudad
from clientes;

--6
select count(distinct ciudad) as "#Ciudades distintas"
from clientes;

--7
select distinct ciudad
from clientes
where provincia like 'Cordoba';

--8
select provincia, count(distinct ciudad) as "#Ciudades distintas"
from clientes
group by provincia;

/*Segundo problema:
La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus propietarios para cobrar impuestos.

1- Créela con la siguiente estructura:
 create table inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
 );

2- Ingrese algunos registros:
 insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

3- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)

4- Muestre los distintos documentos de los propietarios, sin repetir (6 registros)

5- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)

6- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2)

7- Muestre los apellidos y nombres, sin repetir (5 registros) Note que hay 2 personas con igual nombre y apellido que aparece una sola vez.

8- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir barrio (6 registros)*/

--1
drop table if exists inmuebles;

create table inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
);

--2
insert into inmuebles values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
insert into inmuebles values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
insert into inmuebles values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
insert into inmuebles values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
insert into inmuebles values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
insert into inmuebles values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
insert into inmuebles values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
insert into inmuebles values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
insert into inmuebles values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

--3
select distinct apellido
from inmuebles;

--4
select distinct documento
from inmuebles;

--5
select count(distinct documento) as "#Propietarios de Córdoba"
from inmuebles
where ciudad like 'Cordoba';

--6
select count(distinct ciudad) as "#Inmuebles"
from inmuebles
where domicilio like 'San Martin %';

--7
select distinct apellido, nombre
from inmuebles;

--8
 Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir barrio
select documento, count(distinct barrio) as "#Inmuebles"
from inmuebles
group by documento;

------------------------------------------------------------------------------------------------------------------------------------------
/*CLAVE PRIMARIA COMPUESTA*/
------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un consultorio médico en el cual trabajan 3 médicos registra las consultas de los pacientes en una tabla llamada "consultas".

1- La tabla contiene los siguientes datos:
  - fechayhora: timestamp not null, fecha y hora de la consulta,
  - medico: varchar(30), not null, nombre del médico (Perez,Lopez,Duarte),
  - documento: char(8) not null, documento del paciente,
  - paciente: varchar(30), nombre del paciente,
  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
 );

2- Un médico sólo puede atender a un paciente en una fecha y hora determinada. En una fecha y hora determinada, varios médicos atienden a 
distintos pacientes. Cree la tabla definiendo una clave primaria compuesta:
 create table consultas(
  fechayhora timestamp not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

3- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.

4- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.

5- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.*/

--2
drop table if exists consultas;

create table consultas(
  fechayhora timestamp not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

--3
insert into consultas values ('2006-10-05 09:30','Bernardo Perez','12345678','Julia Gonzales','PAMI');
insert into consultas values ('2006-10-05 09:45','Bernardo Perez','23456789','Alberto Gimenez','PAMI');
insert into consultas values ('2006-10-05 10:20','Bernardo Perez','87654321','Constanza Daneri','IPAM');
insert into consultas values ('2006-10-05 11:25','Bernardo Perez','98765432','Ignacio Icardi','OSDE');

--4
insert into consultas values ('2010-04-22 15:30','Bernardo Perez','45612387','Marisol Ramos','PAMI');
insert into consultas values ('2010-04-22 15:30','Daniel Lopez','32132132','Miguel Alvarez','OSDE');
insert into consultas values ('2010-04-22 15:30','Domingo Duarte','78998711','Solange Arias','OSDE');

--5
insert into consultas values ('2010-07-14 15:30','Domingo Duarte','12233344','Monica Velazquuez','IPAM');
insert into consultas values ('2010-07-14 15:30','Domingo Duarte','77788899','Fidel Rojas','IPAM');
/*da error(ERROR:  llave duplicada viola restricción de unicidad «consultas_pkey» 
DETAIL:  Ya existe la llave (fechayhora, medico)=(2010-07-14 15:30:00, Domingo Duarte).)*/

/*Segundo problema:
Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la información necesaria.

1- La tabla contiene los siguientes campos:
 - documento del socio alumno: char(8) not null
 - nombre del socio: varchar(30),
 - nombre del deporte (tenis, futbol, natación, basquet): varchar(15) not null,
 - año de inscripcion: smallint,
 - matrícula: si la matrícula ha sido o no pagada ('s' o 'n').

2- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en varios deportes en distintos años. Un 
socio no puede inscribirse en el mismo deporte el mismo año. Varios socios se inscriben en un mismo deporte en distintos años. Cree la 
tabla con una clave compuesta:
 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año date,
  matricula char(1),
  primary key(documento,deporte,año)
 );

3- Inscriba a varios alumnos en el mismo deporte en el mismo año

4- Inscriba a un mismo alumno en varios deportes en el mismo año

5- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos años

6- Intente actualizar un registro para que la clave primaria se repita.*/

--2
drop table if exists inscriptos;

create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año smallint,
  matricula char(1),
  primary key(documento,deporte,año)
);

--3
insert into inscriptos values ('12345678','Agustin Muñoz','Tenis','2007','s');
insert into inscriptos values ('23456789','Agustina Diaz','Tenis','2007','s');
insert into inscriptos values ('12341234','Lorena Mujica','Tenis','2007','n');

--4
insert into inscriptos values ('23456789','Agustina Diaz','Futbol','2007','s');
insert into inscriptos values ('23456789','Agustina Diaz','Hockey','2007','n');

--5
insert into inscriptos values ('12345678','Agustin Muñoz','Hockey','2007','s');
insert into inscriptos values ('12345678','Agustin Muñoz','Hockey','2009','s');

--6
update inscriptos set documento = '12345678', deporte = 'Tenis', año = '2007'
where nombre like '%Muñoz';
/*da error(ERROR:  llave duplicada viola restricción de unicidad «inscriptos_pkey»
DETAIL:  Ya existe la llave (documento, deporte, "año")=(12345678, Tenis, 2007).*/

------------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIÓN CHECK*/
------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento date,
  cantidadhijos smallint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

2- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el sueldo.

3- Ingrese algunos registros válidos:
 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

4- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el valor 5000. La sentencia no se ejecuta 
porque hay un sueldo que no cumple la restricción.

5- Elimine el registro infractor y vuelva a crear la restricción.

6- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la fecha actual.

7- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.

8- Vea todas las restricciones de la tabla (5 filas)

9- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo". Mensaje de error porque se infringe la 
restricción "CK_empleados_sueldo_positivo".

10- Intente agregar un registro con fecha de nacimiento futura. Mensaje de error.

11- Intente modificar un registro colocando en "cantidadhijos" el valor "21". Mensaje de error.*/

--1
drop table if exists empleados;

create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento date,
  cantidadhijos smallint,
  seccion varchar(20),
  sueldo decimal(6,2)
);

--2
alter table empleados
add constraint CK_empleados_sueldopositivo
check (sueldo >= 0);

--3
insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

--4 y 5
alter table empleados
add constraint CK_empleados_sueldomaximo
check (sueldo <= 5000);
/*da error(ERROR:  la restricción check «ck_empleados_sueldomaximo» de la relación «empleados» es violada por alguna fila)*/

--5
delete from empleados
where sueldo > 5000;

--6
alter table empleados
add constraint CK_empleados_fechaactualpostnacimiento
check (fechanacimiento < current_date);

--7
alter table empleados
add constraint CK_empleados_maximacantidadhijos
check (cantidadhijos between 0 and 15);

--8
select *
from information_schema.table_constraints
where table_name = 'empleados';

--9
insert into empleados values ('34586791','Miguel Casan','1978/02/20',0,'Contaduría',-4500);
/*da error(ERROR:  el nuevo registro para la relación «empleados» viola la restricción «check» «ck_empleados_sueldopositivo»
DETAIL:  La fila que falla contiene (34586791, Miguel Casan, 1978-02-20, 0, Contaduría, -4500.00).)*/

--10
insert into empleados values ('34586791','Miguel Casan','2023/02/20',0,'Contaduría',4500);
/*da error(ERROR:  el nuevo registro para la relación «empleados» viola la restricción «check» «ck_empleados_fechaactualpostnacimiento»
DETAIL:  La fila que falla contiene (34586791, Miguel Casan, 2023-02-20, 0, Contaduría, 4500.00).)*/

--11
update empleados set cantidadhijos = 21
where documento like '22222222';
/*da error(ERROR:  el nuevo registro para la relación «empleados» viola la restricción «check» «ck_empleados_maximacantidadhijos»
DETAIL:  La fila que falla contiene (22222222, Alberto Lopez, 1965-10-05, 21, Sistemas, 1000.00).)*/

/*Segundo problema:
Una playa de estacionamiento almacena los datos de los vehículos que ingresan en la tabla llamada "vehiculos".

1- Cree la tabla:
 create table vehiculos(
  numero serial,
  patente char(6),
  tipo char(4),
  fechahoraentrada timestamp,
  fechahorasalida timestamp,
  primary key(numero)
 );

2- Ingresamos algunos registros:
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
   values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) 
   values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

3- Agregue una restricción "check" para asegurarse que la fecha de entrada a la playa no sea posterior a la fecha y hora actual.

4- Agregue otra restricción "check" al campo "fechahoraentrada" que establezca que sus valores no sean posteriores a "fechahorasalida".

5- Intente ingresar un valor que no cumpla con la primera restricción establecida en el campo "fechahoraentrada".

6- Intente modificar un registro para que la salida sea anterior a la entrada. Mensaje de error.

7- Vea todas las restricciones para la tabla "vehiculos".*/

--1
drop table if exists vehiculos; 

create table vehiculos(
  numero serial,
  patente char(6),
  tipo char(4),
  fechahoraentrada timestamp,
  fechahorasalida timestamp,
  primary key(numero)
);

--2
insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) values ('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) values ('CAA258','auto','2007/01/17 8:10',null);
insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) values ('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

--3
alter table vehiculos
add constraint CK_vehiculos_fechahoraactualpostfechahoraentrada
check (fechahoraentrada < current_timestamp);

--4
alter table vehiculos
add constraint CK_vehiculos_fechahorasalidapostfechahoraentrada
check (fechahoraentrada < fechahorasalida);

--5
insert into vehiculos (patente,tipo,fechahoraentrada,fechahorasalida) values ('AID216','auto','2024/01/17 8:05','2007/01/17 12:30');
/*da error(ERROR:  el nuevo registro para la relación «vehiculos» viola la restricción «check» «ck_vehiculos_fechahoraactualpostfechahoraentrada»
DETAIL:  La fila que falla contiene (6, AID216, auto, 2024-01-17 08:05:00, 2007-01-17 12:30:00).)*/

--6
update vehiculos set fechahorasalida = '2006/01/17 18:00'
where numero = 3;
/*da error(ERROR:  el nuevo registro para la relación «vehiculos» viola la restricción «check» «ck_vehiculos_fechahorasalidapostfechahoraentrada»
DETAIL:  La fila que falla contiene (3, DSE367, moto, 2007-01-17 08:30:00, 2006-01-17 18:00:00).)*/

--7
select *
from information_schema.table_constraints
where table_name = 'vehiculos';

--------------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIÓN PRIMARY KEY*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".

1- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

2- Ingrese algunos registros, dos de ellos con el mismo número de documento:
 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

3- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita ni admita valores nulos. No lo permite 
porque la tabla contiene datos que no cumplen con la restricción, debemos eliminar (o modificar) el registro que tiene documento duplicado.

4- Establezca la restricción "primary key" del punto 3.

5- Intente actualizar un documento para que se repita. No lo permite porque va contra la restricción.

6-Intente establecer otra restricción "primary key" con el campo "nombre".No lo permite, sólo puede haber una restricción "primary key" 
por tabla.

7- Intente ingresar un registro con valor nulo para el documento. No lo permite porque la restricción no admite valores nulos.

8- Vea las restricciones de la tabla empleados (2 filas)*/

--1
drop table if exists empleados;
create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
);

--2
insert into empleados values ('22222222','Alberto Lopez','Sistemas');
insert into empleados values ('23333333','Beatriz Garcia','Administracion');
insert into empleados values ('23333333','Carlos Fuentes','Administracion');

--3 y 4
alter table empleados
add constraint PK_empleados_documento
primary key(documento);
/*da error(ERROR:  no se pudo crear el índice único «pk_empleados_documento»
DETAIL:  La llave (documento)=(23333333) está duplicada.)*/

update empleados set documento = '33333333'
where nombre like 'Carlos Fuentes';

--5
update empleados set documento = '33333333'
where nombre like 'Alberto Lopez';
/*da error(ERROR:  llave duplicada viola restricción de unicidad «pk_empleados_documento»
DETAIL:  Ya existe la llave (documento)=(33333333).)*/

--6
alter table empleados
add constraint PK_empleados_nombre
primary key(nombre);
/*da error(ERROR:  no se permiten múltiples llaves primarias para la tabla «empleados»)*/

--7
insert into empleados values (null,'Carlos Gomez','Administracion');
/*da error(ERROR:  el valor nulo en la columna «documento» de la relación «empleados» viola la restricción de no nulo)*/

--8
select *
from information_schema.table_constraints
where table_name = 'empleados';

/*Segundo problema:
Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada "remis".

1- Cree la tabla con la siguiente estructura:
 create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

2- Ingrese algunos registros sin repetir patente:
 insert into remis (patente,marca,modelo)values('ABC123','Renault 12','1990');
 insert into remis (patente,marca,modelo)values('DEF456','Fiat Duna','1995');

3- Definir una restricción "primary key" para el campo "patente".

4- Establezca una restricción "primary key" para el campo "numero".(No lo permite ya que hay una "primary key")

5- Vea la información de las restricciones*/

--1
drop table if exists remis;

create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
);

--2
insert into remis (patente,marca,modelo)values('ABC123','Renault 12','1990');
insert into remis (patente,marca,modelo)values('DEF456','Fiat Duna','1995');

--3
alter table remis
add constraint PK_remis_patente
primary key(patente);

--4
alter table remis
add constraint PK_remis_numero
primary key(numero);
/*da error(ERROR:  no se permiten múltiples llaves primarias para la tabla «remis»)*/

--5
select *
from information_schema.table_constraints
where table_name = 'remis';

----------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIÓN UNIQUE*/
----------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada "remis".

1- Cree la tabla con la siguiente estructura:
 create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

2- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
 insert into remis(patente,marca,modelo) values('ABC123','Renault clio','1990');
 insert into remis(patente,marca,modelo) values('DEF456','Peugeot 504','1995');
 insert into remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
 insert into remis(patente,marca,modelo) values('GHI789','Fiat Duna','1995');
 insert into remis(patente,marca,modelo) values(null,'Fiat Duna','1995');

3- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará valores repetidos.No se puede porque hay 
valores duplicados.

4- Elimine el registro con patente duplicada y establezca la restricción. Note que hay 1 registro con valor nulo en "patente".

5- Intente ingresar un registro con patente repetida (no lo permite)

6- Ingresar un registro con valor nulo para el campo "patente". Lo permite.

7- Muestre la información de las restricciones*/

--1
drop table if exists remis;

create table remis(
  numero serial,
  patente char(6),
  marca varchar(15),
  modelo char(4)
);

--2
insert into remis(patente,marca,modelo) values('ABC123','Renault clio','1990');
insert into remis(patente,marca,modelo) values('DEF456','Peugeot 504','1995');
insert into remis(patente,marca,modelo) values('DEF456','Fiat Duna','1998');
insert into remis(patente,marca,modelo) values('GHI789','Fiat Duna','1995');
insert into remis(patente,marca,modelo) values(null,'Fiat Duna','1995');

--3 y 4
alter table remis
add constraint UQ_remis_patente
unique (patente);
/*da error(ERROR:  no se pudo crear el índice único «uq_remis_patente» DETAIL:  La llave (patente)=(DEF456) está duplicada.)*/

--4
delete from remis
where patente like 'DEF456'
  and marca like 'Fiat Duna';

--5
insert into remis(patente,marca,modelo) values('GHI789','Peugeot 504','1996');
/*da error(ERROR:  llave duplicada viola restricción de unicidad «uq_remis_patente» DETAIL:  Ya existe la llave (patente)=(GHI789).)*/

--6
insert into remis(patente,marca,modelo) values(null,'Fiat Duna','1994');

--7
select *
from information_schema.table_constraints
where table_name = 'remis';

----------------------------------------------------------------------------------------------------------------------------------------
/*ELIMINAR RESTRICCIONES*/
----------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla llamada "vehiculos".

1- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada timestamp not null,
  horasalida timestamp
 );

2- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada"

3- Ingrese un vehículo:
 insert into vehiculos values('SDR456','a','2015/10/10 10:10',null);

4- Intente ingresar un registro repitiendo la clave primaria. No se permite.

5- Ingrese un registro repitiendo la patente pero no la hora de llegada.

6- Ingrese un registro repitiendo la hora de llegada pero no la patente.

7- Vea todas las restricciones para la tabla "vehiculos"
 
8- Elimine la restricción "primary key".

9- Vea si se han eliminado*/

--1
drop table if exists vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada timestamp not null,
  horasalida timestamp
);

--2
alter table vehiculos
add constraint PK_vehiculos_patente_horallegada
primary key(patente,horallegada);

--3
insert into vehiculos values('SDR456','a','2015/10/10 10:10',null);

--4
insert into vehiculos values('SDR456','m','2015/10/10 10:10','2015/10/10 10:30');
/*ERROR:  llave duplicada viola restricción de unicidad «pk_vehiculos_patente_horallegada»
DETAIL:  Ya existe la llave (patente, horallegada)=(SDR456, 2015-10-10 10:10:00).*/

--5
insert into vehiculos values('SDR456','m','2015/10/10 12:10','2015/10/10 12:40');

--6
insert into vehiculos values('SDR111','m','2015/10/10 10:10',null);

--7 y 9
select *
from information_schema.table_constraints
where table_name = 'vehiculos';

--8
alter table vehiculos
drop constraint PK_vehiculos_patente_horallegada;