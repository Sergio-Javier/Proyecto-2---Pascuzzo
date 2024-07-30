USE AUTOBATTLER;

-- BORRA LAS FUNCIONES SI ES QUE YA EXISTEN
DROP FUNCTION IF EXISTS fn_nombre_unidades;
-- PRIMERA FUNCION: UTILIZADA, PARA CONVERTIR LA LISTA EN CADENA SEPARADA POR COMAR DE LAS UNIDADES COMPRADAS
-- PARA TOMAR ESE NUMERO, QUE ES DEL TIPO VARCHAR, Y CONCATENARLO CON EL ID DE LA UNIDAD, DE LA TABLA UNIDAD.
CREATE FUNCTION fn_nombre_unidades(unidades_compradas VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE nombre_unidades VARCHAR(255) DEFAULT '';
    DECLARE unidad_id INT;
    DECLARE pos INT DEFAULT 1;
    DECLARE coma_pos INT;

    -- Recorre cada número separado por coma en la cadena `unidades_compradas`
    WHILE LENGTH(unidades_compradas) > 0 DO
        -- Encuentra la posición de la primera coma
        SET coma_pos = LOCATE(',', unidades_compradas);

        -- Si hay una coma, extrae la subcadena hasta la coma, de lo contrario toma el resto de la cadena
        IF coma_pos > 0 THEN
            SET unidad_id = CAST(SUBSTRING(unidades_compradas, 1, coma_pos - 1) AS UNSIGNED);
            SET unidades_compradas = SUBSTRING(unidades_compradas, coma_pos + 1);
        ELSE
            SET unidad_id = CAST(unidades_compradas AS UNSIGNED);
            SET unidades_compradas = '';
        END IF;

        -- Obtén el nombre de la unidad correspondiente
        SET nombre_unidades = CONCAT(nombre_unidades, (SELECT NOMBRE FROM UNIDAD WHERE ID_UNIDAD = unidad_id), ', ');
    END WHILE;

    -- Elimina la última coma y espacio
    IF LENGTH(nombre_unidades) > 0 THEN
        SET nombre_unidades = LEFT(nombre_unidades, LENGTH(nombre_unidades) - 2);
    END IF;

    RETURN nombre_unidades;
END //

DELIMITER ;
