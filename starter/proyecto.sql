-- ============================================
-- PROYECTO.SQL
-- Semana 05 — Evidencia de Producto
-- Dominio: Notaría
-- ============================================

-- ============================================
-- CONSULTA 1 — BETWEEN
-- ============================================

SELECT first_name,
       last_name,
       age
FROM clients
WHERE age BETWEEN 18 AND 35;

-- ============================================
-- CONSULTA 2 — NOT BETWEEN
-- ============================================

SELECT description,
       amount
FROM fees
WHERE amount NOT BETWEEN 100000 AND 500000;

-- ============================================
-- CONSULTA 3 — IN
-- ============================================

SELECT document_number,
       document_type
FROM documents
WHERE document_type IN ('CC', 'PASSPORT');

-- ============================================
-- CONSULTA 4 — NOT IN
-- ============================================

SELECT first_name,
       city
FROM notaries
WHERE city NOT IN ('Bogota');

-- ============================================
-- CONSULTA 5 — LIKE
-- ============================================

SELECT first_name,
       email
FROM clients
WHERE first_name LIKE 'A%';

-- ============================================
-- CONSULTA 6 — NOT LIKE
-- ============================================

SELECT first_name,
       email
FROM clients
WHERE email NOT LIKE '%@outlook.com';

-- ============================================
-- CONSULTA 7 — FILTRO COMBINADO
-- ============================================

SELECT first_name,
       last_name,
       city,
       age,
       email
FROM clients
WHERE city IN ('Bogota', 'Cali')
  AND age BETWEEN 18 AND 35
  AND email LIKE '%gmail.com';

-- ============================================
-- CONSULTA 8 — FILTRO AVANZADO
-- ============================================

SELECT document_number,
       status,
       total_cost
FROM documents
WHERE status IN ('APPROVED', 'SIGNED')
  AND total_cost BETWEEN 300000 AND 900000
  AND document_number LIKE 'DOC%';