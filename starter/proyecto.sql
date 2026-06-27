-- ============================================
-- PROYECTO SEMANAL: JOINs aplicados al dominio Acuario
-- Semana 09 — INNER JOIN y LEFT JOIN
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- Eliminar tablas si existen
-- ============================================

DROP TABLE IF EXISTS registros_alimentacion;
DROP TABLE IF EXISTS especies;
DROP TABLE IF EXISTS tanques;

-- ============================================
-- Tabla de tanques
-- ============================================

CREATE TABLE tanques (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE
);

-- ============================================
-- Tabla de especies
-- ============================================

CREATE TABLE especies (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    id_tanque INTEGER,
    FOREIGN KEY (id_tanque) REFERENCES tanques(id)
);

-- ============================================
-- Tabla de registros de alimentación
-- ============================================

CREATE TABLE registros_alimentacion (
    id INTEGER PRIMARY KEY,
    fecha_alimentacion TEXT NOT NULL,
    cantidad_alimento INTEGER NOT NULL,
    id_especie INTEGER,
    FOREIGN KEY (id_especie) REFERENCES especies(id)
);

-- ============================================
-- Datos de prueba
-- ============================================

INSERT INTO tanques (nombre) VALUES
('Tanque Tropical'),
('Tanque Marino'),
('Tanque Amazónico');

INSERT INTO especies (nombre, id_tanque) VALUES
('Pez Payaso',2),
('Tiburón Bambú',2),
('Guppy',1),
('Arowana',3);

INSERT INTO registros_alimentacion
(fecha_alimentacion,cantidad_alimento,id_especie)
VALUES
('2026-06-20',50,1),
('2026-06-20',35,1),
('2026-06-21',80,2),
('2026-06-22',20,3);

-- ============================================
-- CONSULTA 1
-- INNER JOIN principal
-- Une especies con registros de alimentación
-- ============================================

SELECT
    e.id AS id_especie,
    e.nombre AS especie,
    ra.fecha_alimentacion,
    ra.cantidad_alimento
FROM especies e
INNER JOIN registros_alimentacion ra
ON ra.id_especie = e.id;

-- ============================================
-- CONSULTA 2
-- JOIN con tres tablas
-- Especies + Tanques + Alimentaciones
-- ============================================

SELECT
    e.nombre AS especie,
    t.nombre AS tanque,
    ra.fecha_alimentacion,
    ra.cantidad_alimento
FROM especies e
INNER JOIN tanques t
ON e.id_tanque = t.id
INNER JOIN registros_alimentacion ra
ON ra.id_especie = e.id;

-- ============================================
-- CONSULTA 3
-- LEFT JOIN
-- Mostrar todas las especies aunque no tengan
-- registros de alimentación
-- ============================================

SELECT
    e.nombre AS especie,
    ra.fecha_alimentacion
FROM especies e
LEFT JOIN registros_alimentacion ra
ON ra.id_especie = e.id;

-- ============================================
-- CONSULTA 4
-- Detectar especies sin alimentación
-- ============================================

SELECT
    e.nombre AS especie_sin_registros
FROM especies e
LEFT JOIN registros_alimentacion ra
ON ra.id_especie = e.id
WHERE ra.id IS NULL;

-- ============================================
-- CONSULTA 5
-- Cantidad de alimentaciones por especie
-- ============================================

SELECT
    e.nombre AS especie,
    COUNT(ra.id) AS total_alimentaciones
FROM especies e
LEFT JOIN registros_alimentacion ra
ON ra.id_especie = e.id
GROUP BY e.id, e.nombre
ORDER BY total_alimentaciones DESC;