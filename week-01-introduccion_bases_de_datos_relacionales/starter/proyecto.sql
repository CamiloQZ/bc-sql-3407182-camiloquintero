git config --global user.name "TuUsuario"-- ============================================
-- PROYECTO: ACUARIO
-- Semana 01 — Bases de Datos
-- ============================================


-- PASO 1: ENTIDAD PRINCIPAL (peces)

CREATE TABLE peces (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    especie TEXT NOT NULL,
    edad INTEGER, -- edad en meses
    estado TEXT -- saludable, enfermo, en tratamiento
);


-- PASO 2: SEGUNDA ENTIDAD (cuidadores)

CREATE TABLE cuidadores (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    email TEXT,
    turno TEXT -- mañana, tarde, noche
);


-- PASO 3: DATOS DE PRUEBA

-- 15 registros (tabla principal)

INSERT INTO peces (id, nombre, especie, edad, estado) VALUES
(1, 'Nemo', 'Pez payaso', 12, 'saludable'),
(2, 'Dory', 'Cirujano azul', 10, 'saludable'),
(3, 'Bubbles', 'Pez globo', 8, 'enfermo'),
(4, 'Goldie', 'Pez dorado', 14, 'saludable'),
(5, 'Flash', 'Pez cebra', 6, 'en tratamiento'),
(6, 'Coral', 'Betta', 9, 'saludable'),
(7, 'Marlin', 'Pez payaso', 11, 'saludable'),
(8, 'Splash', 'Tetra neón', 7, 'saludable'),
(9, 'Aqua', 'Pez ángel', 5, 'enfermo'),
(10, 'Wave', 'Guppy', 4, 'saludable'),
(11, 'Blue', 'Cirujano azul', 13, 'en tratamiento'),
(12, 'Shadow', 'Molly', 10, 'saludable'),
(13, 'Sunny', 'Pez dorado', 15, 'saludable'),
(14, 'Pearl', 'Tetra neón', 6, 'enfermo'),
(15, 'Storm', 'Betta', 8, 'saludable');

-- 5 registros (tabla secundaria)

INSERT INTO cuidadores (id, nombre, email, turno) VALUES
(1, 'Carlos López', 'carlos@acuario.com', 'mañana'),
(2, 'Laura Díaz', 'laura@acuario.com', 'tarde'),
(3, 'Miguel Ruiz', 'miguel@acuario.com', 'noche'),
(4, 'Andrea Torres', 'andrea@acuario.com', 'mañana'),
(5, 'Luis Gómez', 'luis@acuario.com', 'tarde');


-- ============================================
-- PASO 4: CONSULTAS SELECT
-- ============================================

-- Mostrar todos los peces
SELECT *FROM peces;

-- Mostrar nombres de peces ordenados
SELECT nombre
FROM peces
ORDER BY nombre ASC;

-- Contar total de peces
SELECT COUNT(*) AS total_peces
FROM peces;

-- Mostrar cuidadores del turno mañana
SELECT nombre
FROM cuidadores
WHERE turno = 'mañana';