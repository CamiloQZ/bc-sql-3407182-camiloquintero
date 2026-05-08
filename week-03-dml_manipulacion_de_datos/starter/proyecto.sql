-- ============================================
-- PROYECTO: ACUARIO
-- Semana 03 — DML: Manipulación de Datos
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS registros_alimentacion;
DROP TABLE IF EXISTS especies;
DROP TABLE IF EXISTS tanques;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE IF NOT EXISTS especies (
    id                  INTEGER PRIMARY KEY,
    nombre              TEXT NOT NULL,
    tipo                TEXT NOT NULL,
    edad                INTEGER NOT NULL CHECK(edad >= 0),
    color               TEXT,
    estado_salud        TEXT DEFAULT 'Saludable',
    peso                REAL CHECK(peso > 0)
);

CREATE TABLE IF NOT EXISTS tanques (
    id                  INTEGER PRIMARY KEY,
    nombre_tanque       TEXT NOT NULL UNIQUE,
    capacidad_litros    REAL NOT NULL CHECK(capacidad_litros > 0),
    tipo_agua           TEXT NOT NULL CHECK(
                            tipo_agua IN ('Dulce', 'Salada')
                        ),
    temperatura         REAL DEFAULT 25
);

CREATE TABLE IF NOT EXISTS registros_alimentacion (
    id                  INTEGER PRIMARY KEY,
    especie_id          INTEGER NOT NULL,
    tanque_id           INTEGER NOT NULL,
    comida              TEXT NOT NULL,
    horario             TEXT NOT NULL,
    cantidad_gramos     REAL CHECK(cantidad_gramos > 0),

    FOREIGN KEY (especie_id) REFERENCES especies(id),
    FOREIGN KEY (tanque_id) REFERENCES tanques(id)
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- INSERTS EN ESPECIES (15 FILAS)

INSERT INTO especies VALUES
(1, 'Nemo', 'Pez Payaso', 2, 'Naranja', 'Saludable', 0.3),
(2, 'Dory', 'Cirujano Azul', 3, 'Azul', 'Saludable', 0.5),
(3, 'Burbujas', 'Pez Dorado', 1, 'Dorado', 'Saludable', 0.2),
(4, 'Sombra', 'Betta', 2, 'Negro', 'Enfermo', 0.1),
(5, 'Flash', 'Guppy', 1, 'Amarillo', 'Saludable', 0.05),
(6, 'Coral', 'Pez Ángel', 4, 'Plateado', 'Saludable', 0.6),
(7, 'Spike', 'Pez Globo', 5, 'Marrón', 'Saludable', 1.2),
(8, 'Perla', 'Molly', 2, 'Blanco', 'Saludable', 0.15),
(9, 'Ruby', 'Cola de Espada', 3, 'Rojo', 'Saludable', 0.2),
(10, 'Océano', 'Tetra', 1, 'Azul', 'Saludable', 0.04),
(11, 'Sunny', 'Disco', 4, 'Naranja', 'Saludable', 0.8),
(12, 'Tormenta', 'Bagre', 6, 'Gris', 'Saludable', 1.5),
(13, 'Wave', 'Caballito de Mar', 2, 'Amarillo', 'Saludable', 0.09),
(14, 'Cristal', 'Koi', 5, 'Blanco', 'Saludable', 2.3),
(15, 'Bolt', 'Cíclido', 3, 'Verde', 'Saludable', 0.7);

-- INSERTS EN TANQUES (15 FILAS)

INSERT INTO tanques VALUES
(1, 'Tanque Pacífico', 500, 'Salada', 24),
(2, 'Tanque Amazonas', 300, 'Dulce', 26),
(3, 'Arrecife Coralino', 700, 'Salada', 25),
(4, 'Paraíso Tropical', 450, 'Dulce', 27),
(5, 'Océano Profundo', 1000, 'Salada', 22),
(6, 'Tanque Azul', 350, 'Dulce', 25),
(7, 'Laguna Marina', 600, 'Salada', 23),
(8, 'Mundo Tropical', 400, 'Dulce', 28),
(9, 'Aguas Claras', 250, 'Dulce', 24),
(10, 'Mar Abierto', 800, 'Salada', 21),
(11, 'Corales Vivos', 550, 'Salada', 26),
(12, 'Río Amazónico', 300, 'Dulce', 27),
(13, 'Tanque Cristal', 200, 'Dulce', 25),
(14, 'Isla Marina', 900, 'Salada', 22),
(15, 'Hábitat Marino', 750, 'Salada', 23);

-- INSERTS EN REGISTROS_ALIMENTACION

INSERT INTO registros_alimentacion VALUES
(1, 1, 1, 'Escamas', '08:00 AM', 5),
(2, 2, 1, 'Algas', '09:00 AM', 7),
(3, 3, 2, 'Pellets', '10:00 AM', 4),
(4, 4, 4, 'Larvas', '01:00 PM', 3),
(5, 7, 5, 'Camarón', '03:00 PM', 10),
(6, 5, 6, 'Micro pellets', '11:00 AM', 2),
(7, 6, 7, 'Algas', '12:00 PM', 6),
(8, 8, 8, 'Escamas', '02:00 PM', 4),
(9, 9, 9, 'Pellets', '04:00 PM', 5),
(10, 10, 10, 'Larvas', '05:00 PM', 2);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar una fila específica por PK

UPDATE especies
SET estado_salud = 'Recuperado'
WHERE id = 4;

-- Actualizar múltiples columnas

UPDATE tanques
SET temperatura = 26,
    capacidad_litros = 550
WHERE id = 1;

-- Actualizar múltiples filas por condición

UPDATE especies
SET estado_salud = 'En observación'
WHERE edad >= 5;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar filas antes de eliminar

SELECT id, nombre
FROM especies
WHERE peso < 0.05;

-- Eliminar usando el mismo WHERE

DELETE FROM especies
WHERE peso < 0.05;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT * FROM especies ORDER BY id;

SELECT * FROM tanques ORDER BY id;

SELECT * FROM registros_alimentacion ORDER BY id;