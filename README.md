# 🧾 Proyecto Semana 04 — Consultas SELECT

## 📌 Descripción

Este proyecto corresponde a la **Semana 04** del bootcamp de Bases de Datos Relacionales.

En esta semana se trabajó el uso de consultas SQL utilizando sentencias `SELECT` para recuperar información desde la base de datos.

El dominio escogido fue una **Notaría**, modelando consultas relacionadas con documentos notariales, clientes y relaciones entre ellos.

Durante el desarrollo se implementaron consultas utilizando:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `OFFSET`
* Alias descriptivos

---

# 🎯 Objetivos de la semana

* Seleccionar columnas específicas usando `SELECT`
* Aplicar alias descriptivos en español
* Filtrar información utilizando `WHERE`
* Ordenar resultados con `ORDER BY`
* Implementar paginación con `LIMIT` y `OFFSET`
* Consultar información real del dominio asignado

---

# 🏛️ Dominio: Notaría

La base de datos representa un sistema básico de gestión notarial.

## 📂 Entidades utilizadas

### 📄 items

Representa los documentos notariales.

Ejemplos:

* Contratos
* Escrituras
* Poderes
* Testamentos
* Declaraciones
* Permisos

---

### 👤 entities

Representa los clientes registrados en la notaría.

---

### 🔗 relations

Tabla encargada de relacionar documentos con clientes.

---

# 🧱 Estructura de la Base de Datos

## 📄 Tabla: items

| Columna   | Tipo    | Restricción     |
| --------- | ------- | --------------- |
| id        | INTEGER | PRIMARY KEY     |
| name      | TEXT    | NOT NULL        |
| type      | TEXT    | NOT NULL        |
| status    | TEXT    | DEFAULT + CHECK |
| code      | TEXT    | UNIQUE          |
| is_active | INTEGER | DEFAULT 1       |

---

## 👤 Tabla: entities

| Columna    | Tipo    | Restricción               |
| ---------- | ------- | ------------------------- |
| id         | INTEGER | PRIMARY KEY               |
| name       | TEXT    | NOT NULL                  |
| email      | TEXT    | UNIQUE                    |
| phone      | TEXT    | —                         |
| created_at | TEXT    | DEFAULT CURRENT_TIMESTAMP |

---

## 🔗 Tabla: relations

| Columna   | Tipo    | Restricción |
| --------- | ------- | ----------- |
| id        | INTEGER | PRIMARY KEY |
| item_id   | INTEGER | FOREIGN KEY |
| entity_id | INTEGER | FOREIGN KEY |

---

# 🔎 Consultas implementadas

## ✅ SELECT explícito

Se consultaron columnas específicas sin utilizar `SELECT *`.

```sql
SELECT
    id AS id_documento,
    name AS nombre_documento,
    type AS tipo_documento
FROM items;
```

---

## ✅ Alias descriptivos

Se utilizaron alias en español para mejorar la legibilidad.

```sql
name AS nombre_documento
```

---

## ✅ WHERE

Se aplicaron filtros utilizando condiciones.

```sql
SELECT
    name AS documento,
    status AS estado
FROM items
WHERE status = 'pendiente';
```

---

## ✅ WHERE combinado

Se combinaron múltiples condiciones utilizando `AND`.

```sql
SELECT
    name AS documento,
    type AS tipo
FROM items
WHERE type = 'Contrato'
AND status = 'pendiente';
```

---

## ✅ ORDER BY

Se ordenaron resultados según criterios del dominio.

```sql
SELECT
    id AS id_documento,
    name AS nombre_documento
FROM items
ORDER BY name ASC;
```

---

## ✅ LIMIT

Se limitaron resultados para obtener registros específicos.

```sql
LIMIT 5;
```

---

## ✅ OFFSET

Se implementó paginación en múltiples páginas.

```sql
LIMIT 3 OFFSET 3;
```

---

# 📄 Paginación implementada

## 🔹 Página 1

```sql
SELECT
    id AS id_documento,
    name AS nombre_documento
FROM items
ORDER BY name ASC
LIMIT 3 OFFSET 0;
```

---

## 🔹 Página 2

```sql
SELECT
    id AS id_documento,
    name AS nombre_documento
FROM items
ORDER BY name ASC
LIMIT 3 OFFSET 3;
```

---

# ▶️ Cómo ejecutar el proyecto

## 🔹 Paso 1 — Abrir la terminal

Puedes usar:

* Git Bash
* CMD
* Terminal integrada de VS Code

---

## 🔹 Paso 2 — Ir a la carpeta del proyecto

```bash
cd ~/Downloads/SENA\ 3407182/starter
```

📌 Nota:
Se usa `\` porque el nombre de la carpeta contiene espacios.

---

## 🔹 Paso 3 — Verificar que existe el archivo

```bash
ls
```

Debe aparecer:

```bash
proyecto.sql
```

---

## 🔹 Paso 4 — Ejecutar el script SQL

```bash
sqlite3 mi_dominio.db < proyecto.sql
```

📌 Este comando:

* Ejecuta las consultas SQL
* Filtra información
* Ordena resultados
* Muestra datos paginados
* Recupera información del dominio de notaría

---

## 🔹 Paso 5 — Abrir la base de datos

```bash
sqlite3 mi_dominio.db
```

---

## 🔹 Paso 6 — Verificar las tablas existentes

```sql
.tables
```

Debe aparecer:

```bash
entities
items
relations
```

---

## 🔹 Paso 7 — Ejecutar consultas manualmente

```sql
SELECT * FROM items;
```

```sql
SELECT * FROM entities;
```

```sql
SELECT * FROM relations;
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

Desarrollado por:

* Leider Rincones
