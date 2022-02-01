---------------------------------------------------------------------------------------------------------------------------------------------
/*COMBINACIÓN DE MÁS DE DOS TABLAS*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los socios, en una tabla llamada "deportes" 
la información referente a los diferentes deportes que se dictan y en una tabla denominada "inscriptos", las inscripciones de los socios 
a los distintos deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el mismo deporte el mismo año. Distintos socios 
se inscriben en un mismo deporte en el mismo año.

1- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

2- Ingrese algunos registros en "socios":
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
 
3- Ingrese algunos registros en "deportes":
 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

4- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

5- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

6- Inscriba a un mismo socio en distintos deportes el mismo año:
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

7- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no exista en "socios":
 insert into inscriptos values ('26666666',0,'2006','s');

8- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando diferentes tipos de join.

9- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas inscripciones cuyo código de deporte no existe 
en "deportes" y cuyo documento de socio no se encuentra en "socios".

10- Muestre todas las inscripciones del socio con documento "22222222".*/

--1
drop table if exists socios;

create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
);

drop table if exists deportes;

create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
);

drop table if exists inscriptos;

create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
);

--2
insert into socios values ('22222222','Ana Acosta','Avellaneda 111');
insert into socios values ('23333333','Betina Bustos','Bulnes 222');
insert into socios values ('24444444','Carlos Castro','Caseros 333');
insert into socios values ('25555555','Daniel Duarte','Dinamarca 44');

--3
insert into deportes(nombre,profesor) values ('basquet','Juan Juarez');
insert into deportes(nombre,profesor) values ('futbol','Pedro Perez');
insert into deportes(nombre,profesor) values ('natacion','Marina Morales');
insert into deportes(nombre,profesor) values ('tenis','Marina Morales');

--4
insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');

--5
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');

--6
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

--7
insert into inscriptos values ('26666666',0,'2006','s');

--8
select s.nombre, d.nombre, i.anio
from socios as s inner join inscriptos as i on (s.documento = i.documento)
                 left join deportes as d on (i.codigodeporte = d.codigo)
where d.codigo is not null;

--9
select i.documento, s.nombre, i.anio, i.matricula
from socios as s full join inscriptos as i on (s.documento = i.documento)
                 full join deportes as d on (i.codigodeporte = d.codigo);
				 
--10
select s.nombre, i.anio, d.nombre, i.matricula
from socios as s inner join inscriptos as i on (s.documento = i.documento)
                 inner join deportes as d on (i.codigodeporte = d.codigo)
where i.documento like '22222222';

--------------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIONES (FOREIGN KEY)*/
--------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres 
de las provincias.
1- Cree las tablas "clientes" y "provincias":

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
 );

En este ejemplo, el campo "codigoprovincia" de "clientes" es una clave foránea, se emplea para enlazar la tabla "clientes" con "provincias".

2- Intente agregar una restricción "foreign key" a la tabla "clientes" que haga referencia al campo "codigo" de "provincias" (No se puede 
porque "provincias" no tiene restricción "primary key" "unique")

3- Establezca una restricción "primary key" al campo "codigo" de "provincias"

4- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Luisa Lopez','Juarez 555','La Plata',6);

5- Intente agregar la restricción "foreign key" del punto 2 a la tabla "clientes". No se puede porque hay un registro en "clientes" cuyo
valor de "codigoprovincia" no existe en "provincias".

6- Elimine el registro de "clientes" que no cumple con la restricción y establezca la restricción nuevamente.

7- Intente agregar un cliente con un código de provincia inexistente en "provincias". No se puede.

8- Intente eliminar el registro con código 3, de "provincias". No se puede porque hay registros en "clientes" al cual hace referencia.

9- Elimine el registro con código "4" de "provincias". Se permite porque en "clientes" ningún registro hace referencia a él.

10- Intente modificar el registro con código 1, de "provincias". No se puede porque hay registros en "clientes" al cual hace referencia.*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint,
  primary key(codigo)
);

drop table if exists provincias;
 
create table provincias(
  codigo serial,
  nombre varchar(20)
);

--2, 5 y 6
alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key(codigoprovincia) references provincias(codigo);
/*2: da error (db error: ERROR: there is no unique constraint matching given keys for referenced table "provincias")
  5: da error (db error: ERROR: insert or update on table "clientes" violates foreign key constraint 
     "fk_clientes_codigoprovincia" DETAIL: Key (codigoprovincia)=(6) is not present in table "provincias".)*/

--3
alter table provincias
add constraint PK_provincias_codigo
primary key (codigo);

--4
insert into provincias values (1,'Cordoba');
insert into provincias values (2,'Santa Fe');
insert into provincias values (3,'Misiones');
insert into provincias values (4,'Rio Negro');

insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Moreno Marcos','Colon 234','Rosario',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Acosta Ana','Avellaneda 333','Posadas',3);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Luisa Lopez','Juarez 555','La Plata',6);

--6
delete from clientes
where codigoprovincia = 6;

--7
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Luisana Menendez','Formosa 444','Tandil',5);
/*da error (db error: ERROR: insert or update on table "clientes" violates foreign key constraint "fk_clientes_codigoprovincia" 
DETAIL: Key (codigoprovincia)=(5) is not present in table "provincias".)*/

--8
delete from provincias
where codigo = 3;
/*da error (db error: ERROR: update or delete on table "provincias" violates foreign key constraint "fk_clientes_codigoprovincia" 
on table "clientes" DETAIL: Key (codigo)=(3) is still referenced from table "clientes".)*/

--9
delete from provincias
where codigo = 4;

--10
update provincias set codigo = 5
where codigo = 1;
/*da error (db error: ERROR: update or delete on table "provincias" violates foreign key constraint "fk_clientes_codigoprovincia" 
on table "clientes" DETAIL: Key (codigo)=(1) is still referenced from table "clientes".)*/

-------------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIONES FOREIGN KEY EN LA MISMA TABLA*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa registra los datos de sus clientes en una tabla llamada "clientes". Dicha tabla contiene un campo que hace referencia al cliente 
que lo recomendó denominado "referenciadopor". Si un cliente no ha sido referenciado por ningún otro cliente, tal campo almacena "null".
1- Creemos la tabla:
 create table clientes(
  codigo int,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
 );

2- Ingresamos algunos registros:
 insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

3- Intente agregar una restricción "foreign key" para evitar que en el campo "referenciadopor" se ingrese un valor de código de cliente que 
no exista. No se permite porque existe un registro que no cumple con la restricción que se intenta establecer.

4- Cambie el valor inválido de "referenciadopor" del registro que viola la restricción por uno válido.

5- Agregue la restricción "foreign key" que intentó agregar en el punto 3.

6- Intente agregar un registro que infrinja la restricción. No lo permite.

7- Intente modificar el código de un cliente que está referenciado en "referenciadopor". No se puede.

8- Intente eliminar un cliente que sea referenciado por otro en "referenciadopor". No se puede.
 
9- Cambie el valor de código de un cliente que no referenció a nadie.

10- Elimine un cliente que no haya referenciado a otros.*/

--1
drop table if exists clientes;

create table clientes(
  codigo int,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
);

--2
insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
insert into clientes values (90,'Marta Juarez','Colon 345','Carlos Paz',null);
insert into clientes values (110,'Fabian Torres','San Martin 987','Cordoba',50);
insert into clientes values (125,'Susana Garcia','Colon 122','Carlos Paz',90);
insert into clientes values (140,'Ana Herrero','Colon 890','Carlos Paz',9);

--3 y 5
alter table clientes
add constraint FK_clientes_referenciadopor
foreign key (referenciadopor) references clientes(codigo);
/*da error(ERROR:  inserción o actualización en la tabla «clientes» viola la llave foránea «fk_clientes_referenciadopor»
DETAIL:  La llave (referenciadopor)=(9) no está presente en la tabla «clientes».))*/

--4
update clientes set referenciadopor = 125
where referenciadopor = 9;

--6
insert into clientes values (153,'Paula Hernandez','Quintana 645','Tandil',35);
/*da error(ERROR:  inserción o actualización en la tabla «clientes» viola la llave foránea «fk_clientes_referenciadopor»
DETAIL:  La llave (referenciadopor)=(35) no está presente en la tabla «clientes».))*/

--7
update clientes set referenciadopor = 45
where referenciadopor = 50;
/*da error(ERROR:  inserción o actualización en la tabla «clientes» viola la llave foránea «fk_clientes_referenciadopor»
DETAIL:  La llave (referenciadopor)=(45) no está presente en la tabla «clientes».))*/

--8
delete from clientes
where codigo = 50;
/*da error(ERROR:  update o delete en «clientes» viola la llave foránea «fk_clientes_referenciadopor» en la tabla «clientes»
DETAIL:  La llave (codigo)=(50) todavía es referida desde la tabla «clientes».))*/

--9
update clientes set codigo = 155
where codigo = 140;

--10
delete from clientes
where codigo = 110;

-------------------------------------------------------------------------------------------------------------------------------------------
/*RESTRICCIONES FOREIGN KEY (ACCIONES)*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres 
de las provincias.
1- Cree las tablas "clientes" y "provincias":

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint,
  primary key(codigo)
 );

 create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes(nombre,domicilio,ciudad,codigoprovincia) 
  values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes(nombre,domicilio,ciudad,codigoprovincia)
  values('Acosta Ana','Avellaneda 333','Posadas',3);

3- Establezca una restricción "foreign key" especificando la acción "en cascade" para actualizaciones y "no_action" para eliminaciones.

4- Intente eliminar el registro con código 3, de "provincias". No se puede porque hay registros en "clientes" al cual hace referencia y 
la opción para eliminaciones se estableció como "no action".

5- Modifique el registro con código 3, de "provincias".

6- Verifique que el cambio se realizó en cascada, es decir, que se modificó en la tabla "provincias" y en "clientes".

7- Intente modificar la restricción "foreign key" para que permita eliminación en cascada. Mensaje de error, no se pueden modificar las 
restricciones.

8- Intente eliminar la tabla "provincias". No se puede eliminar porque una restricción "foreign key" hace referencia a ella.*/

--1
drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia smallint,
  primary key(codigo)
);

drop table if exists provincias;

create table provincias(
  codigo serial,
  nombre varchar(20),
  primary key(codigo)
);

--2
insert into provincias values (1,'Cordoba');
insert into provincias values (2,'Santa Fe');
insert into provincias values (3,'Misiones');
insert into provincias values (4,'Rio Negro');

insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Moreno Marcos','Colon 234','Rosario',2);
insert into clientes(nombre,domicilio,ciudad,codigoprovincia) values ('Acosta Ana','Avellaneda 333','Posadas',3);

--3
alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key(codigoprovincia) references provincias(codigo)
on update cascade
on delete no action;

--4
delete from provincias
where codigo = 3;
/*da error(ERROR:  update o delete en «provincias» viola la llave foránea «fk_clientes_codigoprovincia» en la tabla «clientes»
DETAIL:  La llave (codigo)=(3) todavía es referida desde la tabla «clientes».))*/

--5
update provincias set codigo = 5
where codigo = 3;

--6
select * from provincias; 

select * from clientes;

--7
alter table clientes
add constraint FK_clientes_codigoprovincia
foreign key(codigoprovincia) references provincias(codigo)
on update cascade
on delete cascade;
/*da error(ERROR:  la restricción «fk_clientes_codigoprovincia» para la relación «clientes» ya existe))*/

--8
drop table provincias;
/*da error(ERROR:  no se puede eliminar tabla provincias porque otros objetos dependen de él
DETAIL:  restricción «fk_clientes_codigoprovincia» en tabla clientes depende de tabla provincias
HINT:  Use DROP ... CASCADE para eliminar además los objetos dependientes.)*/

---------------------------------------------------------------------------------------------------------------------------------------------
/*UNIÓN*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un supermercado almacena en una tabla denominada "proveedores" los datos de las compañías que le proveen de mercaderías; en una tabla llamada 
"clientes", los datos de los comercios que le compran y en otra tabla "empleados" los datos de los empleados.
1- Cree las tablas:
 create table proveedores(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table clientes(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );

2- Ingrese algunos registros:
 insert into proveedores(nombre,domicilio) values('Bebida cola','Colon 123');
 insert into proveedores(nombre,domicilio) values('Carnes Unica','Caseros 222');
 insert into proveedores(nombre,domicilio) values('Lacteos Blanca','San Martin 987');
 insert into clientes(nombre,domicilio) values('Supermercado Lopez','Avellaneda 34');
 insert into clientes(nombre,domicilio) values('Almacen Anita','Colon 987');
 insert into clientes(nombre,domicilio) values('Garcia Juan','Sucre 345');
 insert into empleados values('23333333','Federico','Lopez','Colon 987');
 insert into empleados values('28888888','Ana','Marquez','Sucre 333');
 insert into empleados values('30111111','Luis','Perez','Caseros 956');

3- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y empleados y necesita el nombre y domicilio 
de todos ellos. Emplee el operador "union" para obtener dicha información de las tres tablas.

4- Agregue un registro donde un proveedor sea también un cliente y obtenga el nombre y domicilio de todos ellos, incluyendo los duplicados.

5- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y ordene por dicha columna.*/

--1
drop table if exists proveedores;

create table proveedores(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
);

drop table if exists clientes;

create table clientes(
  codigo serial,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
);

drop table if exists empleados;

create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
);

--2
insert into proveedores(nombre,domicilio) values ('Bebida cola','Colon 123');
insert into proveedores(nombre,domicilio) values ('Carnes Unica','Caseros 222');
insert into proveedores(nombre,domicilio) values ('Lacteos Blanca','San Martin 987');
insert into clientes(nombre,domicilio) values ('Supermercado Lopez','Avellaneda 34');
insert into clientes(nombre,domicilio) values ('Almacen Anita','Colon 987');
insert into clientes(nombre,domicilio) values ('Garcia Juan','Sucre 345');
insert into empleados values ('23333333','Federico','Lopez','Colon 987');
insert into empleados values ('28888888','Ana','Marquez','Sucre 333');
insert into empleados values ('30111111','Luis','Perez','Caseros 956');

--3
select nombre, domicilio
from proveedores
union
select nombre, domicilio
from clientes
union 
select (nombre || '' || apellido), domicilio
from empleados;

--4
insert into clientes(nombre,domicilio) values ('Bebida cola','Colon 123');

select nombre, domicilio
from proveedores
union all
select nombre, domicilio
from clientes
union all
select (nombre || '' || apellido), domicilio
from empleados;

--5
select nombre, domicilio, 'Proveedor' as "Categoría"
from proveedores
union
select nombre, domicilio, 'Cliente' as "Categoría"
from clientes
union 
select (nombre || '' || apellido), domicilio, 'Empleado' as "Categoria"
from empleados
order by 3;

-----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTAS COMO EXPRESIÓN*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un profesor almacena el documento, nombre y la nota final de cada alumno de su clase en una tabla llamada "alumnos".

1- Créela  
 create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento)
 );

2-Ingrese algunos registros:
 insert into alumnos values('30111111','Ana Algarbe',5.1);
 insert into alumnos values('30222222','Bernardo Bustamante',3.2);
 insert into alumnos values('30333333','Carolina Conte',4.5);
 insert into alumnos values('30444444','Diana Dominguez',9.7);
 insert into alumnos values('30555555','Fabian Fuentes',8.5);
 insert into alumnos values('30666666','Gaston Gonzalez',9.70);

3- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta. (2 registros)

4- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del máximo valor de nota, el documento. Mensaje de 
error, porque la lista de selección de una subconsulta que va luego de un operador de comparación puede incluir sólo un campo o expresión 
(excepto si se emplea "exists" o "in").

5- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el promedio. (3 registros)

6- Cambie la nota del alumno que tiene la menor nota por 4. (1 registro modificado)

7- Elimine los alumnos cuya nota es menor al promedio. (3 registros eliminados)*/

--1
drop table if exists alumnos;

create table alumnos(
  documento char(8),
  nombre varchar(30),
  nota decimal(4,2),
  primary key(documento)
);

--2
insert into alumnos values ('30111111','Ana Algarbe',5.1);
insert into alumnos values ('30222222','Bernardo Bustamante',3.2);
insert into alumnos values ('30333333','Carolina Conte',4.5);
insert into alumnos values ('30444444','Diana Dominguez',9.7);
insert into alumnos values ('30555555','Fabian Fuentes',8.5);
insert into alumnos values ('30666666','Gaston Gonzalez',9.70);

--3
select documento, nombre, nota
from alumnos
where nota = (select max(nota)
              from alumnos);

--4
select documento, nombre, nota
from alumnos
where nota = (select max(nota), documento
              from alumnos
			  GROUP BY 2);
/*da error(ERROR:  la subconsulta debe retornar sólo una columna)*/

--5
select documento, nombre, nota, ((select avg(nota) 
                                 from alumnos ) - nota) as "Dif con promedio"
from alumnos
where nota < (select avg(nota) 
              from alumnos);

--6
update alumnos set nota = 4
where nota = (select min(nota)
              from alumnos);

--7
delete from alumnos
where nota < (select avg(nota)
              from alumnos);

-----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTAS CON IN*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "ciudades" donde registra los nombres de 
las ciudades.

1- Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, nombre). Agregue una restricción 
"primary key" para el campo "codigo" de ambas tablas):
 create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

 create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad smallint not null,
  primary key(codigo)
 );

2- Ingrese algunos registros para ambas tablas:
 insert into ciudades (nombre) values('Cordoba');
 insert into ciudades (nombre) values('Cruz del Eje');
 insert into ciudades (nombre) values('Carlos Paz');
 insert into ciudades (nombre) values('La Falda');
 insert into ciudades (nombre) values('Villa Maria');

 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
 insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
 insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
 insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);

3- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle "San Martin", empleando subconsulta.(3 registros)

4- Obtenga la misma salida anterior pero empleando join.

5- Obtenga los nombre de las ciudades de los clientes cuyo nombre no comienza con una letra específica, empleando subconsulta.

6- Pruebe la subconsulta del punto 5 separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo.*/

--1
drop table if exists ciudades;

create table ciudades(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
);

drop table if exists clientes;

create table clientes (
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  codigociudad smallint not null,
  primary key(codigo)
);

--2
insert into ciudades (nombre) values ('Cordoba');
insert into ciudades (nombre) values ('Cruz del Eje');
insert into ciudades (nombre) values ('Carlos Paz');
insert into ciudades (nombre) values ('La Falda');
insert into ciudades (nombre) values ('Villa Maria');

insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);

--3
select c.nombre
from ciudades as c
where c.codigo in (select cl.codigociudad
                   from clientes as cl 
                   where domicilio like 'San Martin%');

--4
select c.nombre
from ciudades as c inner join clientes as cl on (c.codigo = cl.codigociudad)
where cl.domicilio like 'San Martin%';

--5
select c.nombre
from ciudades as c
where codigo not in (select cl.codigociudad
                     from clientes as cl
                     where cl.nombre like 'L%');

--6
select cl.codigociudad
from clientes as cl
where cl.nombre like 'L%';

-----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTAS ANY - SOME - ALL*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", 
el código del deporte en el cual se inscribe y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
1- Cree las tablas:
 create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
 );

2- Ingrese algunos registros:
 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

3- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de ambas tablas.

4- Muestre los socios que serán compañeros en tenis y también en natación (empleando subconsulta) (3 filas devueltas)

5- Vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2. (3 filas)

6- Obtenga el mismo resultado anterior pero empleando join.

7- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se inscribió el socio 1.(2 registros)

8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se inscribió el socio 1.(1 registro.)

9- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se lo borra de la inscripción de todos los 
deportes. Elimine todos los socios que no pagaron ninguna cuota en algún deporte. (7 registros).*/

--1
drop table if exists socios;

create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);

drop table if exists inscriptos;

create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
);

--2
insert into socios(documento,nombre,domicilio) values ('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values ('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values ('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values ('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values (1,'tenis',1);
insert into inscriptos values (1,'basquet',2);
insert into inscriptos values (1,'natacion',1);
insert into inscriptos values (2,'tenis',9);
insert into inscriptos values (2,'natacion',1);
insert into inscriptos values (2,'basquet',default);
insert into inscriptos values (2,'futbol',2);
insert into inscriptos values (3,'tenis',8);
insert into inscriptos values (3,'basquet',9);
insert into inscriptos values (3,'natacion',0);
insert into inscriptos values (4,'basquet',10);

--3
select i.numerosocio, s.nombre, i.deporte
from inscriptos as i inner join socios as s on (i.numerosocio = s.numero);

--4
select s.numero, s.nombre
from socios as s inner join inscriptos as i on (s.numero = i.numerosocio)
where i.deporte = 'tenis' 
  and s.numero in (select ins.numerosocio
                   from inscriptos as ins
                   where ins.deporte = 'natacion');

--otra forma
select s.numero, s.nombre
from socios as s inner join inscriptos as i on (s.numero = i.numerosocio)
where i.deporte = 'tenis' 
  and s.numero = any (select ins.numerosocio
                   from inscriptos as ins
                   where ins.deporte = 'natacion');           

--5
select i.deporte
from inscriptos as i
where i.numerosocio = 1
  and i.deporte = any(select ins.deporte
                          from inscriptos as ins
                          where ins.numerosocio = 2);

--6
select i1.deporte
from inscriptos as i1 inner join inscriptos as i2 on (i1.deporte = i2.deporte)
where i1.numerosocio = 1
  and i2.numerosocio = 2;

--7
select i2.deporte
from inscriptos as i2
where i2.numerosocio = 2
  and i2.cuotas > any (select i1.cuotas
                       from inscriptos as i1
                       where i1.numerosocio = 1);

--8
select i2.deporte
from inscriptos as i2
where i2.numerosocio = 2
  and i2.cuotas > all (select i1.cuotas
                       from inscriptos as i1
                       where i1.numerosocio = 1);

--9
delete from inscriptos as inscr
where inscr.numerosocio = any (select insc.numerosocio
                               from inscriptos as insc
                               where insc.cuotas = 0
                               or insc.cuotas is null);

-----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTAS CORRELACIONADAS*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", 
el código del deporte en el cual se inscribe y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
1- Cree las tablas:
 create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
 );

2- Ingrese algunos registros:
 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

3- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de deportes a los cuales se ha inscripto, empleando 
subconsulta. (4 registros)

4- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada deporte) y el total de cuotas pagas, empleando 
subconsulta. (4 registros)

5- Obtenga la misma salida anterior empleando join.*/

--1
drop table if exists socios;

create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);

drop table if exists inscriptos;

create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
);

--2
insert into socios(documento,nombre,domicilio) values ('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values ('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values ('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values ('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values (1,'tenis',1);
insert into inscriptos values (1,'basquet',2);
insert into inscriptos values (1,'natacion',1);
insert into inscriptos values (2,'tenis',9);
insert into inscriptos values (2,'natacion',1);
insert into inscriptos values (2,'basquet',default);
insert into inscriptos values (2,'futbol',2);
insert into inscriptos values (3,'tenis',8);
insert into inscriptos values (3,'basquet',9);
insert into inscriptos values (3,'natacion',0);
insert into inscriptos values (4,'basquet',10);

--3
select s.nombre, s.domicilio, (select count(*)
                               from inscriptos as i
                               where i.numerosocio = s.numero) as "#Deportes que practica"
from socios as s;

--4
select s.nombre, 10 * (select count(i.deporte)
                       from inscriptos as i
                       where i.numerosocio = s.numero) as "#Cuotas a pagar", (select sum(i1.cuotas)
                                                                              from inscriptos as i1
                                                                              where i1.numerosocio = s.numero) as "#Cuotas pagas"
from socios as s; 

--5
select s.nombre, 10 * count(i.deporte) as "#Cuotas a pagar", sum(i.cuotas) as "#Cuotas pagas"
from inscriptos as i inner join socios as s on (i.numerosocio = s.numero)
group by 1;

----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTAS (EXISTS Y NOT EXISTS)*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", 
el código del deporte en el cual se inscribe y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.

1- Cree las tablas:
 create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
 );

2- Ingrese algunos registros:
 insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
 insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

3- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se inscribieron en 'natacion'. (3 registros)

4- Busque los socios que NO se han inscripto en 'natacion' empleando "not exists". (1 registro)

5- Muestre todos los datos de los socios que han pagado todas las cuotas. (1 registro)*/

--1
drop table if exists socios;

create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);
 
drop table if exists inscriptos;

create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas smallint,
  primary key(numerosocio,deporte)
);

--2
insert into socios(documento,nombre,domicilio) values ('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values ('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values ('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values ('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values (1,'tenis',1);
insert into inscriptos values (1,'basquet',2);
insert into inscriptos values (1,'natacion',1);
insert into inscriptos values (2,'tenis',9);
insert into inscriptos values (2,'natacion',1);
insert into inscriptos values (2,'basquet',default);
insert into inscriptos values (2,'futbol',2);
insert into inscriptos values (3,'tenis',8);
insert into inscriptos values (3,'basquet',9);
insert into inscriptos values (3,'natacion',0);
insert into inscriptos values (4,'basquet',10);

--3
select s.numero, s.nombre
from socios as s 
where exists (select *
              from inscriptos as i
              where s.numero = i.numerosocio
              and deporte like 'natacion');

--4
select s.numero, s.nombre
from socios as s 
where not exists (select *
                  from inscriptos as i
                  where s.numero = i.numerosocio
                  and deporte like 'natacion');

--5
select *
from socios as s
where exists (select *
              from inscriptos as i
              where s.numero = i.numerosocio
                and i.cuotas = 10);

---------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTA SIMIL AUTOCOMBINACIÓN*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "deportes" en la cual almacena el nombre del deporte, 
el nombre del profesor que lo dicta, el día de la semana que se dicta y el costo de la cuota mensual.
1- Cree la tabla:
 create table deportes(
  nombre varchar(15),
  profesor varchar(30),
  dia varchar(10),
  cuota decimal(5,2)
 );
 
2- Ingrese algunos registros. Incluya profesores que dicten más de un curso:
 insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);

3- Muestre los nombres de los profesores que dictan más de un deporte empleando subconsulta.

4- Obtenga el mismo resultado empleando join.

5- Buscamos todos los deportes que se dictan el mismo día que un determinado deporte (natacion) empleando subconsulta.

6- Obtenga la misma salida empleando "join".*/

--1
drop table if exists deportes;

create table deportes(
  nombre varchar(15),
  profesor varchar(30),
  dia varchar(10),
  cuota decimal(5,2)
);

--2
insert into deportes values ('natacion','Ana Lopez','martes',15);
insert into deportes values ('futbol','Carlos Fuentes','miercoles',10);
insert into deportes values ('basquet','Gaston Garcia','jueves',15);
insert into deportes values ('padle','Juan Huerta','lunes',15);
insert into deportes values ('handball','Juan Huerta','martes',10);

--3
select distinct d1.profesor
from deportes as d1
where 1 < (select count(profesor)
           from deportes as d2
           where d1.profesor = d2.profesor);

--otra forma
select distinct d1.profesor
from deportes as d1
where d1.profesor in (select d2.profesor
                      from deportes as d2 
                      where d1.nombre <> d2.nombre);

--4
select distinct d1.profesor
from deportes as d1 inner join deportes as d2 on (d1.profesor = d2.profesor)
where d1.nombre <> d2.nombre;

--5
select d1.nombre
from deportes as d1
where d1.nombre <> 'natacion'
  and d1.dia in (select d2.dia
                 from deportes as d2
                 where d2.nombre like'natacion');

--6
select d2.nombre
from deportes as d1 inner join deportes as d2 on (d1.dia = d2.dia)
where d1.nombre like 'natacion'
  and d1.nombre <> d2.nombre;

----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTA EN LUGAR DE UNA TABLA*/
----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los socios, en una tabla llamada "deportes" la 
información referente a los diferentes deportes que se dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los 
distintos deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el mismo deporte el mismo año. Distintos socios 
se inscriben en un mismo deporte en el mismo año.

1- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año)
 );

2- Ingrese algunos registros en las 3 tablas:
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
 insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
 insert into deportes(nombre,profesor) values('natacion','Marina Morales');
 insert into deportes(nombre,profesor) values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2016','s');
 insert into inscriptos values ('23333333',3,'2016','s');
 insert into inscriptos values ('24444444',3,'2016','n');
 insert into inscriptos values ('22222222',3,'2015','s');
 insert into inscriptos values ('22222222',3,'2017','n');
 insert into inscriptos values ('24444444',1,'2016','s');
 insert into inscriptos values ('24444444',2,'2016','s');

3- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el nombre del deporte y del profesor.
Esta consulta es un join.

4- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una tabla para realizar un "join" y recuperar 
el nombre del socio, el deporte en el cual está inscripto, el año, el nombre del profesor y la matrícula.*/

--1
drop table if exists socios;

create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
);

drop table if exists deportes;

create table deportes(
  codigo serial,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
);

drop table if exists inscriptos;

create table inscriptos(
  documento char(8) not null, 
  codigodeporte smallint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año)
);

--2
insert into socios values ('22222222','Ana Acosta','Avellaneda 111');
insert into socios values ('23333333','Betina Bustos','Bulnes 222');
insert into socios values ('24444444','Carlos Castro','Caseros 333');
insert into socios values ('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes(nombre,profesor) values ('basquet','Juan Juarez');
insert into deportes(nombre,profesor) values ('futbol','Pedro Perez');
insert into deportes(nombre,profesor) values ('natacion','Marina Morales');
insert into deportes(nombre,profesor) values ('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2016','s');
insert into inscriptos values ('23333333',3,'2016','s');
insert into inscriptos values ('24444444',3,'2016','n');
insert into inscriptos values ('22222222',3,'2015','s');
insert into inscriptos values ('22222222',3,'2017','n');
insert into inscriptos values ('24444444',1,'2016','s');
insert into inscriptos values ('24444444',2,'2016','s');

--3
select i.*, d.nombre, d.profesor
from inscriptos as i inner join deportes as d on (i.codigodeporte = d.codigo);

--4
select s.nombre, td.nombre, td.año, td.profesor, td.matricula -- td = tabla derivada
from socios as s inner join (select i.*, d.nombre, d.profesor
                             from inscriptos as i inner join deportes as d on (i.codigodeporte = d.codigo)) as td on (s.documento = td.documento);

---------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTA (UPDATE - DELETE)*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada "inscriptos" en la cual almacena el número de "socio", 
el código del deporte en el cual se inscribe y si la matricula está o no paga, y una tabla denominada "socios" en la que guarda los datos
personales de cada socio.
1- Cree las tablas:
create table socios(
numero serial,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
matricula char(1),-- 'n' o 's'
primary key(numerosocio,deporte)
);
2- Ingrese algunos registros:
insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');
insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(1,'basquet','s');
insert into inscriptos values(1,'natacion','s');
insert into inscriptos values(2,'tenis','s');
insert into inscriptos values(2,'natacion','s');
insert into inscriptos values(2,'basquet','n');
insert into inscriptos values(2,'futbol','n');
insert into inscriptos values(3,'tenis','s');
insert into inscriptos values(3,'basquet','s');
insert into inscriptos values(3,'natacion','n');
insert into inscriptos values(4,'basquet','n');
3- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) empleando subconsulta.

4- Elimine todas las inscripciones de los socios que deben alguna matrícula.*/

--1
drop table if exists socios;

create table socios(
  numero serial,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
);

drop table if exists inscriptos;

create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte)
);

--2
insert into socios(documento,nombre,domicilio) values ('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values ('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values ('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values ('26666666','Hector Lopez','Sucre 344');
insert into inscriptos values (1,'tenis','s');
insert into inscriptos values (1,'basquet','s');
insert into inscriptos values (1,'natacion','s');
insert into inscriptos values (2,'tenis','s');
insert into inscriptos values (2,'natacion','s');
insert into inscriptos values (2,'basquet','n');
insert into inscriptos values (2,'futbol','n');
insert into inscriptos values (3,'tenis','s');
insert into inscriptos values (3,'basquet','s');
insert into inscriptos values (3,'natacion','n');
insert into inscriptos values (4,'basquet','n');

--3
update inscriptos set matricula = 's'
where numerosocio = (select numero
                     from socios
                     where documento like '24444444');

--4
delete from inscriptos
where numerosocio in (select numerosocio
                      from inscriptos
                      where matricula like 'n');

-----------------------------------------------------------------------------------------------------------------------------------------------
/*SUBCONSULTA (INSERT)*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una tabla llamada "facturas" y otra "clientes".
1-Cree las tablas:
create table clientes(
codigo serial,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);
create table facturas(
numero int not null,
fecha date,
codigocliente int not null,
total decimal(6,2),
primary key(numero)
);
2-Ingrese algunos registros:
insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');
insert into clientes(nombre,domicilio) values('Susana Molina','San Martin 555');
insert into facturas values(1200,'2017-01-15',1,300);
insert into facturas values(1201,'2017-01-15',2,550);
insert into facturas values(1202,'2017-01-15',3,150);
insert into facturas values(1300,'2017-01-20',1,350);
insert into facturas values(1310,'2017-01-22',3,100);
3- El comercio necesita una tabla llamada "clientespref" en la cual quiere almacenar el nombre y domicilio de aquellos clientes que han 
comprado hasta el momento más de 500 pesos en mercaderías.
Créela la tabla:
create table clientespref(
nombre varchar(30),
domicilio varchar(30)
);
4- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y "facturas".

5- Vea los registros de "clientespref".*/

--1
drop table if exists clientes;

create table clientes(
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
);

drop table if exists facturas;

create table facturas(
  numero int not null,
  fecha date,
  codigocliente int not null,
  total decimal(6,2),
  primary key(numero)
);

--2
insert into clientes(nombre,domicilio) values ('Juan Lopez','Colon 123');
insert into clientes(nombre,domicilio) values ('Luis Torres','Sucre 987');
insert into clientes(nombre,domicilio) values ('Ana Garcia','Sarmiento 576');
insert into clientes(nombre,domicilio) values ('Susana Molina','San Martin 555');
insert into facturas values (1200,'2017-01-15',1,300);
insert into facturas values (1201,'2017-01-15',2,550);
insert into facturas values (1202,'2017-01-15',3,150);
insert into facturas values (1300,'2017-01-20',1,350);
insert into facturas values (1310,'2017-01-22',3,100);

--3
drop table if exists clientespref;

create table clientespref(
  nombre varchar(30),
  domicilio varchar(30)
);

--4
insert into clientespref(nombre,domicilio)
select c.nombre, c.domicilio
from facturas as f inner join clientes as c on (f.codigocliente = c.codigo)
group by 1, 2
having sum(f.total) > 500;

--otra forma
insert into clientespref
select nombre,domicilio
from clientes
where codigo in (select codigocliente
                 from clientes as c
                 join facturas as f on codigocliente=codigo
                 group by codigocliente
                 having sum(total)>500);

--5
select * from clientespref;

-----------------------------------------------------------------------------------------------------------------------------------------------
/*VISTAS*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Un club dicta cursos de distintos deportes. Almacena la información en varias tablas. El director no quiere que los empleados de administración 
conozcan la estructura de las tablas ni algunos datos de los profesores y socios, por ello se crean vistas a las cuales tendrán acceso.
1- Crear las tablas:
create table socios(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
primary key (documento)
);

create table profesores(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
primary key (documento)
);

create table cursos(
numero serial,
deporte varchar(20),
dia varchar(15),
documentoprofesor char(8),
primary key (numero)
);

create table inscriptos(
documentosocio char(8) not null,
numero smallint not null,
matricula char(1),
primary key (documentosocio,numero)
);

2- Ingrese algunos registros para todas las tablas:
insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos(deporte,dia,documentoprofesor) values('tenis','lunes','22222222');
insert into cursos(deporte,dia,documentoprofesor) values('tenis','martes','22222222');
insert into cursos(deporte,dia,documentoprofesor) values('natacion','miercoles','22222222');
insert into cursos(deporte,dia,documentoprofesor) values('natacion','jueves','23333333');
insert into cursos(deporte,dia,documentoprofesor) values('natacion','viernes','23333333');
insert into cursos(deporte,dia,documentoprofesor) values('futbol','sabado','24444444');
insert into cursos(deporte,dia,documentoprofesor) values('futbol','lunes','24444444');
insert into cursos(deporte,dia,documentoprofesor) values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');

3- Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día, si ha pagado la matrícula y el nombre del profesor.

4- Muestre la información contenida en la vista.

5- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada deporte ordenados por cantidad.

6- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscriptos.

7- Muestre los nombres de los socios que no se han inscripto en ningún curso (consultando la vista)

8- Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún.

9- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.

10- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para dictar sus clases.

11- Muestre la misma información anterior pero ordenada por día.

12- Muestre todos los socios que son compañeros en tenis los lunes.*/

--1
drop table if exists socios;

create table socios(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	primary key (documento)
);

drop table if exists profesores;

create table profesores(
	documento char(8) not null,
	nombre varchar(40),
	domicilio varchar(30),
	primary key (documento)
);

drop table if exists cursos;

create table cursos(
	numero serial,
	deporte varchar(20),
	dia varchar(15),
	documentoprofesor char(8),
	primary key (numero)
);

drop table if exists inscriptos;

create table inscriptos(
	documentosocio char(8) not null,
	numero smallint not null,
	matricula char(1),
	primary key (documentosocio,numero)
);

--2
insert into socios values ('30000000','Fabian Fuentes','Caseros 987');
insert into socios values ('31111111','Gaston Garcia','Guemes 65');
insert into socios values ('32222222','Hector Huerta','Sucre 534');
insert into socios values ('33333333','Ines Irala','Bulnes 345');

insert into profesores values ('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values ('23333333','Carlos Caseres','Colon 245');
insert into profesores values ('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values ('25555555','Esteban Lopez','Sucre 1204');

insert into cursos(deporte,dia,documentoprofesor) values ('tenis','lunes','22222222');
insert into cursos(deporte,dia,documentoprofesor) values ('tenis','martes','22222222');
insert into cursos(deporte,dia,documentoprofesor) values ('natacion','miercoles','22222222');
insert into cursos(deporte,dia,documentoprofesor) values ('natacion','jueves','23333333');
insert into cursos(deporte,dia,documentoprofesor) values ('natacion','viernes','23333333');
insert into cursos(deporte,dia,documentoprofesor) values ('futbol','sabado','24444444');
insert into cursos(deporte,dia,documentoprofesor) values ('futbol','lunes','24444444');
insert into cursos(deporte,dia,documentoprofesor) values ('basquet','martes','24444444');

insert into inscriptos values ('30000000',1,'s');
insert into inscriptos values ('30000000',3,'n');
insert into inscriptos values ('30000000',6,null);
insert into inscriptos values ('31111111',1,'s');
insert into inscriptos values ('31111111',4,'s');
insert into inscriptos values ('32222222',8,'s');

--3
create view vista_inscripciones as
select s.nombre as nombre_socio, s.documento as documento_socio, c.deporte, c.dia, i.matricula, p.nombre as nombre_profesor
from inscriptos as i full join socios as s on (i.documentosocio = s.documento)
                     full join cursos as c on (i.numero = c.numero)
					 full join profesores as p on (c.documentoprofesor = p.documento);
					 
--4
select * from vista_inscripciones;

--5
select deporte, dia, count(documento_socio) as "#inscriptos"
from vista_inscripciones
where deporte is not null
  and dia is not null
group by deporte, dia
order by 3;

--6
select deporte, dia
from vista_inscripciones
where deporte is not null
  and documento_socio is null;

--7
select nombre_socio
from vista_inscripciones
where nombre_socio is not null
  and deporte is null;

--8
select nombre_profesor
from vista_inscripciones
where nombre_profesor is not null
  and deporte is null;
  
--9
select nombre_socio, documento_socio
from vista_inscripciones
where matricula like 'n';

--10
select distinct nombre_profesor, dia
from vista_inscripciones
where nombre_profesor is not null
  and deporte is not null;
  
--11
select distinct nombre_profesor, dia
from vista_inscripciones
where nombre_profesor is not null
  and deporte is not null
order by dia;

--12
select nombre_socio
from vista_inscripciones
where deporte like 'tenis'
  and dia like 'lunes';
  
-----------------------------------------------------------------------------------------------------------------------------------------------
/*SECUENCIAS(CREATE SEQUENCE - ALTER SEQUENCE - NEXTVAL - DROP SEQUENCE)*/
-----------------------------------------------------------------------------------------------------------------------------------------------
/*Primer problema:
Una empresa registra los datos de sus empleados en una tabla llamada "empleados".

1 - Cree la secuencia "sec_legajoempleados" estableciendo el valor mínimo (1), máximo (999),valor inicial (100), valor de incremento (2) y no 
circular.

2- Cree la tabla:
create table empleados(
legajo bigint default nextval('sec_legajoempleados'),
documento char(8) not null,
nombre varchar(30) not null,
primary key(legajo)
);

3 - Ingrese algunos registros:
insert into empleados(documento,nombre)
values ('22333444','Ana Acosta');
insert into empleados(documento,nombre)
values ('23444555','Betina Bustamante');
insert into empleados(documento,nombre)
values ('24555666','Carlos Caseros');
insert into empleados(documento,nombre)
values ('25666777','Diana Dominguez');
insert into empleados(documento,nombre)
values ('26777888','Estela Esper');

4 - Recupere los registros de la tabla empleados.

5 - Efectue un select de la secuencia.

6 - Elimine la secuencia y la tabla asociada a dicha secuencia.*/

--1
create sequence sec_legajoempleados
start with 100
increment by 2
minvalue 1
maxvalue 999;

--2
create table empleados(
	legajo bigint default nextval('sec_legajoempleados'),
	documento char(8) not null,
	nombre varchar(30) not null,
	primary key(legajo)
);

--3
insert into empleados(documento,nombre) values ('22333444','Ana Acosta');
insert into empleados(documento,nombre) values ('23444555','Betina Bustamante');
insert into empleados(documento,nombre) values ('24555666','Carlos Caseros');
insert into empleados(documento,nombre) values ('25666777','Diana Dominguez');
insert into empleados(documento,nombre) values ('26777888','Estela Esper');

--4
select * from empleados;

--5
select * from sec_legajoempleados;

--6
drop table empleados;
drop sequence sec_legajoempleados;

/*Segundo problema:
Una empresa organiza un curso de computación (dispone de dos aulas), almacenar en una tabla inscriptos los datos del estudiante. Cada vez 
que se inscribe un alumno asignarlo a un aula en forma alternada (primero a la 1 y luego a la 2, luego nuevamente a la 1 y así sucesivamente).

1 - Crear una secuencia sec_codigoaulainscriptos (valor inicial 1, incremento 1, valor máximo 2 y debe ser circular)

2 - Crear la tabla inscriptos:
create table inscriptos(
documento char(8) not null,
nombre varchar(30) not null,
codigocurso int default nextval('sec_codigoaulainscriptos'),
primary key(documento)
);

3 - Insertar algunos registros:
insert into inscriptos(documento,nombre) values ('20000000','Rodriguez Pablo');
insert into inscriptos(documento,nombre) values ('30000000','Mercado Ana');
insert into inscriptos(documento,nombre) values ('40000000','Morello Luis');
insert into inscriptos(documento,nombre) values ('50000000','Prado Juan');
insert into inscriptos(documento,nombre) values ('60000000','Solis Maria');

4 - Imprimir todos los alumnos del curso 1.

5 - Imprimir todos los alumnos del curso 2.*/

--1
create sequence sec_codigoaulainscriptos
start with 1
increment by 1
maxvalue 2
cycle;

--2
drop table if exists inscriptos;

create table inscriptos(
	documento char(8) not null,
	nombre varchar(30) not null,
	codigocurso int default nextval('sec_codigoaulainscriptos'),
	primary key(documento)
);

--3
insert into inscriptos(documento,nombre) values ('20000000','Rodriguez Pablo');
insert into inscriptos(documento,nombre) values ('30000000','Mercado Ana');
insert into inscriptos(documento,nombre) values ('40000000','Morello Luis');
insert into inscriptos(documento,nombre) values ('50000000','Prado Juan');
insert into inscriptos(documento,nombre) values ('60000000','Solis Maria');

--4
select documento, nombre
from inscriptos
where codigocurso = 1;

--5
select documento, nombre
from inscriptos
where codigocurso = 2;

-----------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES SQL*/
-----------------------------------------------------------------------------------------------------------------------------------------------
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

3- Implementar una función que retorne el precio promedio de la tabla medicamentos.

4- Imprimir el precio promedio de los medicamentos.

5- Imprimir los medicamentos que tienen un precio mayor al promedio.*/

--1
drop table if exists medicamentos;

create table medicamentos(
	codigo serial,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad smallint,
	primary key(codigo)
);

--2
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Bayaspirina','Bayer',2.10,150);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal jarabe','Bayer',5.10,250);

--3
create or replace function preciopromedio() returns decimal
as
  'select avg(precio) from medicamentos;'
language sql;

--4
select preciopromedio();

--5
select nombre
from medicamentos
where precio > preciopromedio();

-----------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES SQL QUE NO RETORNA DATO(VOID)*/
-----------------------------------------------------------------------------------------------------------------------------------------------
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

3- Implementar una función que reciba el código de un medicamento y proceda a borrarlo. La función no retorna dato.

4- Proceder a llamar a la función.

5- Imprimir la tabla medicamentos.*/

--1
drop table if exists medicamentos;

create table medicamentos(
	codigo serial,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad smallint,
	primary key(codigo)
);

--2
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Bayaspirina','Bayer',2.10,150);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal jarabe','Bayer',5.10,250);

--3
create or replace function borrarmedicamento(int) returns void
as $$
   delete from medicamentos
   where codigo = $1;
   $$
language sql;

--4
select borrarmedicamento(2);

--5
select * from medicamentos;

-----------------------------------------------------------------------------------------------------------------------------------------------
/*FUNCIÓN SQL QUE RETORNA UN DATO COMPUESTO*/
-----------------------------------------------------------------------------------------------------------------------------------------------
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

3- Implementar una función que retorne el registro completo del medicamento más caro.

4- Proceder a llamar a la función.*/

--1
drop table if exists medicamentos;

create table medicamentos(
	codigo serial,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad smallint,
	primary key(codigo)
);

--2
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Sertal','Roche',5.2,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Paracetamol 500','Bago',1.90,200);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Bayaspirina','Bayer',2.10,150);
insert into medicamentos (nombre,laboratorio,precio,cantidad) values ('Amoxidal jarabe','Bayer',5.10,250);

--3
create or replace function getmascaro() returns medicamentos
as $$
   select m1.*
   from medicamentos as m1
   where m1.precio = (select max(m2.precio)
					  from medicamentos as m2);
   $$
language sql;

--4
select getmascaro();