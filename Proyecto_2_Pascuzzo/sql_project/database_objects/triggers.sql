USE AUTOBATTLER;

-- Trigger para almacenar registros modificados si la reserva se cancela:


CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    );

