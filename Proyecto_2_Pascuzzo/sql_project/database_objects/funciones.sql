USE AUTOBATTLER;

-- BORRA LAS FUNCIONES SI ES QUE YA EXISTEN
DROP FUNCTION IF EXISTS fn_nombre_unidades;
DROP FUNCTION IF EXISTS fn_convertir;

-- PRIMERA FUNCION: UTILIZADA, PARA CONVERTIR LA LISTA EN CADENA SEPARADA POR COMAR DE LAS UNIDADES COMPRADAS
-- PARA TOMAR ESE NUMERO, QUE ES DEL TIPO VARCHAR, Y CONCATENARLO CON EL ID DE LA UNIDAD, DE LA TABLA UNIDAD.
-- CABE ACLARAR QUE PARA ESTA FUNCION ME AYUDE CON CHAT GPT, DEBIDO A QUE CONSIDERO QUE TENIA HERRAMIENTAS LIMITADAS EN MI
-- SIN EMBARGO FUE MODIFICADO Y PROBADO CON EL FIN DE QUE REALICE LO QUE NECESITABA.
DELIMITER //
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

-- FUNCION PARA CONVERTIR EL VALOR DEL TOTAL A PAGAR DE LA FACTURA SELECCIONADA, CONSIDERADO EN DOLAR, SEGÚN EL VALOR OFICIAL EN PESOS
-- ARGENTINOS, EN LA CIUDAD Y PROVINCIA DE BUENOS AIRES
DELIMITER //
CREATE FUNCTION fn_convertir (id_factura int, dolar_oficial float (8,2)) RETURNS float(8,2)
DETERMINISTIC
	BEGIN
			DECLARE imp_pais FLOAT(8,2);
			DECLARE iva FLOAT(8,2);
			DECLARE ganancias FLOAT(8,2);
			DECLARE IIBB FLOAT (8,2);
			DECLARE imp_dig FLOAT (8,2);
			DECLARE dolar_a_conv FLOAT(8,2);
			DECLARE conv_oficial FLOAT (8,2);
			DECLARE total_convertido FLOAT (8,2);
        -- selecciono de donde vendran las variable de entrada
				SELECT
				f.ID_TRANSACCION, f.TOTAL_PAGAR INTO id_factura, dolar_a_conv
				FROM
				FACTURA AS f
				WHERE ID_TRANSACCION = id_factura;
	-- creo las variables dentro de la funcion
			SET imp_pais = 0.08;
			SET iva = 0.21;
			SET ganancias = 0.3;
			SET IIBB = 0.02;
			SET imp_dig = 0.21;
			SET conv_oficial = 	((dolar_oficial * 0.1) + dolar_oficial) * dolar_a_conv;
			
			SET total_convertido = conv_oficial
			+ (conv_oficial * imp_pais)
			+ (conv_oficial * iva)
			+ (conv_oficial * ganancias)
			+ (conv_oficial * IIBB);
			
		RETURN total_convertido;
		END //

DELIMITER ;
