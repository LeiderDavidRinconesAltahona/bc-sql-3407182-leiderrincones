-- ============================================
-- PROYECTO SEMANAL - SEMANA 07
-- NULL Y CONSTRAINTS
-- DOMINIO: NOTARÍA
-- ============================================

-- ============================================
-- ACTIVAR FOREIGN KEYS
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS relations;
DROP TABLE IF EXISTS entities;
DROP TABLE IF EXISTS items;

-- ============================================
-- TABLA 1: DOCUMENTOS
-- ============================================

CREATE TABLE IF NOT EXISTS items (
id          INTEGER PRIMARY KEY,
name        TEXT NOT NULL,
type        TEXT NOT NULL,
status      TEXT DEFAULT 'pendiente'
CHECK (status IN ('pendiente','completado','cancelado')),
code        TEXT UNIQUE,
is_active   INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 2: CLIENTES
-- ============================================

CREATE TABLE IF NOT EXISTS entities (
id          INTEGER PRIMARY KEY,
name        TEXT NOT NULL,
email       TEXT UNIQUE,
phone       TEXT,
created_at  TEXT DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABLA 3: RELACIÓN DOCUMENTO - CLIENTE
-- ============================================

CREATE TABLE IF NOT EXISTS relations (
id         INTEGER PRIMARY KEY,
item_id    INTEGER NOT NULL,
entity_id  INTEGER NOT NULL,

```
FOREIGN KEY (item_id)
    REFERENCES items(id)
    ON DELETE RESTRICT,

FOREIGN KEY (entity_id)
    REFERENCES entities(id)
    ON DELETE RESTRICT
```

);

-- ============================================
-- INSERTS DOCUMENTOS (30 REGISTROS)
-- ============================================

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
(15, 'Cancelación Hipoteca', 'Legal', 'completado', 'DOC015'),
(16, 'Autorización Salida Menor', 'Permiso', 'pendiente', 'DOC016'),
(17, 'Constitución Sociedad', 'Empresarial', 'completado', 'DOC017'),
(18, 'Disolución Sociedad', 'Empresarial', 'pendiente', 'DOC018'),
(19, 'Cesión de Derechos', 'Legal', 'completado', 'DOC019'),
(20, 'Declaración Extrajuicio', 'Legal', 'pendiente', 'DOC020'),
(21, 'Autenticación Documento', 'Trámite', 'completado', 'DOC021'),
(22, 'Protocolización Acta', 'Legal', 'cancelado', 'DOC022'),
(23, 'Permuta de Inmuebles', 'Contrato', 'pendiente', 'DOC023'),
(24, 'Donación de Bienes', 'Legal', 'completado', 'DOC024'),
(25, 'Levantamiento Patrimonio Familiar', 'Legal', 'pendiente', 'DOC025'),
(26, 'Liquidación Sociedad Conyugal', 'Legal', 'completado', 'DOC026'),
(27, 'Corrección Escritura Pública', 'Escritura', 'pendiente', 'DOC027'),
(28, 'Constitución Patrimonio Familiar', 'Legal', 'completado', 'DOC028'),
(29, 'Revocatoria de Poder', 'Poder', 'cancelado', 'DOC029'),
(30, 'Sucesión Notarial', 'Legal', 'pendiente', 'DOC030');

-- ============================================
-- INSERTS CLIENTES
-- (Incluye NULL para practicar)
-- ============================================

INSERT INTO entities (id, name, email, phone) VALUES
(1, 'Juan Perez', '[juan@gmail.com](mailto:juan@gmail.com)', '3001234567'),
(2, 'Maria Gomez', NULL, '3012345678'),
(3, 'Carlos Lopez', '[carlos@gmail.com](mailto:carlos@gmail.com)', NULL),
(4, 'Ana Torres', NULL, NULL),
(5, 'Luis Martinez', '[luis@gmail.com](mailto:luis@gmail.com)', '3045678901');

-- ============================================
-- INSERTS RELACIONES
-- ============================================

INSERT INTO relations (id, item_id, entity_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- ============================================
-- CONSULTAS IS NULL
-- ============================================

-- Clientes sin correo registrado

SELECT *
FROM entities
WHERE email IS NULL;

-- ============================================
-- CONSULTAS IS NOT NULL
-- ============================================

-- Clientes con teléfono registrado

SELECT *
FROM entities
WHERE phone IS NOT NULL;

-- ============================================
-- CONSULTAS COALESCE
-- ============================================

-- Mostrar correo o texto alternativo

SELECT
name,
COALESCE(email, 'Sin correo registrado') AS email
FROM entities;

-- ============================================
-- CONSULTAS NULLIF
-- ============================================

-- Convertir cadenas vacías en NULL

SELECT
name,
NULLIF(phone, '') AS telefono
FROM entities;

-- ============================================
-- VERIFICACIÓN GENERAL
-- ============================================

SELECT * FROM items;
SELECT * FROM entities;
SELECT * FROM relations;
