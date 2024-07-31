USE AUTOBATTLER;

-- ELIMINA SI EXISTE Y CREA LA TABLA LOG_CAMBIOS, DONDE SE GUARDARAN LOS DATOS DE LAS MODIFICACIONES.
DROP TABLE IF EXISTS LOG_CAMBIOS;
CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,   tabla_afectada  VARCHAR (50)
    ,   accion          VARCHAR(50)
    ,   fecha           DATETIME
    ,   ID_USER         INT
    ,	NICK			VARCHAR(50)
    ,	PASSWORD		VARCHAR(50)
    ,   usuario         VARCHAR(50)
    );

-- Elimina si existe el trigger after_insert_trigger
DROP TRIGGER IF EXISTS after_insert_trigger;
DELIMITER //
-- Crea el trigger que guarda informacion cuando se inserta un dato en la tabla usuario
CREATE TRIGGER after_insert_trigger
AFTER INSERT ON USUARIO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, ID_USER, NICK, PASSWORD, usuario)
    VALUES ('USUARIO', 'INSERT', NOW() , NEW.ID_USER, NEW.NICK, NEW.PASSWORD, USER());
END //

DELIMITER ;

-- Borra si existe el trigger before_delete_trigger
DROP TRIGGER IF EXISTS before_delete_trigger;
DELIMITER //
-- crea una copia del dato borrado en la tabala log_cambios
CREATE TRIGGER before_delete_trigger
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, ID_USER, NICK, PASSWORD, usuario)
    VALUES ('USUARIO', 'DELETE', NOW() , OLD.ID_USER, OLD.NICK, OLD.PASSWORD, USER());
END //

DELIMITER ;



