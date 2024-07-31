USE AUTOBATTLER;

DROP PROCEDURE IF EXISTS sp_rango_user;

DELIMITER //

CREATE PROCEDURE sp_rango_user(IN p_id_user INT, OUT p_nick VARCHAR(100), OUT p_nombre_rango VARCHAR(50))
BEGIN
    DECLARE puntaje INT;

    SELECT u.NICK, u.PUNTOS_CLASIF INTO p_nick, puntaje
    FROM USUARIO AS u
    WHERE u.ID_USER = p_id_user;

    -- Si el ID_USER no existe en la base de datos
    IF p_nick IS NULL THEN
        SET p_nombre_rango = 'USUARIO NO ENCONTRADO';
    ELSE
        -- Determino los rangos segun los puntos
        IF puntaje BETWEEN 0 AND 9 THEN
            SET p_nombre_rango = 'BRONCE';
        ELSEIF puntaje BETWEEN 10 AND 29 THEN
            SET p_nombre_rango = 'PLATA';
        ELSEIF puntaje BETWEEN 30 AND 59 THEN
            SET p_nombre_rango = 'ORO';
        ELSEIF puntaje BETWEEN 60 AND 89 THEN
            SET p_nombre_rango = 'DIAMANTE';
        ELSEIF puntaje >= 90 THEN
            SET p_nombre_rango = 'PLATINO';
        END IF;
    END IF;

END //

DELIMITER ;



