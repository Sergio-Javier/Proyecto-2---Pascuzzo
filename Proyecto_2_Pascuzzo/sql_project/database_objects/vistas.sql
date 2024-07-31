USE AUTOBATTLER;

-- Primer vista
-- crear una vista para ver los datos de los usuarios y sus tiempos de partida
-- y composiciones segun el registro de partidas
DROP VIEW IF EXISTS vw_date_reg;
CREATE VIEW vw_date_reg AS
SELECT
    r.ID_REG,
    u.NICK,
    p.TIEMPO_DE_PARTIDA,
    e.UNIDADES_COMPRADAS
FROM
    REGISTRO_DE_PARTIDA AS r
    JOIN USUARIO AS u ON r.ID_USER = u.ID_USER
    JOIN PARTIDA AS p ON r.ID_SALA = p.ID_SALA
    JOIN ESTADISTICAS AS e ON p.ID_ESTADISTICA = e.ID_ESTADISTICA;


-- Segunda vista:
-- contar cuantas patidas tiene cada usuario
DROP VIEW IF EXISTS vw_user_count_party;
CREATE VIEW vw_user_count_party AS
SELECT
    u.ID_USER,
    u.NICK,
    COUNT(r.ID_REG) AS total_partidas
FROM
    USUARIO AS u
    LEFT JOIN REGISTRO_DE_PARTIDA AS r ON u.ID_USER = r.ID_USER
GROUP BY
    u.ID_USER, u.NICK;
