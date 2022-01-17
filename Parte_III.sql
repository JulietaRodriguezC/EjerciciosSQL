---------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES PARA EL MANEJO DE CADENAS*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "libros" de una librería.

1- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":
create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad smallint default 0,
  primary key (codigo)
 );
 
2- Ingresar algunos registros
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
  
3- Mostrar sólo los 12 primeros caracteres de los títulos de los libros y sus autores, empleando la función "substring()".

4- Mostrar los títulos, autores y editoriales de todos libros, al último campo lo queremos en mayúsculas.

5- Mostrar todos los títulos de los libros rellenando con el caracter '-' a la derecha.

6- Imprimir todos los libros que contienen la cadena 'en' en alguna parte del título del libro.

7- Imprimir todos los libros que tienen un título con 10 o más caracteres.*/

--1
create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad smallint default 0,
  primary key (codigo)
);

--2
insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25);
insert into libros (titulo,autor,editorial,precio,cantidad) values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

--3
select substring(titulo from 1 for 12) as titulo_final, autor
from libros;

--4
select titulo, autor, upper(editorial) as editorial
from libros;

--5
select rpad(titulo,40,'-')
from libros;

--6
select *
from libros
where position('en' in titulo) <> 0;

--7
select *
from libros
where char_length(titulo)>=10;

/*Segundo problema:
Trabaje con la tabla que almacena los datos de clientes.

1- Créela con la siguiente estructura:
create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

2- Ingresar algunos registros:
 insert into clientes(documento,apellido,nombre,domicilio,telefono)
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio,telefono)
  values('2333344','Perez','Ana','Colon 234','2345123');
 insert into clientes(documento,apellido,nombre,domicilio,telefono)
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes (documento,apellido,nombre,domicilio,telefono)
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

3- Mostrar todos los registros disponiendo en mayúsculas el apellido y el nombre.

4- Mostrar el primer caracter del nombre.*/

--1
create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
);

--2
insert into clientes(documento,apellido,nombre,domicilio,telefono) values('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into clientes (documento,apellido,nombre,domicilio,telefono) values('2333344','Perez','Ana','Colon 234','2345123');
insert into clientes(documento,apellido,nombre,domicilio,telefono) values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into clientes (documento,apellido,nombre,domicilio,telefono) values('2533344','Juarez','Ana','Urquiza 444','4789900');

--3
select documento, upper(apellido) , upper(nombre), domicilio, telefono
from clientes;

--4
select substring(nombre from 1 for 1) as "Inicial del nombre"
from clientes;

---------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES MATEMÁTICAS*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes".

1- Créela con la siguiente estructura:
 create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  credito decimal(9,2),
  primary key(codigo)
);

2- Ingrese 5 registros:
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba',1900.56);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba',450.33);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba',190);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Olmos Luis','Sarmiento 444','Rosario','Santa Fe',670.22);
 insert into clientes(nombre,domicilio,ciudad,provincia,credito)
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba',500.55);

3- Muestre todos los registros.

4- Mostrar el campo crédito redondeado hacia arriba.

5- Mostrar el campo crédito redondeando hacia abajo*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  credito decimal(9,2),
  primary key(codigo)
);

--2
insert into clientes(nombre,domicilio,ciudad,provincia,credito) values ('Lopez Marcos','Colon 111','Cordoba','Cordoba',1900.56);
insert into clientes(nombre,domicilio,ciudad,provincia,credito) values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba',450.33);
insert into clientes(nombre,domicilio,ciudad,provincia,credito) values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba',190);
insert into clientes(nombre,domicilio,ciudad,provincia,credito) values ('Olmos Luis','Sarmiento 444','Rosario','Santa Fe',670.22);
insert into clientes(nombre,domicilio,ciudad,provincia,credito) values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba',500.55);

--3
select * from clientes;

--4
select ceiling(credito) as "Crédito arriba"
from clientes;

--5
select floor(credito) as "Crédito abajo"
from clientes;

--------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES PARA EL USO DE FECHAS Y HORAS*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabajamos con la tabla "libros" de una librería:

1- Cree la tabla:
create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion timestamp,
  precio decimal(6,2)
 );

2- Ingrese los siguientes registros:
insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
 insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
 insert into libros 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
 insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

3- Mostrar el título del libro y el año de edición.

4- Mostrar el título del libro y el mes de edición.

5- Muestre los títulos de los libros que se editaron el día 9, de cualquier mes de cualquier año.*/

--1
drop table if exists libros;

create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion timestamp,
  precio decimal(6,2)
 );

--2
insert into libros  values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

--3
select titulo, extract(year from edicion)
from libros;

--4
select titulo, extract(month from edicion)
from libros;

--5
select titulo
from libros
where extract(day from edicion) = 9;

-------------------------------------------------------------------------------------------------------------
/*ORDENAR REGISTROS*/
-------------------------------------------------------------------------------------------------------------
/*Primer problema:
En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, pais, fecha.

1- Créela con la siguiente estructura:
 create table visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha timestamp,
  primary key(numero)
);

2- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

3- Ordene los registros por fecha, en orden descendente.

4- Muestre el nombre del usuario, pais y el número de mes, ordenado por pais (ascendente) y número de mes (descendente).

5- Muestre el pais, el mes, el día y la hora y ordene las visitas por número del mes, del día y la hora.

6- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 registros)*/

--1
create table visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha timestamp,
  primary key(numero)
);

--2
insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

--3
select *
from visitas
order by fecha desc;

--4
select nombre, pais, extract(month from fecha) as "Mes"
from visitas
order by pais asc,3 desc;

--5
select pais, extract(month from fecha) as "Mes", extract(day from fecha) as "Día", extract(hour from fecha) as "Hora"
from visitas
order by 2,3,4;

--6
select mail, pais
from visitas
where extract(month from fecha) = 10
order by pais;

------------------------------------------------------------------------------------------------------------------------------------------
/*OPERADORES LÓGICOS*/
------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
 );

2- Ingrese algunos registros:
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos (nombre,laboratorio,precio,cantidad)
  values('Amoxidal jarabe','Bayer',5.10,250); 

3- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea menor a 5 (1 registro cumple con ambas 
condiciones).

4- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros). Note que el resultado es diferente al 
del punto 4, hemos cambiado el operador de la sentencia anterior.

5- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 registro)

6- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros) Analice estas 2 últimas sentencias. 
El operador "not" afecta a la condición a la cual antecede, no a las siguientes. Los resultados de los puntos 6 y 7 son diferentes.

7- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 registro eliminado)

8- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado)

9- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)*/

--1
create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad smallint,
  primary key(codigo)
);

--2
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos (nombre,laboratorio,precio,cantidad) values('Amoxidal jarabe','Bayer',5.10,250); 

--3
select codigo,nombre
from medicamentos
where laboratorio = 'Roche' 
  and precio < 5;

--4
select codigo,nombre
from medicamentos
where laboratorio = 'Roche' 
   or precio < 5;

--5
select *
from medicamentos
where not laboratorio = 'Bayer' 
      and cantidad = 100;

--6
select *
from medicamentos
where laboratorio = 'Bayer' 
and not cantidad = 100;

--7
delete from medicamentos
where laboratorio = 'Bayer' 
  and precio > 10;

--8
update medicamentos set cantidad = 200
where laboratorio = 'Roche'
  and precio > 5;

--9
delete from medicamentos
where laboratorio = 'Bayer'
   or precio < 3;

/*Segundo problema:
Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.

1- Créela con la siguiente estructura:
 create table peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
 );

2- Ingrese algunos registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
 insert into peliculas (titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo,actor,duracion)
  values('Un oso rojo','Julio Chavez',100);
 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',110);

3- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)

4- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas condiciones)

5- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado)

6- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 100 (5 registros eliminados)*/

--1
create table peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
);

--2
insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo,actor,duracion) values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values('Mujer bonita','Richard Gere',120);
insert into peliculas (titulo,actor,duracion) values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo,actor,duracion) values('Un oso rojo','Julio Chavez',100);
insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',110);

--3
select *
from peliculas
where actor = 'Tom Cruise'
   or actor = 'Richard Gere';

--4
select *
from peliculas
where actor = 'Tom Cruise'
  and duracion < 100;

--5
update peliculas set duracion = 200
where actor = 'Daniel R.'
  and duracion = 180;

--6 
delete from peliculas
where not actor = 'Tom Cruise'
  and duracion >= 100;

--------------------------------------------------------------------------------------------------------------------------------------------
/*OTROS OPERADORES RELACIONALES (IS NULL)*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.

1- Créela con la siguiente estructura:
 create table peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
 );

2- Ingrese algunos registros:
 insert into peliculas(titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas(titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas(titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas(titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas(titulo,actor,duracion)
  values('Mujer bonita',null,120);
 insert into peliculas(titulo,actor,duracion)
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

3- Recupere las películas cuyo actor sea nulo (2 registros)

4- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)

5- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)*/

--1
drop table if exists peliculas;

create table peliculas(
  codigo serial,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion smallint,
  primary key (codigo)
 );

--2
insert into peliculas(titulo,actor,duracion) values('Mision imposible','Tom Cruise',120);
insert into peliculas(titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',null);
insert into peliculas(titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas(titulo,actor,duracion) values('Mision imposible 2','Tom Cruise',120);
insert into peliculas(titulo,actor,duracion) values('Mujer bonita',null,120);
insert into peliculas(titulo,actor,duracion) values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo) values('Un oso rojo');

--3
select *
from peliculas
where actor is null;

--4
update peliculas set duracion = 0
where duracion is null;

--5
delete from peliculas
where actor is null 
  and duracion = 0;

------------------------------------------------------------------------------------------------------------------------------------------
/*OTROS OPERADORES RELACIONALES (BETWEEN)*/
------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, pais, fechayhora de la visita.

1- Créela con la siguiente estructura:
 create table visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora timestamp,
  primary key(numero)
);

2- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');

3- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 registros). Note que incluye los de fecha mayor 
o igual al valor mínimo y menores al valor máximo, y que los valores null no se incluyen.

4- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros). Note que incluye los valores límites. */

--1
drop table if exists visitas;

create table visitas (
  numero serial,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora timestamp,
  primary key(numero)
);

--2
insert into visitas (nombre,mail,pais,fechayhora) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fechayhora) values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
insert into visitas (nombre,mail,pais) values ('Federico1','federicogarcia@xaxamail.com','Argentina');

--3
select *
from visitas
where fechayhora between '2006-09-12' and '2006-10-11';

--4
select *
from visitas
where numero between 2 and 5;

/*Segundo problema:
Una concesionaria de autos vende autos usados y almacena la información en una tabla llamada "autos".

1- Cree la tabla con la siguiente estructura:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

2- Ingrese algunos registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1980',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1995',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

3- Seleccione todos los autos cuyo modelo se encuentre entre '1970' y '1990' usando el operador 
"between" y ordénelos por dicho campo(4 registros)

4- Seleccione todos los autos cuyo precio esté entre 50000 y 100000.

5- Seleccione todos los autos cuyo precio NO esté entre 50000 y 100000.*/

--1
drop table if exists autos;

create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

--2
insert into autos values('ACD123','Fiat 128','1970',15000);
insert into autos values('ACG234','Renault 11','1980',40000);
insert into autos values('BCD333','Peugeot 505','1990',80000);
insert into autos values('GCD123','Renault Clio','1995',70000);
insert into autos values('BCC333','Renault Megane','1998',95000);
insert into autos values('BVF543','Fiat 128','1975',20000);

--3
select *
from autos
where modelo between '1970' and '1990'
order by modelo;

--4
select *
from autos
where precio between 50000 and 100000;

--5
select *
from autos
where precio not between 50000 and 100000;

-------------------------------------------------------------------------------------------------------------------------------------------
/*OTROS OPERADORES RELACIONALES (IN)*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  primary key(codigo)
 );

2- Ingrese algunos registros:
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Sertal','Roche',5.2,1,'2005-02-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Buscapina','Roche',4.10,3,'2006-03-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal 500','Bayer',15.60,100,'2007-05-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
  values('Paracetamol 500','Bago',1.90,20,'2008-02-01');
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Bayaspirina','Bayer',2.10,150,'2009-12-01'); 
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) 
  values('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01'); 

3- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" empleando el operador "in" (4 registros)

4- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y luego el operador "in" (2 registros)
Note que es más conveniente emplear, en este caso, el operador "between".*/

--1
drop table if exists medicamentos;

create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  primary key(codigo)
);

--2
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Sertal','Roche',5.2,1,'2005-02-01');
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Buscapina','Roche',4.10,3,'2006-03-01');
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Amoxidal 500','Bayer',15.60,100,'2007-05-01');
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Paracetamol 500','Bago',1.90,20,'2008-02-01');
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Bayaspirina','Bayer',2.10,150,'2009-12-01'); 
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento) values ('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01');

--3
select nombre, precio
from medicamentos
where laboratorio in ('Bayer','Bago');

--4
select *
from medicamentos
where cantidad between 1 and 5;

select *
from medicamentos
where cantidad in (1,2,3,4,5);

-------------------------------------------------------------------------------------------------------------------------------------------
/*BÚSQUEDA DE PATRONES (LIKE - NOT LIKE)*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".

1- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into empleados(
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

3- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)

4- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)

5- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 registros)

6- Muestre los empleados que hayan ingresado en "1990" (3 registros)*/

--1
drop table if exists empleados;

create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

--2
insert into empleados values ('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
insert into empleados values ('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
insert into empleados values ('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
insert into empleados values ('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
insert into empleados values ('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
insert into empleados values ('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

--3
select *
from empleados
where nombre like '%Perez%';

--4
select *
from empleados
where domicilio like 'Co%8%';

--5
select nombre, sueldo
from empleados
where cast(sueldo as varchar) not like '%.00';

--6
select *
from empleados
where cast(extract(year from fechaingreso) as varchar) like '1990';

--otra forma
select * 
from empleados
where cast(fechaingreso as varchar) like '%1990%';

-------------------------------------------------------------------------------------------------------------------------------------------
/*CONTAR REGISTROS (COUNT)*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla llamada "medicamentos" de una farmacia.

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  numerolote int default null,
  primary key(codigo)
 );

2- Ingrese algunos registros:
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

3- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)

4- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)

5- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad distinto a "null", disponer alias para las 
columnas.

6- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 registros)

7- Cuente la cantidad de medicamentos con número de lote distinto de "null" (0 registros)*/

--1
drop table if exists medicamentos;

create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad smallint,
  fechavencimiento date not null,
  numerolote int default null,
  primary key(codigo)
);

--2
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Sertal','Roche',5.2,1,'2015-02-01',null);
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Buscapina','Roche',4.10,3,'2016-03-01',null);
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Bayaspirina',null,2.10,null,'2019-12-01',null); 
insert into medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote) values ('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null);

--3
select count(*) as "Cant medicamentos"
from medicamentos;

--4
select count(laboratorio) as "Cant labs conocidos"
from medicamentos;

--5
select count(precio) as "Cant medic precio <> null", count(cantidad) as "Cant medic cantidad <> null"
from medicamentos;

--6
select count(precio)
from medicamentos
where laboratorio like 'B%';

--7
select count(numerolote) as "Medic con numerolote <> null"
from medicamentos;