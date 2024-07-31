USE AUTOBATTLER;

DROP PROCEDURE IF EXISTS sp_rango_user;
DELIMITER //

CREATE PROCEDURE sp_rango_user(IN p_id_user INT, OUT p_nick VARCHAR(100), OUT p_nombre_rango VARCHAR(50))
BEGIN
    DECLARE puntos_clasif INT;

    SELECT `NICK`, `PUNTOS_CLASIF` INTO p_nick, puntos_clasif
    FROM `USUARIO`
    WHERE `ID_USER` = p_id_user;

    -- Si el ID_USER no existe en la base de datos
    IF p_nick IS NULL THEN
        SET p_nombre_rango = 'USUARIO NO ENCONTRADO';
    ELSE
        -- Determino los rangos segun los puntos
        IF puntos_clasif BETWEEN 0 AND 9 THEN
            SET p_nombre_rango = 'BRONCE';
        ELSEIF puntos_clasif BETWEEN '10' AND '29' THEN
            SET p_nombre_rango = 'PLATA';
        ELSEIF puntos_clasif BETWEEN '30' AND '59' THEN
            SET p_nombre_rango = 'ORO';
        ELSEIF puntos_clasif BETWEEN '60' AND '89' THEN
            SET p_nombre_rango = 'DIAMANTE';
        ELSEIF puntos_clasif >= 90 THEN
            SET p_nombre_rango = 'PLATINO';
        END IF;
    END IF;

END //

DELIMITER ;

-- ejemplo, me tiene que dar vodnikjavier bronce
CALL sp_rango_user(3, @p_nick, @p_nombre_rango);
SELECT @p_nick AS Nick, 
       @p_nombre_rango AS Nombre_Rango;


