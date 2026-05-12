# 🧾 Proyecto Semana 03 — DML de tu Dominio

## 📌 Descripción

Este proyecto corresponde a la **Semana 03** del bootcamp de Bases de Datos Relacionales.

En esta semana se trabajó la manipulación de datos utilizando sentencias DML (*Data Manipulation Language*).

El dominio escogido fue una **Notaría**, modelando entidades relacionadas con documentos notariales, clientes y relaciones entre ellos.

Durante el desarrollo se implementaron operaciones de:

* `INSERT INTO`
* `UPDATE`
* `DELETE`
* Verificación de datos mediante `SELECT`

---

# 🎯 Objetivos de la semana

* Insertar datos en múltiples tablas
* Mantener integridad referencial con `FOREIGN KEY`
* Actualizar registros utilizando `UPDATE`
* Eliminar registros de forma segura con `DELETE`
* Aplicar filtros con `WHERE`
* Manipular datos reales dentro del dominio asignado

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
* Permisos
* Declaraciones

---

### 👤 entities

Representa los clientes registrados en la notaría.

---

### 🔗 relations

Tabla intermedia encargada de relacionar documentos con clientes.

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

# 📥 Datos insertados

Se insertaron:

* ✅ 15 registros en `items`
* ✅ 5 registros en `entities`
* ✅ 5 registros en `relations`

Todos los datos están relacionados con el dominio de notaría.

---

# ✏️ Operaciones DML implementadas

## ✅ INSERT INTO

Se insertaron múltiples registros en las tablas principales y secundarias.

```sql
INSERT INTO items (id, name, type, status, code)
VALUES (...);
```

---

## ✅ UPDATE

Se actualizaron registros específicos utilizando condiciones seguras con `WHERE`.

```sql
UPDATE items
SET status = 'completado'
WHERE id = 2;
```

---

## ✅ UPDATE múltiple

Se actualizaron múltiples columnas en una misma consulta.

```sql
UPDATE entities
SET name = 'Maria Fernanda Gomez',
    phone = '3119998888'
WHERE id = 2;
```

---

## ✅ UPDATE condicional

Se modificaron múltiples filas usando condiciones de negocio.

```sql
UPDATE items
SET is_active = 0
WHERE status = 'cancelado';
```

---

## ✅ DELETE seguro

Antes de eliminar registros se verificaron los datos afectados.

```sql
SELECT id, name
FROM items
WHERE id = 13;
```

```sql
DELETE FROM items
WHERE id = 13;
```

---

# 🔐 Constraints utilizados

## ✅ NOT NULL

Evita valores vacíos en columnas importantes.

```sql
name TEXT NOT NULL
```

---

## ✅ DEFAULT

Asigna valores automáticos.

```sql
is_active INTEGER DEFAULT 1
```

---

## ✅ UNIQUE

Evita valores repetidos.

```sql
code TEXT UNIQUE
```

---

## ✅ CHECK

Valida valores permitidos.

```sql
CHECK (status IN ('pendiente','completado','cancelado'))
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

* Crea la base de datos
* Ejecuta las tablas
* Inserta los datos
* Ejecuta los UPDATE
* Ejecuta los DELETE
* Verifica la información final

---

## 🔹 Paso 5 — Abrir la base de datos

```bash
sqlite3 mi_dominio.db
```

---

## 🔹 Paso 6 — Verificar las tablas creadas

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

## 🔹 Paso 7 — Verificar los datos

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
