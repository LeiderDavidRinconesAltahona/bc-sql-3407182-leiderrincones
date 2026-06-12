# 🧾 Proyecto Semana 07 — NULL y Constraints

## 📌 Descripción

Este proyecto corresponde a la **Semana 07** del bootcamp de Bases de Datos Relacionales.

En esta semana se trabajó el manejo de valores **NULL** y la implementación de **constraints** para garantizar la integridad de los datos dentro de una base de datos.

El dominio escogido sigue siendo una **Notaría**, donde se administran documentos notariales, clientes y las relaciones entre ambos.

El objetivo principal fue:

* Comprender el significado de NULL como valor desconocido.
* Utilizar consultas con `IS NULL` e `IS NOT NULL`.
* Reemplazar valores nulos mediante `COALESCE`.
* Transformar valores utilizando `NULLIF`.
* Aplicar restricciones de integridad mediante:

  * `NOT NULL`
  * `UNIQUE`
  * `CHECK`
  * `PRIMARY KEY`
  * `FOREIGN KEY`
* Activar la validación de claves foráneas con `PRAGMA foreign_keys = ON`.

---

## 🏛️ Dominio: Notaría

La base de datos modela un sistema básico de gestión notarial donde:

* Los **documentos** representan trámites y servicios notariales.
* Los **clientes** representan las personas que solicitan dichos trámites.
* Las **relaciones** permiten asociar documentos con clientes.

---

## 🗂️ Estructura del Proyecto

```text
starter/
│
├── setup.sql
├── ejercicio.sql
├── proyecto.sql
└── README.md
```

### 📄 setup.sql

Contiene la configuración inicial de la base de datos.

### 📄 ejercicio.sql

Incluye las consultas y ejercicios prácticos de la semana relacionados con NULL y Constraints.

### 📄 proyecto.sql

Implementación completa del proyecto semanal adaptado al dominio de Notaría.

### 📄 README.md

Documentación general del proyecto.

---

## 🏗️ Tablas Implementadas

### 📑 items (Documentos)

Almacena los documentos y trámites notariales.

Campos principales:

* id
* name
* type
* status
* code
* is_active

Restricciones aplicadas:

* PRIMARY KEY
* NOT NULL
* UNIQUE
* CHECK
* DEFAULT

---

### 👤 entities (Clientes)

Almacena la información de los clientes.

Campos principales:

* id
* name
* email
* phone
* created_at

Restricciones aplicadas:

* PRIMARY KEY
* NOT NULL
* UNIQUE
* DEFAULT

---

### 🔗 relations (Relación Documento - Cliente)

Permite asociar documentos con clientes.

Campos principales:

* id
* item_id
* entity_id

Restricciones aplicadas:

* PRIMARY KEY
* FOREIGN KEY
* NOT NULL

---

## 🔒 Constraints Utilizados

### PRIMARY KEY

Garantiza la identificación única de cada registro.

```sql
id INTEGER PRIMARY KEY
```

### NOT NULL

Impide almacenar valores vacíos en campos obligatorios.

```sql
name TEXT NOT NULL
```

### UNIQUE

Evita la duplicación de valores.

```sql
email TEXT UNIQUE
```

### CHECK

Valida reglas de negocio.

```sql
CHECK (status IN ('pendiente','completado','cancelado'))
```

### FOREIGN KEY

Mantiene la integridad referencial entre tablas.

```sql
FOREIGN KEY (item_id)
REFERENCES items(id)
```

---

## ⚠️ Manejo de NULL

Se agregaron registros con valores NULL para realizar pruebas y consultas.

Ejemplo:

```sql
INSERT INTO entities (id, name, email, phone)
VALUES
(2, 'Maria Gomez', NULL, '3012345678');
```

---

## 🔍 Consultas Implementadas

### IS NULL

Buscar clientes sin correo registrado.

```sql
SELECT *
FROM entities
WHERE email IS NULL;
```

### IS NOT NULL

Buscar clientes con teléfono registrado.

```sql
SELECT *
FROM entities
WHERE phone IS NOT NULL;
```

### COALESCE

Mostrar un valor alternativo cuando exista NULL.

```sql
SELECT
    name,
    COALESCE(email, 'Sin correo registrado')
FROM entities;
```

### NULLIF

Convertir valores específicos en NULL.

```sql
SELECT
    name,
    NULLIF(phone, '')
FROM entities;
```

---

## 📊 Datos de Prueba

El proyecto incluye:

* 30 documentos notariales.
* 5 clientes.
* Relaciones entre documentos y clientes.
* Registros con valores NULL para pruebas.

---

## ▶️ Cómo Ejecutar el Proyecto

### 1. Crear la base de datos

```bash
sqlite3 notaria.db
```

### 2. Ejecutar el script

```sql
.read proyecto.sql
```

### 3. Verificar las tablas

```sql
.tables
```

### 4. Consultar los datos

```sql
SELECT * FROM items;
SELECT * FROM entities;
SELECT * FROM relations;
```

---

## ✅ Requisitos Cumplidos

* NOT NULL
* UNIQUE
* CHECK
* PRIMARY KEY
* FOREIGN KEY
* PRAGMA foreign_keys = ON
* IS NULL
* IS NOT NULL
* COALESCE
* NULLIF
* Registros con valores NULL
* Integridad referencial entre tablas

---

## 🎯 Resultado

Se logró fortalecer el modelo de datos de la Notaría mediante restricciones de integridad y manejo adecuado de valores NULL, garantizando una base de datos más consistente, segura y preparada para futuras ampliaciones.
