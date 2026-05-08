-- ============================================
-- PROYECTO: ACUARIO
-- Semana 04 — SELECT, WHERE, ORDER BY, LIMIT/OFFSET
-- ============================================

-- ============================================
-- CONSULTA 1: Listado general con alias
-- ============================================

SELECT
    id              AS "ID del pez",
    nombre          AS "Nombre",
    tipo            AS "Especie",
    edad            AS "Edad",
    estado_salud    AS "Estado de salud"
FROM especies;

-- ============================================
-- CONSULTA 2: Filtro por condición simple
-- Peces con edad mayor a 3 años
-- ============================================

SELECT
    id,
    nombre,
    tipo,
    edad
FROM especies
WHERE edad > 3;

-- ============================================
-- CONSULTA 3: Filtro combinado
-- Peces saludables y de color azul
-- ============================================

SELECT
    id              AS "Código",
    nombre          AS "Nombre del pez",
    color           AS "Color",
    estado_salud    AS "Estado"
FROM especies
WHERE color = 'Azul'
AND estado_salud = 'Saludable';

-- ============================================
-- CONSULTA 4: Top 5 peces más pesados
-- ============================================

SELECT
    id,
    nombre,
    tipo,
    peso
FROM especies
ORDER BY peso DESC
LIMIT 5;

-- ============================================
-- CONSULTA 5: Tanques ordenados por capacidad
-- ============================================

SELECT
    id,
    nombre_tanque,
    capacidad_litros,
    tipo_agua
FROM tanques
ORDER BY capacidad_litros DESC;

-- ============================================
-- CONSULTA 6: Paginación - Página 1
-- ============================================

SELECT
    id,
    nombre,
    tipo
FROM especies
ORDER BY nombre ASC
LIMIT 3 OFFSET 0;

-- ============================================
-- CONSULTA 7: Paginación - Página 2
-- ============================================

SELECT
    id,
    nombre,
    tipo
FROM especies
ORDER BY nombre ASC
LIMIT 3 OFFSET 3;