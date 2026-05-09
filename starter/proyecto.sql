-- ============================================
-- PROYECTO: ACUARIO
-- Semana 07 — NULL y Constraints
-- ============================================

-- Activar claves foráneas
PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS peces;
DROP TABLE IF EXISTS categorias;

-- ============================================
-- PARTE 1: ESQUEMA CON CONSTRAINTS
-- ============================================

-- Tabla de categorías

CREATE TABLE categorias (
    id              INTEGER PRIMARY KEY,
    nombre          TEXT NOT NULL UNIQUE
);

-- Tabla principal

CREATE TABLE peces (
    id                  INTEGER PRIMARY KEY,
    nombre              TEXT NOT NULL,
    codigo              TEXT NOT NULL UNIQUE,
    especie             TEXT NOT NULL,
    edad                INTEGER NOT NULL CHECK(edad > 0),
    peso                REAL CHECK(peso > 0),
    color               TEXT,
    estado_salud        TEXT DEFAULT 'Saludable',
    categoria_id        INTEGER NOT NULL,

    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id)
        ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS DE PRUEBA
-- ============================================

-- Categorías

INSERT INTO categorias (id, nombre) VALUES
(1, 'Agua dulce'),
(2, 'Agua salada'),
(3, 'Tropicales');

-- Peces

INSERT INTO peces
(id, nombre, codigo, especie, edad, peso, color, estado_salud, categoria_id)
VALUES
(1, 'Nemo', 'PZ001', 'Pez Payaso', 2, 0.3, 'Naranja', 'Saludable', 2),

(2, 'Dory', 'PZ002', 'Cirujano Azul', 3, 0.5, 'Azul', 'Saludable', 2),

(3, 'Burbujas', 'PZ003', 'Pez Dorado', 1, 0.2, NULL, 'Saludable', 1),

(4, 'Sombra', 'PZ004', 'Betta', 2, 0.1, 'Negro', NULL, 3),

(5, 'Flash', 'PZ005', 'Guppy', 1, 0.05, NULL, 'En observación', 1),

(6, 'Coral', 'PZ006', 'Pez Ángel', 4, 0.6, 'Plateado', 'Saludable', 3);

-- ============================================
-- PARTE 3: CONSULTAS CON NULL
-- ============================================

-- Peces con color NULL

SELECT
    id,
    nombre
FROM peces
WHERE color IS NULL;

-- Mostrar todos los peces usando COALESCE

SELECT
    nombre,
    COALESCE(color, 'Sin color registrado') AS color_mostrado
FROM peces;