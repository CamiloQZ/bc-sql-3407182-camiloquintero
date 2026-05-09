-- ============================================
-- PROYECTO: ACUARIO
-- Semana 06 — COUNT, SUM, AVG, GROUP BY, HAVING
-- ============================================

-- ============================================
-- REPORTE 1: Totales globales
-- ============================================

SELECT
    COUNT(*)      AS total_peces,
    SUM(peso)     AS suma_peso_total,
    AVG(peso)     AS promedio_peso
FROM especies;

-- ============================================
-- REPORTE 2: Extremos
-- ============================================

SELECT
    MIN(peso) AS peso_minimo,
    MAX(peso) AS peso_maximo
FROM especies;

-- ============================================
-- REPORTE 3: Subtotales por categoría
-- GROUP BY tipo de pez
-- ============================================

SELECT
    tipo                    AS tipo_pez,
    COUNT(*)                AS total_peces,
    AVG(peso)               AS promedio_peso,
    SUM(peso)               AS peso_total
FROM especies
GROUP BY tipo
ORDER BY total_peces DESC;

-- ============================================
-- REPORTE 4: Filtro de grupos con HAVING
-- Mostrar solo tipos de pez con más de 1 registro
-- ============================================

SELECT
    tipo            AS tipo_pez,
    COUNT(*)        AS cantidad
FROM especies
GROUP BY tipo
HAVING COUNT(*) > 1;