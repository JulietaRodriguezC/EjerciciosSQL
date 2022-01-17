------------------------------------------------------------------------------------------------
/*CREAR TABLA*/
------------------------------------------------------------------------------------------------
/*Primer problema:
Necesita almacenar los datos de sus amigos en una tabla. Los datos que guardará serán: apellido, 
nombre, domicilio y teléfono.

1- Cree una tabla llamada "agenda", debe tener los siguientes campos: apellido, varchar(30); nombre,
varchar(20); domicilio, varchar (30) y telefono, varchar(11).

2- Intente crearla nuevamente. Aparece mensaje de error.

3- Visualice la estructura de la tabla "agenda".

4- Elimine la tabla.

5- Intente eliminar nuevamente la tabla. Debe aparecer un mensaje de error.*/

--1
create table agenda(
	apellido varchar(30) not null,
	nombre varchar(20) not null,
	domicilio varchar(30),
	telefono varchar(11) not null
);

--3
select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'agenda';
  
--4
drop table agenda;

/*Segundo problema:
Necesita almacenar información referente a los libros de su biblioteca personal. Los datos que 
guardará serán: título del libro, nombre del autor y nombre de la editorial.

1- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); 
autor, varchar(30) y editorial, varchar(15).

2- Intente crearla nuevamente. Aparece mensaje de error.

3- Visualice la estructura de la tabla "libros".

4- Elimine la tabla.

5- Intente eliminar la tabla nuevamente.*/

--1 
create table libros(
	titulo varchar(20) not null,
	autor varchar(30) not null,
	editorial varchar(15) not null
);

--3
select table_name,column_name,udt_name,character_maximum_length
from information_schema.columns
where table_name = 'libros';

--4
drop table libros;

------------------------------------------------------------------------------------------------
/*INSERTAR Y RECUPERAR REGISTROS DE UNA TABLA*/
------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "agenda" que almacena información de sus amigos.
1- Cree una tabla llamada "agenda". Debe tener los siguientes campos: apellido (cadena de 30), 
nombre (cadena de 20), domicilio (cadena de 30) y telefono (cadena de 11)

2 - Visualice la estructura de la tabla "agenda".

3- Ingrese los siguientes registros:
 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');

4- Seleccione todos los registros de la tabla:
 select * from agenda;

5- Elimine la tabla "agenda":
 
6- Intente eliminar la tabla nuevamente (aparece un mensaje de error)*/

--3 
insert into agenda (apellido, nombre, domicilio, telefono) values ('Moreno','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre, domicilio, telefono) values ('Torres','Juan','Avellaneda 135','4458787');

--4 
select *
from agenda;

--5
drop table agenda;

/*Segundo problema:
Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.
1- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: 
titulo (cadena de 20), autor (cadena de 30) y editorial (cadena de 15).

2- Visualice la estructura de la tabla "libros".

3- Ingrese los siguientes registros:
 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

4- Muestre todos los registros (select).*/

--3
insert into libros (titulo,autor,editorial) values ('El aleph','Borges','Planeta');
insert into libros (titulo,autor,editorial) values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial) values ('Aprenda PHP','Mario Molina','Emece');

--4 
select *
from libros;

------------------------------------------------------------------------------------------------
/*TIPOS DE DATOS BÁSICOS*/
------------------------------------------------------------------------------------------------
/*Primer problema:
Un videoclub que alquila películas en video almacena la información de sus películas en una tabla 
llamada "peliculas"; para cada película necesita los siguientes datos:
 -nombre, cadena de caracteres de 20 de longitud,
 -actor, cadena de caracteres de 20 de longitud,
 -duración, valor numérico entero.
 -cantidad de copias: valor entero.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

2- Vea la estructura de la tabla.

3- Ingrese los siguientes registros:
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

4- Muestre todos los registros*/

--1 
create table peliculas(
	nombre varchar(20),
	actor varchar(20),
	duracion int,
	cantidad_copias int
);

--2 
select table_name,column_name,udt_name,character_maximum_length
from information_schema.columns
where table_name = 'peliculas';

--3 
insert into peliculas (nombre, actor, duracion, cantidad_copias) values ('Mision imposible','Tom Cruise',128,3);
insert into peliculas (nombre, actor, duracion, cantidad_copias) values ('Mision imposible 2','Tom Cruise',130,3);
insert into peliculas (nombre, actor, duracion, cantidad_copias) values ('Mujer bonita','Julia Roberts',118,3);
insert into peliculas (nombre, actor, duracion, cantidad_copias) values ('Elsa y Fred','China Zorrilla',110,2);

--4 
select *
from peliculas;

/*Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

2- Vea la estructura de la tabla:

3- Ingrese algunos registros:
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

4- Seleccione todos los registros.*/

--1 
create table empleados(
	nombre varchar(20),
	documento varchar(10),
	sexo varchar(10),
	domicilio varchar(20),
	sueldo_basico float
);

--2
select table_name,column_name,udt_name,character_maximum_length
from information_schema.columns
where table_name = 'empleados';

--3 
insert into empleados (nombre, documento, sexo, domicilio, sueldo_basico) values ('Juan Perez','22333444','m','Sarmiento 123',500);
insert into empleados (nombre, documento, sexo, domicilio, sueldo_basico) values ('Ana Acosta','24555666','f','Colon 134',650);
insert into empleados (nombre, documento, sexo, domicilio, sueldo_basico) values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

--4 
select *
from empleados;

------------------------------------------------------------------------------------------------
/*RECUPERAR ALGUNOS CAMPOS*/
------------------------------------------------------------------------------------------------
/*Primer problema:
Un videoclub que alquila películas en video almacena la información de sus películas en alquiler en 
una tabla llamada "peliculas".

1- Cree la tabla:
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

2- Vea la estructura de la tabla.

3- Ingrese alos siguientes registros:
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

4- Realice un "select" mostrando solamente el título y actor de todas las películas

5- Muestre el título y duración de todas las peliculas

6- Muestre el título y la cantidad de copias*/

--4 
select nombre,actor
from peliculas;

--5 
select nombre,duracion
from peliculas;

--6 
select nombre,cantidad_copias
from peliculas;

/*Segundo problema:
 Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

1- Cree la tabla:
 create table empleados(
  nombre varchar(20),
  documento varchar(8), 
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );

2- Vea la estructura de la tabla

3- Ingrese algunos registros:
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Juarez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','27888999','f','Colon 134',700);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Carlos Caseres','31222333','m','Urquiza 479',850);

4- Muestre todos los datos de los empleados

5- Muestre el nombre, documento y domicilio de los empleados

6- Realice un "select" mostrando el documento, sexo y sueldo básico de todos los empleados*/

--4 
select *
from empleados;

--5 
select nombre,documento,domicilio
from empleados;

--6 
select documento,sexo,sueldo_basico
from empleados;

------------------------------------------------------------------------------------------------
/*RECUPERAR ALGUNOS REGISTROS*/
------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "agenda" en la que registra los datos de sus amigos.

1- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11).

2- Visualice la estructura de la tabla "agenda".

3- Ingrese los siguientes registros:
 Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Hector, Salta 545, 4887788; 
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454.

4- Seleccione todos los registros de la tabla

5- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)

6- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)

7- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)*/

--3 
insert into agenda (apellido,nombre,domicilio,telefono) values ('Acosta','Ana','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Bustamante','Betina','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Hector','Salta 545','4887788');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Luis','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Marisa','Urquiza 333','4545454');

--4 
select *
from agenda;

--5 
select *
from agenda
where nombre = 'Marisa';

--6 
select nombre,domicilio
from agenda
where apellido = 'Lopez';

--7 
select nombre
from agenda
where telefono = '4545454';

/*Segundo problema:
Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros 
disponibles para la venta.

1- Cree la tabla "libros". Debe tener la siguiente estructura:
 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

2- Visualice la estructura de la tabla "libros".

3- Ingrese los siguientes registros:
 El aleph,Borges,Emece;
 Martin Fierro,Jose Hernandez,Emece;
 Martin Fierro,Jose Hernandez,Planeta;
 Aprenda PHP,Mario Molina,Siglo XXI;

4- Seleccione los registros cuyo autor sea "Borges" (1 registro)

5- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

6- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 
registros)*/

--3 
insert into libros(titulo,autor,editorial) values ('El aleph','Borges','Emece');
insert into libros(titulo,autor,editorial) values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros(titulo,autor,editorial) values ('Martin Fierro','Jose Hernandez','Planeta');
insert into libros(titulo,autor,editorial) values ('Aprenda PHP','Mario Molina','Siglo XXI');

--4 
select *
from libros
where autor = 'Borges';

--5 
select titulo
from libros
where editorial = 'Emece';

--6 
select editorial
from libros
where titulo = 'Martin Fierro';

--------------------------------------------------------------------------------------------------------
/*OPERADORES RELACIONALES*/
--------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

2- Ingrese algunos registros:
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50); 

3- Seleccione los datos de las impresoras (2 registros)

4- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)

5- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)

6- Seleccione el nombre y descripción de los artículos que NO cuesten $100 (4 registros)*/

--1 
create table articulos(
  codigo int,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad int
 ); 
 
--2 
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50);

--3 
select *
from articulos
where nombre = 'impresora';

--4 
select *
from articulos
where precio >= 400;

--5 
select codigo,nombre
from articulos
where cantidad < 30;

--6 
select nombre,descripcion
from articulos
where precio <> 100;

/*Segundo problema:
Un video club que alquila películas en video almacena la información de sus películas en alquiler 
en una tabla denominada "peliculas".

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

2- Ingrese los siguientes registros:
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,4);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,1);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',80,2);

3- Seleccione las películas cuya duración no supere los 90 minutos (2 registros)

4- Seleccione el título de todas las películas en las que el actor NO sea "Tom Cruise" (2 
registros)

5- Muestre todos los campos, excepto "duracion", de todas las películas de las que haya más de 2 
copias (2 registros)*/

--1 
create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion int,
  cantidad int
 );

--2 
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,4);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,1);
insert into peliculas (titulo, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',80,2);

--3
select *
from peliculas
where duracion <= 90;

--4 
select titulo
from peliculas
where actor <> 'Tom Cruise';

--5 
select titulo,actor,cantidad
from peliculas
where cantidad > 2;

--------------------------------------------------------------------------------------------------------
/*BORRAR REGISTROS*/
--------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11):
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

2- Ingrese los siguientes registros (insert into):
 Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456.

3- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)

4- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados)

5- Muestre la tabla.

6- Elimine todos los registros (2 registros afectados)

7- Muestre la tabla.*/

--2 
insert into agenda(apellido,nombre,domicilio,telefono) values ('Alvarez','Alberto','Colon 123','4234567');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Lopez','Maria','Urquiza 333','4545454');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Lopez','Jose','Urquiza 333','4545454');
insert into agenda(apellido,nombre,domicilio,telefono) values ('Salas','Susana','Gral. Paz 1234','4123456');

--3 
delete from agenda
where nombre = 'Juan';

--4 
delete from agenda
where telefono = '4545454';

--5 y 7 
select *
from agenda;

--6 
delete from agenda;

/*Segundo problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

2- Ingrese algunos registros:
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

3- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)

4- Elimine todas las impresoras (1 registro)

5- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro)

6- Mostrar la tabla después que borra cada registro.*/

--3 
delete from articulos
where precio >= 500;

--4 
delete from articulos
where nombre = 'impresora';

--5 
delete from articulos
where codigo <> 4;

--6 
select *
from articulos;

--------------------------------------------------------------------------------------------------------
/*ACTUALIZAR REGISTROS*/
--------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "agenda" que almacena los datos de sus amigos.

1- Cree la tabla:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

2- Ingrese los siguientes registros:
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

3- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)

4- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" 
(2 registros afectados)

5- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún 
registro afectado porque ninguno cumple con la condición del "where")

6 - Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.*/

--2 
insert into agenda (apellido,nombre,domicilio,telefono) values ('Acosta','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Maria','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono) values ('Suarez','Susana','Gral. Paz 1234','4123456');

--3 y 5
update agenda set nombre = 'Juan Jose'
where nombre = 'Juan';

--4 
update agenda set telefono = '4445566'
where telefono = '4545454';

--6
select * from agenda;

/*Segundo problema:
Trabaje con la tabla "libros" de una librería.
1- Créela con los siguientes campos: titulo (cadena de 30 caracteres de longitud), autor (cadena de 
20), editorial (cadena de 15) y precio (float):
 create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

2- Ingrese los siguientes registros:
 insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);

3- Muestre todos los registros (5 registros):

4- Modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" (1 registro 
afectado)

5- Nuevamente, modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" 
(ningún registro afectado porque ninguno cumple la condición)

6- Actualice el precio del libro de "Mario Molina" a 27 pesos (1 registro afectado)

7- Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya 
editorial sea igual a "Emece" (3 registros afectados)

8 - Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.*/

--1 
create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

--2
insert into libros (titulo, autor, editorial, precio) values ('El aleph','Borges','Emece',25.00);
insert into libros (titulo, autor, editorial, precio) values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
insert into libros (titulo, autor, editorial, precio) values ('Aprenda PHP','Mario Molina','Emece',45.50);
insert into libros (titulo, autor, editorial, precio) values ('Cervantes y el quijote','Borges','Emece',25);
insert into libros (titulo, autor, editorial, precio) values ('Matematica estas ahi','Paenza','Siglo XXI',15);

--3 y 8
select * from libros;

--4 y 5
update libros set autor = 'Adrian Paenza'
where autor = 'Paenza';

--6 
update libros set precio = 27
where autor = 'Mario Molina';

--7 
update libros set editorial = 'Emece S.A.'
where editorial = 'Emece';