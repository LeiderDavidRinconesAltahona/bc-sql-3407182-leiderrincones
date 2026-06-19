-- ============================================
-- PROYECTO SEMANAL
-- SEMANA 09
-- JOINs
-- ============================================

.headers on
.mode column

-- ============================================
-- 1. DOCUMENTOS Y CLIENTES
-- ============================================

SELECT
    i.name AS documento,
    i.type,
    e.name AS cliente
FROM relations r
INNER JOIN items i
    ON r.item_id = i.id
INNER JOIN entities e
    ON r.entity_id = e.id;

-- ============================================
-- 2. DOCUMENTOS COMPLETADOS
-- ============================================

SELECT
    i.name AS documento,
    e.name AS cliente
FROM relations r
INNER JOIN items i
    ON r.item_id = i.id
INNER JOIN entities e
    ON r.entity_id = e.id
WHERE i.status = 'completado';

-- ============================================
-- 3. CLIENTES Y SUS DOCUMENTOS
-- ============================================

SELECT
    e.name AS cliente,
    i.name AS documento
FROM entities e
LEFT JOIN relations r
    ON e.id = r.entity_id
LEFT JOIN items i
    ON r.item_id = i.id
ORDER BY e.name;

-- ============================================
-- 4. CLIENTES SIN DOCUMENTOS
-- ============================================

SELECT
    e.name AS cliente_sin_documentos
FROM entities e
LEFT JOIN relations r
    ON e.id = r.entity_id
WHERE r.id IS NULL;

-- ============================================
-- 5. DOCUMENTOS SIN CLIENTE
-- ============================================

SELECT
    i.name AS documento_sin_cliente
FROM items i
LEFT JOIN relations r
    ON i.id = r.item_id
WHERE r.id IS NULL;

-- ============================================
-- 6. TOTAL DE DOCUMENTOS POR CLIENTE
-- ============================================

SELECT
    e.name AS cliente,
    COUNT(i.id) AS total_documentos
FROM entities e
LEFT JOIN relations r
    ON e.id = r.entity_id
LEFT JOIN items i
    ON r.item_id = i.id
GROUP BY e.id
ORDER BY total_documentos DESC;

-- ============================================
-- 7. TOTAL DE DOCUMENTOS POR ESTADO
-- ============================================

SELECT
    status,
    COUNT(*) AS cantidad
FROM items
GROUP BY status;