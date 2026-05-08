-- ============================================
-- PROYECTO: ACUARIO
-- Semana 02 — DDL: Diseño de Esquemas
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS alimentacion;
DROP TABLE IF EXISTS peces;
DROP TABLE IF EXISTS tanques;

-- ============================================
-- TABLA 1: PECES
-- ============================================

CREATE TABLE IF NOT EXISTS peces (
    id                  INTEGER PRIMARY KEY,
    nombre              TEXT NOT NULL,
    especie             TEXT NOT NULL,
    edad                INTEGER NOT NULL CHECK(edad >= 0),
    color               TEXT,
    estado_salud        TEXT NOT NULL DEFAULT 'Saludable',
    peso                REAL CHECK(peso > 0),
    activo              INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 2: TANQUES
-- ============================================

CREATE TABLE IF NOT EXISTS tanques (
    id                  INTEGER PRIMARY KEY,
    nombre_tanque       TEXT NOT NULL UNIQUE,
    capacidad_litros    REAL NOT NULL CHECK(capacidad_litros > 0),
    tipo_agua           TEXT NOT NULL CHECK(
                            tipo_agua IN ('Dulce', 'Salada')
                        ),
    temperatura         REAL DEFAULT 25
);

-- ============================================
-- TABLA 3: ALIMENTACIÓN
-- ============================================

CREATE TABLE IF NOT EXISTS alimentacion (
    id                  INTEGER PRIMARY KEY,
    pez_id              INTEGER NOT NULL,
    tanque_id           INTEGER NOT NULL,
    tipo_comida         TEXT NOT NULL,
    hora_alimentacion   TEXT NOT NULL,
    cantidad_gramos     REAL CHECK(cantidad_gramos > 0),

    FOREIGN KEY (pez_id) REFERENCES peces(id),
    FOREIGN KEY (tanque_id) REFERENCES tanques(id)
);

-- ============================================
-- DATOS DE PRUEBA - PECES (15 filas)
-- ============================================

INSERT INTO peces VALUES
(1, 'Nemo', 'Pez Payaso', 2, 'Naranja', 'Saludable', 0.3, 1),
(2, 'Dory', 'Cirujano Azul', 3, 'Azul', 'Saludable', 0.5, 1),
(3, 'Burbujas', 'Pez Dorado', 1, 'Dorado', 'Saludable', 0.2, 1),
(4, 'Sombra', 'Betta', 2, 'Negro', 'Enfermo', 0.1, 1),
(5, 'Flash', 'Guppy', 1, 'Amarillo', 'Saludable', 0.05, 1),
(6, 'Coral', 'Pez Ángel', 4, 'Plateado', 'Saludable', 0.6, 1),
(7, 'Spike', 'Pez Globo', 5, 'Marrón', 'Saludable', 1.2, 1),
(8, 'Perla', 'Molly', 2, 'Blanco', 'Saludable', 0.15, 1),
(9, 'Ruby', 'Cola de Espada', 3, 'Rojo', 'Saludable', 0.2, 1),
(10, 'Océano', 'Tetra', 1, 'Azul', 'Saludable', 0.04, 1),
(11, 'Sunny', 'Disco', 4, 'Naranja', 'Saludable', 0.8, 1),
(12, 'Tormenta', 'Bagre', 6, 'Gris', 'Saludable', 1.5, 1),
(13, 'Wave', 'Caballito de Mar', 2, 'Amarillo', 'Saludable', 0.09, 1),
(14, 'Cristal', 'Koi', 5, 'Blanco', 'Saludable', 2.3, 1),
(15, 'Bolt', 'Cíclido', 3, 'Verde', 'Saludable', 0.7, 1);

-- ============================================
-- DATOS DE PRUEBA - TANQUES (5 filas)
-- ============================================

INSERT INTO tanques VALUES
(1, 'Tanque Pacífico', 500, 'Salada', 24),
(2, 'Tanque Amazonas', 300, 'Dulce', 26),
(3, 'Arrecife Coralino', 700, 'Salada', 25),
(4, 'Paraíso Tropical', 450, 'Dulce', 27),
(5, 'Océano Profundo', 1000, 'Salada', 22);

-- ============================================
-- DATOS DE PRUEBA - ALIMENTACIÓN (5 filas)
-- ============================================

INSERT INTO alimentacion VALUES
(1, 1, 1, 'Escamas', '08:00 AM', 5),
(2, 2, 1, 'Algas', '09:00 AM', 7),
(3, 3, 2, 'Pellets', '10:00 AM', 4),
(4, 4, 4, 'Larvas', '01:00 PM', 3),
(5, 7, 5, 'Camarón', '03:00 PM', 10);

-- ============================================
-- VERIFICACIÓN
-- ============================================

.tables

PRAGMA table_info(peces);
PRAGMA table_info(tanques);
PRAGMA table_info(alimentacion);