CREATE SCHEMA IF NOT EXISTS mydish;


USE mydish;


DROP TABLE IF EXISTS usuarios;


CREATE TABLE usuarios
(N_ID INT AUTO_INCREMENT ,
NOMBRE VARCHAR(40) NOT NULL,
APELLIDO VARCHAR(60) NOT NULL, 
DIRECCION VARCHAR(200) NOT NULL,
EMAIL VARCHAR(100) NOT NULL, 
PASSWORD1 VARCHAR(100) NOT NULL, 
FECHA_REG DATE,
UNIQUE KEY unique_email (EMAIL),
PRIMARY KEY(N_ID)
)ENGINE=INNODB;


INSERT INTO usuarios VALUES( null, 'admin', 'admin', 'Torrente 1', 'admin@admin.com', '123', '2019-04-16');
INSERT INTO usuarios VALUES( null, 'Jaky', 'Jane', 'Torrent 1', 'jaky@Jane.com', '123', '2017-02-16');
INSERT INTO usuarios VALUES( null, 'Jofre', 'Roca', 'cala morell 2', 'alfred@roca.com','1234', '2018-07-26');
INSERT INTO usuarios VALUES( null, 'Luisa', 'Losa', 'Can xinxa 12', 'luisa@luisa.com', '12345', '2018-11-10');


DROP TABLE IF EXISTS platos;
CREATE TABLE platos (
N_ID_PLATO INT AUTO_INCREMENT ,
NOMBRE_PLATO VARCHAR(100) NOT NULL,
FOTO_PLATO VARCHAR(100) NOT NULL,
DESCRIPCION_PLATO TEXT NOT NULL, 
PRECIO_PLATO FLOAT NOT NULL,
FECHA_REG_PLATO DATE,
UNIQUE KEY unique_foto_plato (FOTO_PLATO),
PRIMARY KEY(N_ID_PLATO)
)ENGINE=INNODB;


INSERT INTO platos VALUES( null, 'patatas al ajillo', 'patatas_al_ajillo.jpeg',  'las mejores patatas de la zona', '4.5', '2019-04-16');
INSERT INTO platos VALUES( null, 'lentejas', 'lentejas.jpeg',  'las mejores lentejas de la zona', '5.5', '2019-04-10');
INSERT INTO platos VALUES( null, 'lubina al horno', 'lubina_al_horno.jpeg',  'las mejores judias de la zona', '6', '2019-02-16');
INSERT INTO platos VALUES( null, 'paella', 'paella_de_marisco.jpeg',  'la mejor paella de la zona', '7.5', '2019-01-01');
INSERT INTO platos VALUES( null, 'guisantes con jamón', 'guisantes_con_jamon.jpeg',  'los mejores guisantes de la zona', '3.5', '2019-04-20');
INSERT INTO platos VALUES( null, 'fideua', 'fideua.jpeg',  'la mejor fideua de la zona', '6.25', '2018-12-16');
INSERT INTO platos VALUES( null, 'cayos', 'callos.jpeg',  'los mejores cayos de la zona', '6.5', '2019-01-21');


CREATE TABLE IF NOT EXISTS pedidos (
N_ID_PEDIDO INT AUTO_INCREMENT ,
ID_CLIENTE_PEDIDO INT(255) NOT NULL,
FECHA_REG_PEDIDO DATE NOT NULL,
FECHA_CIERRE_PEDIDO DATE NOT NULL,
FINALIZADO_PEDIDO BOOLEAN DEFAULT false,
PRIMARY KEY(N_ID_PEDIDO),
CONSTRAINT FK_PedidosUsuarios FOREIGN KEY(ID_CLIENTE_PEDIDO) REFERENCES usuarios(N_ID) ON DELETE CASCADE
)ENGINE=INNODB;


INSERT INTO pedidos VALUES( null, 1, '2019-04-10',  '2019-04-10', true);
INSERT INTO pedidos VALUES( null, 1, '2019-04-11',  '2019-04-11', true);
INSERT INTO pedidos VALUES( null, 2, '2019-04-10',  '2019-04-10', true);
INSERT INTO pedidos VALUES( null, 3, '2019-04-16',  '2019-04-16', false);


CREATE TABLE IF NOT EXISTS linea_pedidos (
N_ID_PEDIDO_LINEA_PEDIDO INT NOT NULL,
N_ID_PLATO_LINEA_PEDIDO INT NOT NULL,
UNIDADES_LINEA_PEDIDO INT(255),
PRECIO_UNIT_LINEA_PEDIDO FLOAT,
TOTAL_LINEA_PEDIDO FLOAT,
PRIMARY KEY(N_ID_PEDIDO_LINEA_PEDIDO, N_ID_PLATO_LINEA_PEDIDO),
CONSTRAINT FK_linea_pedidos_pedidos FOREIGN KEY(N_ID_PEDIDO_LINEA_PEDIDO) REFERENCES pedidos(N_ID_PEDIDO) ON DELETE CASCADE, 
CONSTRAINT FK_linea_pedidos_platos FOREIGN KEY(N_ID_PLATO_LINEA_PEDIDO) REFERENCES platos(N_ID_PLATO) ON DELETE CASCADE
)ENGINE=INNODB;


INSERT INTO linea_pedidos VALUES( 1, 1, 1,  4.5, 4.5);
INSERT INTO linea_pedidos VALUES( 1, 2, 1,  5.5, 5.5);
INSERT INTO linea_pedidos VALUES( 1, 3, 2,  6, 12);
INSERT INTO linea_pedidos VALUES( 2, 2, 1,  5.5, 5.5);
