----------------------------------------------------------------------------------------------------------------------------------------------
/*VALORES NULL*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
 );

2- Visualice la estructura de la tabla "medicamentos" indicando si el campo admite valores null.

3- Ingrese algunos registros con valores "null" para los campos que lo admitan:
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);

4- Vea todos los registros.

5- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.

6- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre.

7- Muestre todos los registros.

8- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error).

9- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que tengan una cadena vacía en el mismo campo. Note 
que el resultado es diferente.

10- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el valor 0 en el mismo campo. Note que el 
resultado es distinto.

11- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean distintos de "null".Note que la salida de la 
primera sentencia no muestra los registros con cadenas vacías y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra
los registros con valor para el campo laboratorio (incluso cadena vacía).

12- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null". Note que la salida de la primera sentencia 
no muestra los registros con valor 0 y tampoco los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor 
para el campo precio (incluso el valor 0).*/

--1
create table medicamentos(
  codigo int not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad int not null
 );

--2
select table_name,column_name,udt_name,character_maximum_length,is_nullable
from information_schema.columns
where table_name = 'medicamentos';

--3
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (3,'Buscapina','Roche',null,200);

--4 y 7
select * from medicamentos;

--5
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (4,'Tafirol','',0,200);

--6
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (0,'','Roche',70,0);

--8
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad) values (null,'Artinovo','Bagó',70,0); 
/*da error (db error: ERROR: null value in column "codigo" of relation "medicamentos" violates not-null constraint 
DETAIL: Failing row contains (null, Artinovo, Bagó, 70, 0).)*/

--9
select *
from medicamentos
where laboratorio is null ;

select *
from medicamentos
where laboratorio = '';

--10
select *
from medicamentos
where precio is null;

select *
from medicamentos
where precio = 0;

--11
select *
from medicamentos
where laboratorio <> '';

select *
from medicamentos
where laboratorio is not null;

--12
select *
from medicamentos
where precio <> 0;

select *
from medicamentos
where precio is not null;

/*Segundo problema:
Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".

1- Créela con la siguiente estructura:
 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

2- Visualice la estructura de la tabla. Note que el campo "codigo" y "titulo", en la columna "is_nullable" muestra "NO" y los otros campos "YES".

3- Ingrese los siguientes registros:
 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);

4- Recupere todos los registros para ver cómo PostgreSQL los almacenó.

5- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error)

6- Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía (note que la salida es distinta) (1 registro)

7- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro actualizado)

8- Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho campo (1 registro afectado)

9- Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor nulo en el campo "actor".

10- Elimine los registros cuyo título sea una cadena vacía (1 registro)*/

--1
create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

--2
select table_name,column_name,udt_name,character_maximum_length,is_nullable
from information_schema.columns
where table_name = 'peliculas';

--3
insert into peliculas (codigo,titulo,actor,duracion) values (1,'Mision imposible','Tom Cruise',120);
insert into peliculas (codigo,titulo,actor,duracion) values (2,'Harry Potter y la piedra filosofal',null,180);
insert into peliculas (codigo,titulo,actor,duracion) values (3,'Harry Potter y la camara secreta','Daniel R.',null);
insert into peliculas (codigo,titulo,actor,duracion) values (0,'Mision imposible 2','',150);
insert into peliculas (codigo,titulo,actor,duracion) values (4,'','L. Di Caprio',220);
insert into peliculas (codigo,titulo,actor,duracion) values (5,'Mujer bonita','R. Gere-J. Roberts',0);

--4 y 9
select * from peliculas;

--5
insert into peliculas (codigo,titulo,actor,duracion) values (null,null,'Jim Carrey',120);
/*da error (db error: ERROR: null value in column "codigo" of relation "peliculas" violates not-null constraint DETAIL: 
Failing row contains (null, null, Jim Carrey, 120).)*/

--6
select *
from peliculas
where actor is null;

select *
from peliculas
where actor = '';

--7
update peliculas set duracion = 120
where duracion is null;

--8
update peliculas set actor = 'Desconocido'
where actor = '';

--10
delete from peliculas
where titulo = ''; 

----------------------------------------------------------------------------------------------------------------------------------------------
/*CLAVE PRIMARIA*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "libros" de una librería.

1- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":
 create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 );

2- Ingrese los siguientes registros:
 insert into libros (codigo,titulo,autor,editorial)
  values (1,'El aleph','Borges','Emece');
 insert into libros (codigo,titulo,autor,editorial)
  values (2,'Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

3- Ingrese un registro con código repetido (aparece un mensaje de error)

4- Intente ingresar el valor "null" en el campo "codigo"

5- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)*/

--1
create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 );

--2
insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece');
insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

--3
insert into libros (codigo,titulo,autor,editorial) values (2,'El principito','A. de Saint-Exupéry','Planeta');
/*da error (db error: ERROR: duplicate key value violates unique constraint "libros_pkey" DETAIL: Key (codigo)=(2) 
already exists)*/

--4
insert into libros (codigo,titulo,autor,editorial) values (null,'El principito','A. de Saint-Exupéry','Planeta');
/*da error (db error: ERROR: null value in column "codigo" of relation "libros" violates not-null constraint DETAIL: 
Failing row contains (null, El principito, A. de Saint-Exupéry, Planeta).)*/

--5
update libros set codigo = 1
where titulo = 'Martin Fierro';
/*da error (db error: ERROR: duplicate key value violates unique constraint "libros_pkey" DETAIL: Key (codigo)=(1) already exists.)*/

/*Segundo problema:
Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1- Cree la tabla con la siguiente estructura intentando establecer 2 campos como clave primaria, el campo "documento" y "legajo" (no lo permite):
 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento),
  primary key(legajo)
 );

2- Cree la tabla estableciendo como clave primaria el campo "documento":
 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

3- Verifique que el campo "documento" no admite valores nulos

4- Ingrese los siguientes registros:
 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A233','22345345','Perez Mariana','Colon 234');
 insert into alumnos (legajo,documento,nombre,domicilio)
  values('A567','23545345','Morales Marcos','Avellaneda 348');

5- Intente ingresar un alumno con número de documento existente (no lo permite)

6- Intente ingresar un alumno con documento nulo (no lo permite)*/

--1
create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento),
  primary key(legajo)
 );
 /*da error (db error: ERROR: multiple primary keys for table "alumnos" are not allowed)*/

--2
create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );

--3
select table_name,column_name,is_nullable
from information_schema.columns
where table_name = 'alumnos'
      and column_name = 'documento';

--4
insert into alumnos (legajo,documento,nombre,domicilio) values ('A233','22345345','Perez Mariana','Colon 234');
insert into alumnos (legajo,documento,nombre,domicilio) values ('A567','23545345','Morales Marcos','Avellaneda 348');

--5
insert into alumnos (legajo,documento,nombre,domicilio) values ('A462','23545345','Gonzales Mónica','Pinto 444');
/*da error (db error: ERROR: duplicate key value violates unique constraint "alumnos_pkey" DETAIL: 
Key (documento)=(23545345) already exists.)*/

--6
insert into alumnos (legajo,documento,nombre,domicilio) values ('A462',null,'Gonzales Mónica','Pinto 444');
/*da error (db error: ERROR: null value in column "documento" of relation "alumnos" violates not-null constraint 
DETAIL: Failing row contains (A462, null, Gonzales Mónica, Pinto 444).)*/

---------------------------------------------------------------------------------------------------------------------------------------------
/*CAMPO ENTERO SERIAL(AUTOINCREMENTO)*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad integer,
  primary key (codigo)
);

2- Visualice la estructura de la tabla "medicamentos"

3- Ingrese los siguientes registros (insert into):
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

4- Verifique que el campo "código" generó los valores de modo automático.*/

--1
create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad int,
  primary key (codigo)
);

--2
select table_name,column_name,udt_name,character_maximum_length,is_nullable
from information_schema.columns
where table_name = 'medicamentos';

--3
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);

--4
select * from medicamentos;

/*Segundo problema:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".

1- Créela con la siguiente estructura:
 -codigo (serial),
 -titulo (cadena de 40),
 -actor (cadena de 20),
 -duracion (entero),
 -clave primaria: codigo.

2- Visualice la estructura de la tabla "peliculas".

3- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','xxx',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','xxx',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

4- Seleccione todos los registros y verifique la carga automática de los códigos.

5- Actualice las películas cuyo código es 3 colocando en "actor" 'Daniel R.'

6- Elimine la película 'La vida es bella'.

7- Elimine todas las películas cuya duración sea igual a 120 minutos.

8- Visualice los registros.

9- Ingrese el siguiente registro, sin valor para la clave primaria:
 insert into peliculas (titulo,actor,duracion)
  values('Mujer bonita','Richard Gere',120);
Note que sigue la secuencia tomando el último valor generado, aunque ya no está.*/

--1
create table peliculas(
  codigo serial,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
);

--2
select table_name,column_name,udt_name,character_maximum_length,is_nullable
from information_schema.columns
where table_name = 'peliculas';

--3
insert into peliculas (titulo,actor,duracion) values ('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values ('Harry Potter y la piedra filosofal','xxx',180);
insert into peliculas (titulo,actor,duracion) values ('Harry Potter y la camara secreta','xxx',190);
insert into peliculas (titulo,actor,duracion) values ('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion) values ('La vida es bella','zzz',220);

--4 y 8
select * from peliculas;

--5
update peliculas set actor = 'Daniel R.'
where codigo = 3;

--6
delete from peliculas
where titulo = 'La vida es bella';

--7
delete from peliculas
where duracion = 120;

--9
insert into peliculas (titulo,actor,duracion) values ('Mujer bonita','Richard Gere',120);

------------------------------------------------------------------------------------------------------------
/*COMANDO TRUNCATE TABLE*/
------------------------------------------------------------------------------------------------------------
/*Problema:
Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

1- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad integer,
  primary key (codigo)
 );

2- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

3- Elimine todos los registros con "delete"

4- Ingrese 2 registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

5- Vea los registros para verificar que continúa la secuencia al generar el valor para "codigo"

6- Vacíe la tabla con truncate table

7- Ingrese el siguiente registro:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);

8- Vea los registros*/

--1
create table medicamentos(
  codigo serial,
  nombre varchar(20),
  laboratorio varchar(20),
  precio float,
  cantidad int,
  primary key (codigo)
 );

--2
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);

--3
delete from medicamentos;

--4
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);

--5 y 8
select * from medicamentos;

--6
truncate table medicamentos;

--7
insert into medicamentos (nombre, laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);

----------------------------------------------------------------------------------------------------------------------------------------------
/*TIPO DE DATO TEXTO*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla llamada "autos".

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo "patente" como clave primaria:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

Hemos definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres siempre tendrá la misma longitud (6 caracteres).
Lo mismo sucede con el campo "modelo", en el cual almacenaremos el año, necesitamos 4 caracteres fijos.

2- Ingrese los siguientes registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

3- Seleccione todos los autos del año 1990:

4- Borre la tabla.

5- Crearla nuevamente con la misma estructura pero utilizando las otras palabras claves para los tipos de datos char y varchar.

6- Ingrese un registro.

7- Mostrar el contenido de la tabla.*/

--1
create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

--2
insert into autos values ('ACD123','Fiat 128','1970',15000);
insert into autos values('ACG234','Renault 11','1990',40000);
insert into autos values('BCD333','Peugeot 505','1990',80000);
insert into autos values('GCD123','Renault Clio','1990',70000);
insert into autos values('BCC333','Renault Megane','1998',95000);
insert into autos values('BVF543','Fiat 128','1975',20000);

--3
select *
from autos
where modelo = '1990';

--4
drop table autos;

--5
create table autos(
  patente character(6),
  marca character varying(20),
  modelo character(4),
  precio float,
  primary key (patente)
 );

--6
insert into autos values ('ABC123','Fiat 128','1985',30500);

--7
select * from autos;

/*Segundo problema:
Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".

1- Créela eligiendo el tipo de dato más adecuado para cada campo:
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

2- Analice la definición de los campos. Se utiliza char(8) para el documento porque siempre constará de 8 caracteres. Para el número telefónico 
se usar "varchar" y no un tipo numérico porque si bien es un número, con él no se realizarán operaciones matemáticas.

3- Ingrese algunos registros:
 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

4- Seleccione todos los clientes de apellido "Perez" (2 registros)*/

--1
create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

 --3
insert into clientes values('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into clientes (documento,apellido,nombre,domicilio) values ('2333344','Perez','Ana','Colon 234');
insert into clientes values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into clientes values('2533344','Juarez','Ana','Urquiza 444','4789900');

--4
select *
from clientes
where apellido = 'Perez';

---------------------------------------------------------------------------------------------------------------------------------------------
/*TIPO DE DATO NUMÉRICO*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas". La tabla contiene estos datos:
	Número de Cuenta	Documento	  Nombre		      Saldo
	______________________________________________________________
  1234			        25666777	  Pedro Perez	    500000.60
	2234			        27888999	  Juan Lopez	    -250000
	3344			        27888999	  Juan Lopez	    4000.50
	3346			        32111222	  Susana Molina	  1000


1- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 - Número de cuenta: entero, no puede haber valores repetidos, clave primaria;
 - Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 - Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 - Saldo de la cuenta: valores altos con decimales.

2- Ingrese los siguientes registros:
 insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);
Note que hay dos cuentas, con distinto número de cuenta, de la misma persona.

3- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

4- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 registros)

5- Muestre las cuentas con saldo negativo (1 registro)

6- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):*/

--1
create table cuentas(
  nro_cuenta int,
  documento char(8) not null,
  nombre_propietario varchar(30),
  saldo decimal(10,2),
  primary key(nro_cuenta)
);

--2
insert into cuentas(nro_cuenta,documento,nombre_propietario,saldo) values ('1234','25666777','Pedro Perez',500000.60);
insert into cuentas(nro_cuenta,documento,nombre_propietario,saldo) values ('2234','27888999','Juan Lopez',-250000);
insert into cuentas(nro_cuenta,documento,nombre_propietario,saldo) values ('3344','27888999','Juan Lopez',4000.50);
insert into cuentas(nro_cuenta,documento,nombre_propietario,saldo) values ('3346','32111222','Susana Molina',1000);

--3
select *
from cuentas
where saldo > 4000;

--4
select nro_cuenta, saldo
from cuentas
where nombre_propietario = 'Juan Lopez';

--5
select *
from cuentas
where saldo < 0;

--6
select *
from cuentas
where nro_cuenta >= 3000;

/*Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes datos: nombre, documento, sexo, domicilio, 
sueldobasico.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),--máximo estimado 99999.99
  cantidadhijos smallint --no superará los 255
 );

2- Ingrese algunos registros:
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

3- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al valor más cercano 800.89):
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

4- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)

5- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (2 registros):

6- Seleccione los nombres de los empleados que tengan hijos (3 registros):*/

--1
create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),
  cantidadhijos smallint 
 );

--2
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Ana Acosta','24555666','f','Colon 134',850,0);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

--3
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Susana Molina','29000555','f','Salta 876',5400.755,3);

--4
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Susana Molina','29000555','f','Salta 876',152000.90,3);
/*da error (desbordamiento de campo numeric)*/

--5
select *
from empleados
where sueldobasico <= 900;

--6
select nombre
from empleados
where cantidadhijos > 0;

--------------------------------------------------------------------------------------------------------------
/*TIPO DE DATO FECHA Y HORA*/
--------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  fechanacimiento date
 );

2- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año" 

3- Ingrese un alumno empleando distintos separadores para las fechas:
 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','20-08-1990','15/02/1972');

4- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');

5- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento":
 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

6- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
orden incorrecto "03-15-90":
 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
aparece un mensaje de error porque lo lee con el formato día, mes y año y no reconoce el mes 15.

7- Muestre todos los alumnos que ingresaron antes del '1-1-91'. 1 registro.

8- Muestre todos los alumnos que tienen "null" en "fechanacimiento". 1 registro.*/

--1
create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso date,
  fechanacimiento date
 );

--2
set datestyle to 'European';

--3
insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','20-08-1990','15/02/1972');
insert into alumnos values('Perez','Adolfo','23232323','Maipú 543','25/05/1995','07-10-1956');
insert into alumnos values('Wons','Daniela','31343124','Maipú 543','11.11.2011','14.02.1958');

--4
insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','3-3-91','15/2/72');

--5
 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);
  insert into alumnos values('Alanis','Marcelo','37655214','Rodriguez 124','12-04-97',null);

--6
insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
/*da error (ERROR:  valor de hora/fecha fuera de rango: «03-15-1990»)*/

--7
select *
from alumnos
where fechaingreso < '1-1-91';

--8
select *
from alumnos
where fechanacimiento is null;

----------------------------------------------------------------------------------------------------------------------------------------------
/*VALORES POR DEFECTO*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en 
su stand para luego enviarle publicidad de sus productos.

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

2- Vea la información de las columnas "column_default" y "is_nullable"

3- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la cláusula "default":
 insert into visitantes (nombre, domicilio, montocompra)
  values ('Susana Molina','Colon 123',59.80);
 insert into visitantes (nombre, edad, ciudad, mail)
  values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

4- Use la palabra "default" para ingresar valores en un insert.

5- Ingrese un registro con "default values".*/

--1
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
select column_name, column_default, is_nullable
from information_schema.columns
where table_name = 'visitantes';

--3
insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80);
insert into visitantes (nombre, edad, ciudad, mail) values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');

--4
insert into visitantes values ('Delfina Soriano',21,default,'Formosa 423',default,'2346212369',default,100.50);

--5
insert into visitantes default values;

/*Segundo problema:
Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla llamada "prestamos". En ella almacena la siguiente información:
título del libro, documento de identidad del socio a quien se le presta el libro, fecha de préstamo, fecha en que tiene que devolver el libro y 
si el libro ha sido o no devuelto.

1- Cree la tabla:
 create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'n'
 );

2- Ingrese algunos registros omitiendo el valor para los campos que lo admiten:
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
 insert into prestamos (titulo,documento,fechaprestamo)
  values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('El aleph','22543987','2006-12-16','2006-08-19');
 insert into prestamos (titulo,documento,fechaprestamo,devuelto)
  values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

3- Seleccione todos los registros

4- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

5- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)*/

--1
create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'n'
);

--2
insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion) values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
insert into prestamos (titulo,documento,fechaprestamo) values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion) values ('El aleph','22543987','2006-12-16','2006-08-19');
insert into prestamos (titulo,documento,fechaprestamo,devuelto) values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

--3
select * from prestamos;

--4
insert into prestamos values ('Manual de 2 grado','40123123','2006-05-02',default,default);

--5
insert into prestamos default values;
/*da error(ERROR:  el valor nulo en la columna «titulo» de la relación «prestamos» viola la restricción de no nulo
DETAIL:  La fila que falla contiene (null, null, null, null, n).*/

---------------------------------------------------------------------------------------------------------------------------------------------
/*COLUMNAS CALCULADAS (OPERADORES ARITMÉTICOS Y DE CONCATENACIÓN*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese nombre.

1- Cree la tabla:
 create table articulos(
  codigo serial,
  nombre varchar(20),
  descripcion varchar(30),
  precio decimal(9,2),
  cantidad smallint default 0,
  primary key (codigo)
 );

2- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

3- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los precios empleando operadores aritméticos.

4- Vea el resultado.

5- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos separados por coma.

6- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")*/

--1
create table articulos(
  codigo serial,
  nombre varchar(20),
  descripcion varchar(30),
  precio decimal(9,2),
  cantidad smallint default 0,
  primary key (codigo)
);

--2
insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad) values ('teclado','ingles Biswal',100,50);

--3
update articulos set precio = precio + (precio * 0.15);

--4
select * from articulos;

--5
select nombre || ',' || descripcion
from articulos;

--6
update articulos set cantidad = cantidad - 5
where nombre = 'teclado';

----------------------------------------------------------------------------------------------------------------------------------------------
/*ALIAS*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Trabaje con la tabla "libros" de una librería.

1- Cree la tabla:
 create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad smallint default 0,
  primary key (codigo)
 );

2- Ingrese algunos registros:
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

3- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto_total" en la que calcule el monto total en dinero de cada
libro (precio por cantidad)

4- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas extra en las cuales muestre el descuento
de cada libro, con el encabezado "descuento" y el precio con un 10% de descuento con el encabezado "precio_final".

5- Muestre una columna con el título y el autor concatenados con el encabezado "título_y_autor"*/

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
select *, (precio * cantidad) as "monto_total"
from libros;

--4
select titulo, autor, precio, (precio * 0.1) as "descuento", (precio - (precio * 0.1)) as "precio_final"
from libros
where editorial = 'Emece';

--5
select (titulo || autor) as "título_y_autor"
from libros;