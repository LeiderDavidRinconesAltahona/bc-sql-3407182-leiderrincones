# 🔗 Proyecto Semana 09 — JOINs: INNER JOIN y LEFT JOIN

## 📌 Descripción

Este proyecto corresponde a la **Semana 09** del bootcamp de Bases de Datos Relacionales.

Se trabajó sobre el dominio de una **Notaría**, utilizando las tablas creadas en semanas anteriores para representar documentos, clientes y sus relaciones.

El objetivo principal fue aprender a combinar información de múltiples tablas mediante el uso de **INNER JOIN** y **LEFT JOIN**, permitiendo consultar datos relacionados y detectar registros sin asociación.

---

## 🎯 Objetivos

* Aplicar consultas con **INNER JOIN**.
* Aplicar consultas con **LEFT JOIN**.
* Utilizar aliases de tablas para mejorar la legibilidad.
* Construir consultas con múltiples tablas relacionadas.
* Detectar registros huérfanos mediante `IS NULL`.
* Utilizar funciones de agregación junto con JOINs.

---

## 🏛️ Dominio: Notaría

La base de datos modela una notaría donde:

* Los **documentos** representan trámites notariales.
* Los **clientes** son las personas que solicitan dichos trámites.
* La tabla **relations** relaciona documentos y clientes.

---

## 🗂️ Estructura de la Base de Datos

### Tabla: items

Almacena los documentos notariales.

Campos principales:

* id
* name
* type
* status
* code
* is_active

---

### Tabla: entities

Almacena la información de los clientes.

Campos principales:

* id
* name
* email
* phone
* created_at

---

### Tabla: relations

Relaciona documentos y clientes mediante claves foráneas.

Campos principales:

* id
* item_id
* entity_id

---

## 📚 Conceptos Aplicados

### INNER JOIN

Permite obtener únicamente los registros que tienen coincidencia en ambas tablas.

Ejemplo:

```sql
SELECT
    i.name AS documento,
    e.name AS cliente
FROM relations r
INNER JOIN items i
    ON r.item_id = i.id
INNER JOIN entities e
    ON r.entity_id = e.id;
```

---

### LEFT JOIN

Permite conservar todos los registros de la tabla izquierda, incluso cuando no existe una relación asociada.

Ejemplo:

```sql
SELECT
    e.name AS cliente,
    i.name AS documento
FROM entities e
LEFT JOIN relations r
    ON e.id = r.entity_id
LEFT JOIN items i
    ON r.item_id = i.id;
```

---

### Registros Huérfanos

Permite identificar clientes o documentos sin relación.

Ejemplo:

```sql
SELECT
    e.name
FROM entities e
LEFT JOIN relations r
    ON e.id = r.entity_id
WHERE r.id IS NULL;
```

---

## 📂 Archivos del Proyecto

```text
starter/
│
├── setup.sql
├── ejercicio01.sql
├── ejercicio02.sql
├── proyecto.sql
└── README.md
```

### setup.sql

Contiene:

* Creación de tablas.
* Restricciones y claves foráneas.
* Inserción de datos de prueba.

### ejercicio01.sql

Prácticas de:

* INNER JOIN básico.
* JOIN entre tres tablas.
* Consultas con filtros.

### ejercicio02.sql

Prácticas de:

* LEFT JOIN.
* Detección de registros huérfanos.
* Uso de IS NULL.

### proyecto.sql

Consultas integrales aplicando:

* INNER JOIN.
* LEFT JOIN.
* COUNT().
* GROUP BY.
* ORDER BY.

---

## ▶️ Ejecución

Abrir SQLite:

```bash
sqlite3 notaria.db
```

Cargar la estructura:

```sql
.read setup.sql
```

Ejecutar ejercicios:

```sql
.read ejercicio01.sql
.read ejercicio02.sql
```

Ejecutar proyecto:

```sql
.read proyecto.sql
```

---

## 🛠️ Tecnologías Utilizadas

* SQLite 3
* SQL
* Git
* GitHub

---

## 📖 Habilidades Desarrolladas

* Relaciones entre tablas.
* Uso de claves foráneas.
* INNER JOIN.
* LEFT JOIN.
* Consultas multi-tabla.
* Detección de registros huérfanos.
* Agregaciones con COUNT().
* Organización de bases de datos relacionales.

---

## 👨‍💻 Autor

**Leider David Rincones Altahona**

Bootcamp Bases de Datos Relacionales

**Semana 09 — JOINs: INNER JOIN y LEFT JOIN**
