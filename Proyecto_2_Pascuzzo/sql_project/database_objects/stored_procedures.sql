USE AUTOBATTLER;

DROP PROCEDURE IF EXISTS sp_rango_user;
DELIMITER //

CREATE PROCEDURE sp_rango_user(IN p_id_user INT, 
                                OUT p_nick VARCHAR(100), 
                                OUT p_nombre_rango VARCHAR(50))
BEGIN
    DECLARE puntos_clasif INT;

    -- Obtener el nick y puntos de clasificación del usuario
    SELECT `NICK`, `PUNTOS_CLASIF` INTO p_nick, puntos_clasif
    FROM `USUARIO`
    WHERE `ID_USER` = p_id_user;

    -- Manejo del caso donde el ID_USER no existe en la base de datos
    IF p_nick IS NULL THEN
        SET p_nombre_rango = 'USUARIO NO ENCONTRADO';
    ELSE
        -- Determinar el rango basado en los puntos de clasificación
        IF puntos_clasif BETWEEN 0 AND 9 THEN
            SET p_nombre_rango = 'BRONCE';
        ELSEIF puntos_clasif BETWEEN 10 AND 29 THEN
            SET p_nombre_rango = 'PLATA';
        ELSEIF puntos_clasif BETWEEN 30 AND 59 THEN
            SET p_nombre_rango = 'ORO';
        ELSEIF puntos_clasif BETWEEN 60 AND 89 THEN
            SET p_nombre_rango = 'DIAMANTE';
        ELSEIF puntos_clasif >= 90 THEN
            SET p_nombre_rango = 'PLATINO';
        END IF;
    END IF;

END //

DELIMITER ;

-- Declarar variables para almacenar los resultados
SET @nick_out = '';
SET @p_nombre_rango = '6';

-- Llamar al procedimiento almacenado con un ID de usuario específico
CALL sp_rango_user(1, @nick_out, @p_nombre_rango);

-- Mostrar los resultados
SELECT @nick_out AS Nick, 
       @p_nombre_rango AS Nombre_Rango;

