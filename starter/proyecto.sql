-- ============================================
-- PROYECTO SEMANAL: DDL de tu Dominio
-- DOMINIO: NOTARIA
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS relations;
DROP TABLE IF EXISTS entities;
DROP TABLE IF EXISTS items;

-- ============================================
-- TABLA 1: DOCUMENTOS (PRINCIPAL)
-- ============================================

CREATE TABLE IF NOT EXISTS items (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    type        TEXT    NOT NULL,
    status      TEXT    DEFAULT 'pendiente' CHECK (status IN ('pendiente','completado','cancelado')),
    code        TEXT    UNIQUE,
    is_active   INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 2: CLIENTES
-- ============================================

CREATE TABLE IF NOT EXISTS entities (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    email       TEXT UNIQUE,
    phone       TEXT,
    created_at  TEXT DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA 3: RELACIÓN (DOCUMENTO - CLIENTE)
-- ============================================

CREATE TABLE IF NOT EXISTS relations (
    id         INTEGER PRIMARY KEY,
    item_id    INTEGER NOT NULL,
    entity_id  INTEGER NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

-- ============================================
-- INSERTS
-- ============================================

-- 🔹 DOCUMENTOS (15)
INSERT INTO items (id, name, type, status, code) VALUES
(1, 'Contrato Compra', 'Contrato', 'completado', 'DOC001'),
(2, 'Escritura Casa', 'Escritura', 'pendiente', 'DOC002'),
(3, 'Poder Legal', 'Poder', 'completado', 'DOC003'),
(4, 'Testamento', 'Legal', 'pendiente', 'DOC004'),
(5, 'Contrato Arriendo', 'Contrato', 'cancelado', 'DOC005'),
(6, 'Declaración Juramentada', 'Legal', 'completado', 'DOC006'),
(7, 'Autenticación Firma', 'Trámite', 'pendiente', 'DOC007'),
(8, 'Permiso Viaje', 'Legal', 'completado', 'DOC008'),
(9, 'Contrato Laboral', 'Contrato', 'pendiente', 'DOC009'),
(10, 'Divorcio Notarial', 'Legal', 'completado', 'DOC010'),
(11, 'Compraventa Vehículo', 'Contrato', 'pendiente', 'DOC011'),
(12, 'Reconocimiento Hijo', 'Legal', 'completado', 'DOC012'),
(13, 'Capitulaciones', 'Legal', 'cancelado', 'DOC013'),
(14, 'Poder Especial', 'Poder', 'pendiente', 'DOC014'),
(15, 'Cancelación Hipoteca', 'Legal', 'completado', 'DOC015');

-- 🔹 CLIENTES (5)
INSERT INTO entities (id, name, email, phone) VALUES
(1, 'Juan Perez', 'juan@gmail.com', '3001234567'),
(2, 'Maria Gomez', 'maria@gmail.com', '3012345678'),
(3, 'Carlos Lopez', 'carlos@gmail.com', '3023456789'),
(4, 'Ana Torres', 'ana@gmail.com', '3034567890'),
(5, 'Luis Martinez', 'luis@gmail.com', '3045678901');

-- 🔹 RELACIONES (mínimo 5)
INSERT INTO relations (id, item_id, entity_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- ============================================
-- VERIFICACIÓN
-- ============================================

SELECT * FROM items;
SELECT * FROM entities;
SELECT * FROM relations;