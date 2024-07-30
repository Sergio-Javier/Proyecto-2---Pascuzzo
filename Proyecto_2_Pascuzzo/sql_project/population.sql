USE AUTOBATTLER;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;


-- CARGA DATOS DE LA TABLA ESTADISTICA, 50 ROWS
-- INGRESAR DATOS POR MEDIO DE COMANDO INSERT INTO
INSERT INTO ESTADISTICAS (POSICION, NIVEL_ALCANZADO, UNIDADES_COMPRADAS) VALUES
	(1, 9, '1,2,3,4,5,6,7,8,9'),
	(2, 8, '10,11,12,13,14,15,16,17'),
	(3, 7, '18,19,20,21,22,23,24'),
	(4, 6, '1,3,5,7,9,11'),
	(5, 5, '2,4,6,8,10'),
	(6, 4, '12,14,16,18'),
	(7, 3, '20,22,24'),
	(8, 2, '13,15'),
	(1, 9, '2,4,6,8,10,12,14,16,18'),
	(2, 8, '1,3,5,7,9,11,13,15'),
	(1, 9, '1,2,3,4,5,6,7,8,9'),
	(2, 8, '10,11,12,13,14,15,16,17'),
	(3, 7, '18,19,20,21,22,23,24'),
	(4, 6, '1,3,5,7,9,11'),
	(5, 5, '2,4,6,8,10'),
	(6, 4, '12,14,16,18'),
	(7, 3, '20,22,24'),
	(8, 2, '13,15'),
	(1, 9, '2,4,6,8,10,12,14,16,18'),
	(2, 8, '1,3,5,7,9,11,13,15'),
	(1, 9, '1,2,3,4,5,6,7,8,9'),
	(2, 8, '10,11,12,13,14,15,16,17'),
	(3, 7, '18,19,20,21,22,23,24'),
	(4, 6, '1,3,5,7,9,11'),
	(5, 5, '2,4,6,8,10'),
	(6, 4, '12,14,16,18'),
	(7, 3, '20,22,24'),
	(8, 2, '13,15'),
	(1, 9, '2,4,6,8,10,12,14,16,18'),
	(2, 8, '1,3,5,7,9,11,13,15'),
	(1, 9, '1,2,3,4,5,6,7,8,9'),
	(2, 8, '10,11,12,13,14,15,16,17'),
	(3, 7, '18,19,20,21,22,23,24'),
	(4, 6, '1,3,5,7,9,11'),
	(5, 5, '2,4,6,8,10'),
	(6, 4, '12,14,16,18'),
	(7, 3, '20,22,24'),
	(8, 2, '13,15'),
	(1, 9, '2,4,6,8,10,12,14,16,18'),
	(2, 8, '1,3,5,7,9,11,13,15'),
	(1, 9, '1,2,3,4,5,6,7,8,9'),
	(2, 8, '10,11,12,13,14,15,16,17'),
	(3, 7, '18,19,20,21,22,23,24'),
	(4, 6, '1,3,5,7,9,11'),
	(5, 5, '2,4,6,8,10'),
	(6, 4, '12,14,16,18'),
	(7, 3, '20,22,24'),
	(8, 2, '13,15'),
	(1, 9, '2,4,6,8,10,12,14,16,18'),
	(2, 8, '1,3,5,7,9,11,13,15');


-- CARGA DATOS DE LA TABLA MODO, 3 ROWS
-- INGRESAR DATOS POR MEDIO DE COMANDO INSERT INTO

INSERT INTO MODO_DE_JUEGO (TIPO_MODO, GANA_NIVEL_EXP, GANA_PUNTOS_CLASIF) VALUES
	('NORMAL', 50, 0),
	('CLASIFICATORIA', 100, 20),
	('PRACTICA VS IA', 10, 0);

-- CARGA DATOS DE LA TABLA MISIONES, 12 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/MISIONES_DATA.csv'
INTO TABLE MISIONES
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(TIPO_DE_MISION,TITULO,DESCRIPCION,RECOMPENSA);

-- CARGA DATOS DE LA TABLA UNIDAD, 25 ROWS
-- INGRESAR DATOS POR MEDIO DE COMANDO INSERT INTO

INSERT INTO UNIDAD (NOMBRE, COSTO, RASGO_SECUNDARIO, RASGO_PRINCIPAL, DANIO, DEFENSA, VIDA) VALUES
	('Guerrero', '2', 'Melee', 'Fuerza', 30, 20, 100),
	('Arquero', '1', 'Rango', 'Agilidad', 20, 10, 80),
	('Mago', '3', 'Rango', 'Inteligencia', 40, 10, 70),
	('Tanque', '4', 'Melee', 'Defensa', 25, 30, 150),
	('Asesino', '3', 'Melee', 'Velocidad', 50, 15, 60),
	('Clerigo', '2', 'Rango', 'Curacion', 15, 20, 90),
	('Paladin', '4', 'Melee', 'Proteccion', 35, 25, 130),
	('Nigromante', '3', 'Rango', 'Oscuridad', 45, 10, 70),
	('Explorador', '1', 'Rango', 'Percepcion', 20, 15, 75),
	('Barbaro', '2', 'Melee', 'Fuerza', 35, 20, 110),
	('Druida', '2', 'Rango', 'Naturaleza', 25, 20, 85),
	('Hechicero', '3', 'Rango', 'Magia', 50, 10, 65),
	('Caballero', '4', 'Melee', 'Honor', 30, 25, 140),
	('Cazador', '1', 'Rango', 'Sigilo', 18, 12, 70),
	('Monje', '2', 'Melee', 'Disciplina', 28, 22, 95),
	('Chaman', '3', 'Rango', 'Espiritualidad', 38, 12, 75),
	('Espadachin', '2', 'Melee', 'Destreza', 32, 18, 105),
	('Alquimista', '3', 'Rango', 'Transmutacion', 45, 10, 65),
	('Vikingo', '4', 'Melee', 'Valentia', 40, 25, 120),
	('Samurai', '4', 'Melee', 'Honor', 42, 23, 115),
	('Picaro', '1', 'Melee', 'Sigilo', 22, 12, 65),
	('Berserker', '3', 'Melee', 'Furia', 50, 18, 90),
	('Sacerdote', '2', 'Rango', 'Luz', 20, 20, 85),
	('Ladron', '1', 'Melee', 'Velocidad', 25, 10, 70),
	('Elementalista', '3', 'Rango', 'Elementos', 48, 10, 75);


    -- CARGA DATOS DE LA TABLA PARTIDA, 12 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/PARTIDA_DATA.csv'
INTO TABLE PARTIDA
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(TIEMPO_DE_PARTIDA,ID_ESTADISTICA,ID_MODO,ID_MISION);


    -- CARGA DATOS DE LA TABLA USUARIO, 25 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/USUARIO_DATA.csv'
INTO TABLE USUARIO
FIELDS TERMINATED BY ','	ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,APELLIDO,FECHA_NACIMIENTO,CORREO,PASSWORD,NICK,NIVEL_USER,PUNTOS_CLASIF,CONECTADO);


    -- CARGA DATOS DE LA TABLA AMIGOS, 50 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/AMIGOS_DATA.csv'
INTO TABLE AMIGOS
FIELDS TERMINATED BY ','  ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(ID_AMIGO,ID_USER,NICK_AMIGO,AMIGO_CONECTADO);


    -- CARGA DATOS DE LA TABLA CONFIGURACION, 25 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/CONFIG_DATA.csv'
INTO TABLE CONFIGURACION
FIELDS TERMINATED BY ','  ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE_CONFIG, CONFIG_VIDEO, CONFIG_SONIDO, CONFIG_JUEGO,ID_USER);


    -- CARGA DATOS DE LA TABLA PRODUCTO, 11 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/PRODUCTOS_DATA.csv'
INTO TABLE PRODUCTO
FIELDS TERMINATED BY ','  ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(TIPO_PRODUCTO,VALOR);


    -- CARGA DATOS DE LA TABLA FACTURA, 50 ROWS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/FACTURA_DATA.csv'
INTO TABLE FACTURA
FIELDS TERMINATED BY ','  ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(FECHA_DE_COMPRA,ID_PRODUCTO,CANTIDAD_PRODUCTO,ID_USER,EMAIL,NICK,TOTAL_PAGAR,MEDIO_DE_PAGO,COMPLETADO);



   -- CARGA DATOS DE LA TABLA REGISTRO DE PARTIDAS, 50 ROWS
LOAD DATA  LOCAL INFILE '/sql_project/data_csv/REG_PARTIDA_DATA.csv'
INTO TABLE REGISTRO_DE_PARTIDA
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(FECHA_HORA,ID_SALA,ID_USER);
