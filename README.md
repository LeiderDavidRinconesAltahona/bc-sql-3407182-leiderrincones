# 🧾 Proyecto Semana 06 — Funciones de Agregación

## 📌 Descripción

Este proyecto corresponde a la **Semana 06** del bootcamp de Bases de Datos Relacionales.

En esta semana se trabajó el uso de funciones de agregación en SQL para generar reportes y resúmenes de información dentro del dominio de una **Notaría**.

El objetivo principal fue:

* Utilizar funciones de agregación
* Realizar agrupaciones con `GROUP BY`
* Filtrar grupos usando `HAVING`
* Generar reportes con datos resumidos
* Aplicar filtros usando `WHERE`

---

# 🏛️ Dominio: Notaría

La base de datos representa un sistema básico de gestión notarial.

Se trabajó con información relacionada a:

* Clientes
* Documentos notariales
* Tarifas
* Trámites
* Notarios

---

# 📂 Entidades utilizadas

## 👤 clients

Representa los clientes registrados en la notaría.

---

## 📄 documents

Representa los documentos y trámites notariales.

Ejemplos:

* Contratos
* Escrituras
* Testamentos
* Poderes

---

## 💰 fees

Representa las tarifas y pagos realizados por los clientes.

---

## 🧑‍⚖️ notaries

Representa los notarios encargados de los trámites.

---

# 🧱 Funciones de agregación utilizadas

Durante el desarrollo se utilizaron:

| Función | Descripción             |
| ------- | ----------------------- |
| COUNT() | Cuenta registros        |
| SUM()   | Suma valores            |
| AVG()   | Calcula promedios       |
| MIN()   | Obtiene el valor mínimo |
| MAX()   | Obtiene el valor máximo |

---

# 🔍 Consultas realizadas

## 📌 Contar total de clientes

```sql
SELECT COUNT(*) AS total_clientes
FROM clients;
```

---

## 📌 Calcular total y promedio de tarifas

```sql
SELECT
    SUM(amount) AS total_recaudado,
    AVG(amount) AS promedio_tarifas
FROM fees;
```

---

## 📌 Obtener tarifa mínima y máxima

```sql
SELECT
    MIN(amount) AS tarifa_minima,
    MAX(amount) AS tarifa_maxima
FROM fees;
```

---

## 📌 Agrupar documentos por tipo

```sql
SELECT
    document_type,
    COUNT(*) AS total_documentos
FROM documents
GROUP BY document_type;
```

---

## 📌 Filtrar grupos con HAVING

```sql
SELECT
    notary_id,
    COUNT(*) AS total_tramites
FROM fees
GROUP BY notary_id
HAVING COUNT(*) > 3;
```

---

# 📊 Uso de GROUP BY y HAVING

## 🔹 GROUP BY

Permite agrupar registros para generar subtotales y reportes.

Ejemplo:

```sql
SELECT
    department_id,
    COUNT(*) AS total
FROM employees
GROUP BY department_id;
```

---

## 🔹 HAVING

Permite filtrar resultados después de agrupar.

Ejemplo:

```sql
SELECT
    department_id,
    COUNT(*) AS total
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;
```

---

# 📥 Datos de prueba

Se insertaron más de:

* ✅ 30 registros principales
* ✅ Datos distribuidos entre múltiples grupos
* ✅ Información relacionada al dominio de notaría

Esto permitió practicar correctamente:

* Agregaciones
* Agrupaciones
* Filtros de grupos

---

# ▶️ Cómo ejecutar el proyecto

## 🔹 Paso 1 — Abrir la terminal

Abrir:

* Git Bash
* CMD
* Terminal integrada de VS Code

---

## 🔹 Paso 2 — Ir a la carpeta del proyecto

```bash
cd ~/Downloads/SENA\ 3407182/starter
```

📌 Nota:
El símbolo `\` se usa porque la carpeta contiene espacios.

---

## 🔹 Paso 3 — Verificar los archivos

```bash
ls
```

Debe aparecer:

```bash
setup.sql
ejercicio.sql
proyecto.sql
README.md
```

---

## 🔹 Paso 4 — Ejecutar setup.sql

```bash
sqlite3 notaria.db < setup.sql
```

📌 Este comando:

* Crea las tablas
* Inserta los datos
* Prepara la base de datos

---

## 🔹 Paso 5 — Ejecutar ejercicios

```bash
sqlite3 notaria.db < ejercicio.sql
```

---

## 🔹 Paso 6 — Ejecutar proyecto semanal

```bash
sqlite3 notaria.db < proyecto.sql
```

---

## 🔹 Paso 7 — Abrir la base de datos

```bash
sqlite3 notaria.db
```

---

## 🔹 Paso 8 — Verificar tablas

```sql
.tables
```

---

## 🔹 Paso 9 — Verificar datos

```sql
SELECT * FROM clients;
```

```sql
SELECT * FROM documents;
```

```sql
SELECT * FROM fees;
```

---

# 🛠️ Tecnologías utilizadas

* SQLite3
* SQL
* Git
* GitHub
* VS Code

---

# 👨‍💻 Autor

Proyecto realizado para práctica académica del programa ADSO — SENA.
