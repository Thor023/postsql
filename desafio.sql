CREATE DATABASE Posts;--Creada base de datos
--Creacion de tabla
CREATE TABLE posts ( 
    id serial,
    nombre_de_usuario varchar(25),
    fecha_de_creacion date, 
    contenido VARCHAR(255), 
    descripcion Varchar(255),
    primary key(id)
);

--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion) values('Pamela','2022-01-01','Primer post de Pamela','Este es el primer post de pamela');
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion) values('Pamela','2022-01-02','Segundo post de Pamela','Este es el segundo post de pamela');
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion) values('Carlos','2022-01-03','Primer post de Carlos','Este es el primer post de Carlos');

--Modificar la tabla post, agregando la columna título
ALTER TABLE posts ADD Titulo varchar(25);

-- Agregar título a las publicaciones ya ingresadas.
UPDATE posts SET Titulo = 'TituloPostPamela' WHERE nombre_de_usuario='Pamela';
UPDATE posts SET Titulo = 'TituloPostCarlos' WHERE nombre_de_usuario='Carlos';

-- Insertar 2 post para el usuario "Pedro"
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion,titulo) values('Pedro','2022-01-01','Primer post de Pedro','Este es el primer post de Pedro','TituloPostPedro');
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion, titulo) values('Pedro','2022-01-02','Segundo post de Pedro','Este es el segundo post de Pedro','TituloPostPedro');

-- Eliminar el post de Carlos.
DELETE FROM posts WHERE nombre_de_usuario = 'Carlos';

-- Ingresar un nuevo post para el usuario "Carlos".
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion, titulo) values('Carlos','2022-01-05','Segundo post de Carlos','Este es el Segundo post de Carlos', 'TituloPostCarlos');

--PARTE 2 

-- Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts.(Para relacionarlos cree la columna "post_id").

CREATE TABLE comentarios ( 
    comentario_id Serial,
    post_id INT,
    fecha DATE, 
    hora_de_creacion TIME,
    contenido VARCHAR(255),
    primary key (comentario_id),
    foreign key (post_id) REFERENCES posts(id)
);

--  Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". 

Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(1, '2022-01-01','00:00:00','Primer comentario de post 1 de Pamela');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(1, '2022-01-01','00:30:00','Segundo comentario de post 1 de Pamela');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(6, '2022-01-02','03:20:12','Primer comentario de post de Carlos');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(6, '2022-01-02','03:30:12','Segundo comentario de post de Carlos');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(6, '2022-01-02','03:46:00','Tercero comentario de post de Carlos');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(6, '2022-01-02','08:20:12','Cuarto comentario de post de Carlos');

-- Crear un nuevo post para "Margarita". 
Insert into posts (nombre_de_usuario, fecha_de_creacion,contenido,descripcion, titulo) values('Margarita','2022-01-02','Primer post de Margarita','Este es el primer post de Margarita','TituloMargarita');

-- Ingresar 5 comentarios para el post de Margarita. 
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(7, '2022-01-12','12:20:12','Primer comentario de post de Margarita');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(7, '2022-01-15','11:20:12','Segundo comentario de post de Margarita');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(7, '2022-01-23','15:20:12','Tercero comentario de post de Margarita');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(7, '2022-01-24','012:20:12','Cuarto comentario de post de Margarita');
Insert into comentarios (post_id, fecha, hora_de_creacion, contenido) values(7, '2022-01-31','08:30:12','Quinto comentario de post de Margarita');