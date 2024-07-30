USE AUTOBATTLER;
-- Crea un registro cuando se ingrese un nuevo usuario
DROP TABLE IF EXISTS LOG_CAMBIOS;
DROP TRIGGER IF EXISTS after_insert_trigger;

CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,   tabla_afectada  VARCHAR (50)
    ,   accion          VARCHAR(50)
    ,   fecha           DATETIME
    ,   ID_USER         INT
    ,   usuario         VARCHAR(50)
    );



DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT ON USUARIO
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha,idcliente,usuario)
    VALUES ('USUARIO', 'INSERT', NOW() , NEW.ID_USER,USER());
END //

DELIMITER ;



