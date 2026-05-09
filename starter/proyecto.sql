-- ============================================
-- PROYECTO: ACUARIO
-- Semana 05 — BETWEEN, IN, LIKE
-- ============================================

-- ============================================
-- CONSULTA 1: Filtro con BETWEEN
-- Peces con edad entre 2 y 5 años
-- ============================================

SELECT
    id              AS "ID",
    nombre          AS "Nombre del pez",
    tipo            AS "Especie",
    edad            AS "Edad"
FROM especies
WHERE edad BETWEEN 2 AND 5;

-- ============================================
-- CONSULTA 2: Filtro con IN
-- Peces de ciertos colores
-- ============================================

SELECT
    id,
    nombre,
    color,
    estado_salud
FROM especies
WHERE color IN ('Azul', 'Rojo', 'Blanco');

-- ============================================
-- CONSULTA 3: Búsqueda con LIKE
-- Peces cuyo nombre contiene la letra 'a'
-- ============================================

SELECT
    id,
    nombre,
    tipo
FROM especies
WHERE nombre LIKE '%a%';

-- ============================================
-- CONSULTA 4: Filtro combinado
-- Peces saludables entre 2 y 5 años
-- y de colores específicos.
-- ============================================

SELECT
    id                  AS "Código",
    nombre              AS "Nombre",
    tipo                AS "Especie",
    edad                AS "Edad",
    color               AS "Color",
    estado_salud        AS "Estado"
FROM especies
WHERE edad BETWEEN 2 AND 5
AND color IN ('Azul', 'Amarillo', 'Blanco')
AND nombre LIKE '%a%'
ORDER BY edad ASC; 