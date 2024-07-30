USE AUTOBATTLER;

-- Trigger para almacenar registros modificados si la reserva se cancela:

CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,   tabla_afectada  VARCHAR (50)
    ,   accion          VARCHAR(50)
    ,   fecha           DATETIME
    ,   ID_REG          INT
    ,   usuario         VARCHAR(50)
    );



DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT ON REGISTRO_DE_PARTIDA
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha,ID_REG,usuario)
    VALUES ('REGISTRO_DE_PARTIDA', 'INSERT', NOW() , NEW.ID_REG,USER());
END //

DELIMITER ;




CREATE TABLE triggers_db.club_estanciero_members_replica
LIKE triggers_db.club_estanciero_members ;

DROP TRIGGER IF EXISTS after_insert_estanciero_replica;
DROP TRIGGER IF EXISTS after_update_estanciero_replica;
DROP TRIGGER IF EXISTS before_delete_estanciero_replica;