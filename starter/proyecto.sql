-- ============================================
-- PROYECTO SEMANAL — NOTARÍA
-- SEMANA 06
-- ============================================

-- ============================================
-- TOTAL DE CLIENTES
-- ============================================

SELECT COUNT(*) AS total_clientes
FROM clients;

-- ============================================
-- TOTAL Y PROMEDIO DE TARIFAS
-- ============================================

SELECT
    SUM(amount) AS total_recaudado,
    AVG(amount) AS promedio_tarifas
FROM fees;

-- ============================================
-- TARIFA MÁS ALTA Y MÁS BAJA
-- ============================================

SELECT
    MIN(amount) AS tarifa_minima,
    MAX(amount) AS tarifa_maxima
FROM fees;

-- ============================================
-- DOCUMENTOS POR TIPO
-- ============================================

SELECT
    document_type,
    COUNT(*) AS total_documentos
FROM documents
GROUP BY document_type
ORDER BY total_documentos DESC;

-- ============================================
-- PROMEDIO DE TARIFAS POR NOTARIO
-- ============================================

SELECT
    notary_id,
    COUNT(*) AS total_tramites,
    ROUND(AVG(amount), 2) AS promedio_tarifas,
    SUM(amount) AS total_recaudado
FROM fees
GROUP BY notary_id;

-- ============================================
-- NOTARIOS CON MÁS DE 3 TRÁMITES
-- ============================================

SELECT
    notary_id,
    COUNT(*) AS total_tramites
FROM fees
GROUP BY notary_id
HAVING COUNT(*) > 3;

-- ============================================
-- NOTARIOS CON PROMEDIO ALTO
-- ============================================

SELECT
    notary_id,
    ROUND(AVG(amount), 2) AS promedio
FROM fees
WHERE amount > 100000
GROUP BY notary_id
HAVING AVG(amount) > 150000
ORDER BY promedio DESC;