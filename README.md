# Enviar-tarea 📋

Un sistema web para gestionar tareas que almacena el estado de cada tarea en una base de datos.

## Descripción

**Enviar-tarea** es una aplicación web desarrollada con HTML, PHP y base de datos que permite a los usuarios crear, enviar y gestionar tareas de forma centralizada. El sistema almacena y actualiza el estado de las tareas en tiempo real, facilitando el seguimiento y la organización del trabajo.

## Características principales

✅ **Interfaz web intuitiva** - Diseño simple y fácil de usar  
✅ **Gestión de tareas** - Crear, editar y eliminar tareas  
✅ **Almacenamiento en BD** - Persistencia de datos en base de datos  
✅ **Seguimiento de estado** - Actualización en tiempo real del estado de tareas  
✅ **PHP backend** - Lógica del servidor robusta y segura  

## Tecnologías utilizadas

- **HTML5** - Estructura del sitio web
- **PHP** - Backend y lógica del servidor
- **Base de datos** - Almacenamiento de información
- **CSS** - Estilos y presentación (incluido en HTML)

## Estructura del proyecto

```
Enviar-tarea/
├── proyecto/          # Archivos principales de la aplicación
├── basededatos/       # Configuración y scripts de la base de datos
├── .gitignore        # Archivos ignorados por Git
└── LICENSE           # Licencia MIT
```

## Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/alberto2005-coder/Enviar-tarea.git
   cd Enviar-tarea
   ```

2. **Configurar el servidor web**
   - Asegúrate de tener PHP instalado (versión 7.4 o superior)
   - Copia los archivos a tu servidor web (Apache/Nginx)

3. **Configurar la base de datos**
   - Importa los scripts SQL desde la carpeta `basededatos/`
   - Actualiza las credenciales de conexión en la configuración de PHP

4. **Acceder a la aplicación**
   - Abre tu navegador y ve a `http://localhost/Enviar-tarea/proyecto/`

## Uso

1. Accede a la aplicación desde tu navegador
2. Crea una nueva tarea con el formulario
3. Completa los detalles de la tarea
4. Envía la tarea para almacenarla en la base de datos
5. Visualiza y gestiona el estado de tus tareas desde el panel

## Requisitos

- PHP 7.4+
- Servidor web (Apache/Nginx)
- Base de datos (MySQL/MariaDB)
- Navegador web moderno

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE). Puedes usar, modificar y distribuir este código libremente.

## Autor

👤 **alberto2005-coder**

- GitHub: [@alberto2005-coder](https://github.com/alberto2005-coder)

## Contribuciones

Las contribuciones son bienvenidas. Para contribuir:

1. Haz un fork del proyecto
2. Crea una rama para tu característica (`git checkout -b feature/nueva-caracteristica`)
3. Commit tus cambios (`git commit -m 'Agregar nueva característica'`)
4. Push a la rama (`git push origin feature/nueva-caracteristica`)
5. Abre un Pull Request

## Soporte

Si encuentras problemas o tienes preguntas, abre un [Issue](https://github.com/alberto2005-coder/Enviar-tarea/issues) en el repositorio.

---

**Última actualización:** Mayo 2026
