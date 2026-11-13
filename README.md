# Enviar-tarea

[![PHP](https://img.shields.io/badge/PHP-7.4%2B-777BB4?logo=php&logoColor=white)](https://www.php.net/)
[![MySQL](https://img.shields.io/badge/MySQL-MariaDB-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![MIT](https://img.shields.io/badge/Licencia-MIT-green)](LICENSE)

[Español](#español) · [English](#english)

---

## Español

### Índice

- [Descripción](#descripción)
- [Características](#características)
- [Base de datos](#base-de-datos)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Uso](#uso)
- [Seguridad](#seguridad)
- [Licencia](#licencia)

### Descripción

**Enviar-tarea** es una aplicación web sencilla en **HTML y PHP** para registrar entregas de tareas y consultar su estado desde una base de datos **MySQL/MariaDB**. El formulario envía los datos a un script PHP que los inserta en la tabla `tareas`.

### Características

- **Formulario web** con usuario, cargo, estado, fechas, descripción y tareas relacionadas.
- **Persistencia en MySQL** mediante `mysqli`.
- **Seguimiento del estado** de cada entrega (0–100 %).
- **Tareas padre y tipos** para clasificar las entregas.
- **Sin dependencias externas**: solo PHP y un servidor de base de datos.

### Base de datos

El script `basededatos/tareas_db.sql` crea la base `tareas_db` con las tablas `tareas`, `tareas_padre` y la relación de tipos. Campos principales de `tareas`:

| Campo | Tipo | Para qué |
|---|---|---|
| `usuario_id` | `int` | Autor de la entrega |
| `estado` | `int` (0–100) | Porcentaje de avance |
| `fecha_inicio` / `fecha_fin` | `date` | Ventana de la tarea |
| `dentro_tiempo` | `enum('Si','No')` | Entrega en plazo |
| `descripcion` | `text` | Detalle |

### Estructura del proyecto

```text
Enviar-tarea/
├── proyecto/
│   ├── index.html              # Formulario de entrega
│   └── formulario_entrega.php  # Conexión, validación e inserción
├── basededatos/tareas_db.sql   # Esquema y datos de ejemplo
├── LICENSE
└── README.md
```

### Requisitos

- **PHP 7.4 o superior** con la extensión `mysqli`.
- **MySQL 5.7+ o MariaDB 10.3+**.
- Apache, Nginx o el servidor integrado de PHP.
- Navegador moderno.

### Instalación

1. Clona el repositorio:
   ```bash
   git clone https://github.com/alberto2005-coder/Enviar-tarea.git
   cd Enviar-tarea
   ```
2. Importa la base de datos:
   ```bash
   mysql -u root -p < basededatos/tareas_db.sql
   ```
3. Ajusta las credenciales en `proyecto/formulario_entrega.php`. La conexión actual usa `127.0.0.1`, usuario `root`, contraseña `password` y puerto `3306`.
4. Sirve la carpeta:
   ```bash
   php -S localhost:8000 -t proyecto
   ```
5. Abre <http://localhost:8000>.

### Uso

Rellena el formulario y envíalo: la tarea se inserta en `tareas_db` y el estado queda registrado. Para consultar las entregas puedes usar phpMyAdmin, la consola de MySQL o ampliar el proyecto con una vista de listado.

### Seguridad

Es un **ejemplo didáctico**, no una aplicación lista para producción:

- Las credenciales de la base de datos están escritas en el PHP. Muévelas a variables de entorno o a un archivo de configuración fuera del repositorio.
- No hay autenticación ni control de acceso: cualquiera que llegue al formulario puede insertar registros.
- Revisa y parametriza las consultas antes de exponerlo a Internet; no confíes en los datos del formulario.
- Sirve la aplicación por HTTPS y no publiques el puerto de MySQL.

### Licencia

**MIT** — consulta [LICENSE](LICENSE).

---

## English

### Table of contents

- [Overview](#overview)
- [Features](#features)
- [Database](#database)
- [Project structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Security](#security)
- [License](#license)

### Overview

**Enviar-tarea** is a small **HTML + PHP** web app to record task submissions and check their status in a **MySQL/MariaDB** database. The form posts to a PHP script that inserts the record into the `tareas` table.

### Features

- **Web form** with user, role, status, dates, description and related tasks.
- **MySQL persistence** through `mysqli`.
- **Status tracking** for each submission (0–100 %).
- **Parent tasks and task types** to classify submissions.
- **No external dependencies**: just PHP and a database server.

### Database

`basededatos/tareas_db.sql` creates the `tareas_db` database with the `tareas`, `tareas_padre` and task-type tables. Key `tareas` fields:

| Field | Type | Purpose |
|---|---|---|
| `usuario_id` | `int` | Submission author |
| `estado` | `int` (0–100) | Completion percentage |
| `fecha_inicio` / `fecha_fin` | `date` | Task window |
| `dentro_tiempo` | `enum('Si','No')` | Delivered on time |
| `descripcion` | `text` | Details |

### Project structure

```text
Enviar-tarea/
├── proyecto/
│   ├── index.html              # Submission form
│   └── formulario_entrega.php  # Connection, validation and insert
├── basededatos/tareas_db.sql   # Schema and sample data
├── LICENSE
└── README.md
```

### Requirements

- **PHP 7.4 or later** with the `mysqli` extension.
- **MySQL 5.7+ or MariaDB 10.3+**.
- Apache, Nginx or PHP's built-in server.
- A modern browser.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/alberto2005-coder/Enviar-tarea.git
   cd Enviar-tarea
   ```
2. Import the database:
   ```bash
   mysql -u root -p < basededatos/tareas_db.sql
   ```
3. Adjust the credentials in `proyecto/formulario_entrega.php`. The current connection uses `127.0.0.1`, user `root`, password `password` and port `3306`.
4. Serve the folder:
   ```bash
   php -S localhost:8000 -t proyecto
   ```
5. Open <http://localhost:8000>.

### Usage

Fill in the form and submit it: the task is inserted into `tareas_db` and its status is recorded. To browse submissions, use phpMyAdmin, the MySQL shell, or extend the project with a listing view.

### Security

This is a **teaching example**, not a production-ready app:

- Database credentials are hardcoded in the PHP file. Move them to environment variables or a config file outside the repository.
- There is no authentication or access control: anyone who reaches the form can insert records.
- Review and parameterise the queries before exposing it to the Internet; never trust form input.
- Serve it over HTTPS and do not expose the MySQL port.

### License

**MIT** — see [LICENSE](LICENSE).
