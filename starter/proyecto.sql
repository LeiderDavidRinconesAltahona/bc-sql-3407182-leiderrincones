-- ============================================
-- PROYECTO SEMANAL: Conoce tu Dominio
-- DOMINIO: NOTARIA
-- ============================================

-- ============================================
-- PASO 1: ENTIDAD PRINCIPAL (DOCUMENTOS)
-- ============================================

CREATE TABLE items (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    type        TEXT,
    date        TEXT
);

-- ============================================
-- PASO 2: SEGUNDA ENTIDAD (CLIENTES)
-- ============================================

CREATE TABLE entities (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    email       TEXT,
    phone       TEXT
);

-- ============================================
-- PASO 3: DATOS
-- ============================================

-- 🔹 15 DOCUMENTOS (TABLA PRINCIPAL)
INSERT INTO items (id, name, type, date) VALUES
(1, 'Contrato de Compra', 'Contrato', '2026-04-01'),
(2, 'Escritura Casa', 'Escritura', '2026-04-02'),
(3, 'Poder Legal', 'Poder', '2026-04-03'),
(4, 'Testamento', 'Legal', '2026-04-04'),
(5, 'Contrato Arriendo', 'Contrato', '2026-04-05'),
(6, 'Declaración Juramentada', 'Legal', '2026-04-06'),
(7, 'Autenticación Firma', 'Trámite', '2026-04-07'),
(8, 'Permiso Viaje', 'Legal', '2026-04-08'),
(9, 'Contrato Laboral', 'Contrato', '2026-04-09'),
(10, 'Divorcio Notarial', 'Legal', '2026-04-10'),
(11, 'Compraventa Vehículo', 'Contrato', '2026-04-11'),
(12, 'Reconocimiento Hijo', 'Legal', '2026-04-12'),
(13, 'Capitulaciones', 'Legal', '2026-04-13'),
(14, 'Poder Especial', 'Poder', '2026-04-14'),
(15, 'Cancelación Hipoteca', 'Legal', '2026-04-15');

-- 🔹 5 CLIENTES
INSERT INTO entities (id, name, email, phone) VALUES
(1, 'Juan Perez', 'juan@gmail.com', '3001234567'),
(2, 'Maria Gomez', 'maria@gmail.com', '3012345678'),
(3, 'Carlos Lopez', 'carlos@gmail.com', '3023456789'),
(4, 'Ana Torres', 'ana@gmail.com', '3034567890'),
(5, 'Luis Martinez', 'luis@gmail.com', '3045678901');

-- ============================================
-- PASO 4: CONSULTAS
-- ============================================

-- Todos los documentos
SELECT *
FROM items;

-- Nombres ordenados
SELECT name
FROM items
ORDER BY name ASC;

-- Total de documentos
SELECT COUNT(*) AS total_items
FROM items;