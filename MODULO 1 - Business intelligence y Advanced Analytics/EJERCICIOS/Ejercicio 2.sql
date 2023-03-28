drop table if exists libros, editoriales;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30) not null default 'Desconocido',
  codigoeditorial tinyint unsigned not null,
  precio decimal(5,2) unsigned,
  cantidad tinyint unsigned default 0,
  primary key (codigo)
 );

 create table editoriales(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20) not null,
  primary key(codigo)
 );


 insert into editoriales (nombre) values('Paidos');
 insert into editoriales (nombre) values('Emece');
 insert into editoriales (nombre) values('Planeta');
 insert into editoriales (nombre) values('Sudamericana');


 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('El Aleph','Borges',3,43.5,200);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll',2,33.5,100);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Aprenda PHP','Mario Perez',1,55.8,50);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Java en 10 minutos','Juan Lopez',1,88,150);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Alicia a traves del espejo','Lewis Carroll',1,15.5,80);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Cervantes y el quijote','Borges- Bioy Casares',3,25.5,250);
 insert into libros (titulo, autor,codigoeditorial,precio,cantidad)
  values('Aprenda Java en 10 minutos','Lopez Juan',5,28,100);
  
 select * from editoriales
  left join libros
  on editoriales.codigo=libros.codigoeditorial;
  
select * from libros
  left join editoriales
  on editoriales.codigo=libros.codigoeditorial;
  
select nombre,titulo
  from editoriales as e
  left join libros as l
  on e.codigo=l.codigoeditorial
  where l.codigoeditorial is not null;