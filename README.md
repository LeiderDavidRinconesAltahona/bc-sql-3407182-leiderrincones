# 🧾 Proyecto Semana 01 — Conoce tu Dominio

## 📌 Descripción

Este proyecto corresponde a la **Semana 01** del bootcamp de Bases de Datos Relacionales.

El dominio escogido fue una **Notaría**, donde se modelaron entidades básicas relacionadas con documentos notariales y clientes.

El objetivo principal fue:

* Crear tablas principales
* Insertar datos de prueba
* Realizar consultas `SELECT` básicas
* Comprender la estructura inicial de una base de datos relacional

---

# 🏛️ Dominio: Notaría

La base de datos representa un sistema simple de gestión notarial.

## 📂 Entidades utilizadas

### 📄 items

Representa los documentos notariales.

Ejemplos:

* Contratos
* Escrituras
* Poderes
* Testamentos

### 👤 entities

Representa los clientes de la notaría.

---

# 🧱 Estructura de Tablas

## 📄 Tabla: items

| Columna | Tipo    |
| ------- | ------- |
| id      | INTEGER |
| name    | TEXT    |
| type    | TEXT    |
| date    | TEXT    |

---

## 👤 Tabla: entities

| Columna | Tipo    |
| ------- | ------- |
| id      | INTEGER |
| name    | TEXT    |
| email   | TEXT    |
| phone   | TEXT    |

---

# 📥 Datos de prueba

Se insertaron:

* ✅ 15 registros en `items`
* ✅ 5 registros en `entities`

Con información relacionada al dominio de notaría.

---

# 🔍 Consultas realizadas

## 📌 Mostrar todos los documentos

```sql
SELECT * FROM items;
```

---

## 📌 Mostrar nombres ordenados alfabéticamente

```sql
SELECT name
FROM items
ORDER BY name ASC;
```

---

## 📌 Contar documentos registrados

```sql
SELECT COUNT(*) AS total_items
FROM items;
```

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
* Ejecuta todas las tablas
* Inserta los datos
* Ejecuta las consultas

---

## 🔹 Paso 5 — Abrir la base de datos

```bash
sqlite3 mi_dominio.db
```

---

## 🔹 Paso 6 — Verificar las tablas

```sql
.tables
```

Debe aparecer:

```bash
entities
items
```

---

## 🔹 Paso 7 — Verificar los datos

```sql
SELECT * FROM items;
```

```sql
SELECT * FROM entities;
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
