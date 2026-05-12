# 🧾 Proyecto Semana 02 — DDL de tu Dominio

## 📌 Descripción

Este proyecto corresponde a la **Semana 02** del bootcamp de Bases de Datos Relacionales.

En esta semana se trabajó el diseño del esquema de base de datos utilizando sentencias DDL (*Data Definition Language*).

El dominio escogido fue una **Notaría**, modelando entidades relacionadas con documentos notariales, clientes y relaciones entre ellos.

---

# 🎯 Objetivos de la semana

* Crear tablas utilizando `CREATE TABLE`
* Definir tipos de datos apropiados
* Aplicar constraints:

  * `NOT NULL`
  * `DEFAULT`
  * `UNIQUE`
  * `CHECK`
* Implementar relaciones con `FOREIGN KEY`
* Crear scripts idempotentes con `IF NOT EXISTS`
* Insertar datos de prueba realistas

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

---

### 👤 entities

Representa los clientes de la notaría.

---

### 🔗 relations

Tabla de relación entre documentos y clientes.

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

# 📥 Datos de prueba

Se insertaron:

* ✅ 15 registros en `items`
* ✅ 5 registros en `entities`
* ✅ 5 registros en `relations`

Todos los datos están relacionados con el dominio de notaría.

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
* Aplica los constraints
* Crea las relaciones

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

## 🔹 Paso 7 — Verificar la estructura de las tablas

```sql
PRAGMA table_info(items);
```

```sql
PRAGMA table_info(entities);
```

```sql
PRAGMA table_info(relations);
```

---

## 🔹 Paso 8 — Verificar los datos

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
