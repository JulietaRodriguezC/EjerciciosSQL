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