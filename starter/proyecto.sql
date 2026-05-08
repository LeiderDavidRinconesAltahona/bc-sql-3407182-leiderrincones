-- ============================================
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — SELECT, WHERE, ORDER BY, LIMIT/OFFSET
-- DOMINIO: NOTARIA
-- ============================================

-- ============================================
-- CONSULTA 1: Listado general con columnas explícitas
-- ============================================

SELECT
    id AS id_documento,
    name AS nombre_documento,
    type AS tipo_documento,
    status AS estado_documento
FROM items;

-- ============================================
-- CONSULTA 2: Filtro por condición simple
-- ============================================

SELECT
    id AS codigo_documento,
    name AS documento,
    status AS estado
FROM items
WHERE status = 'pendiente';

-- ============================================
-- CONSULTA 3: Filtro combinado (AND)
-- ============================================

SELECT
    id AS id_documento,
    name AS nombre_documento,
    type AS tipo,
    status AS estado
FROM items
WHERE type = 'Contrato'
AND status = 'pendiente';

-- ============================================
-- CONSULTA 4: Top-N con ORDER BY + LIMIT
-- ============================================

SELECT
    id AS id_documento,
    name AS nombre_documento,
    status AS estado
FROM items
ORDER BY id DESC
LIMIT 5;

-- ============================================
-- CONSULTA 5: Paginación (página 1 y página 2)
-- ============================================

-- Página 1

SELECT
    id AS id_documento,
    name AS nombre_documento
FROM items
ORDER BY name ASC
LIMIT 3 OFFSET 0;

-- Página 2

SELECT
    id AS id_documento,
    name AS nombre_documento
FROM items
ORDER BY name ASC
LIMIT 3 OFFSET 3;