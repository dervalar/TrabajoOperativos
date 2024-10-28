Script de Automatización de Tareas en Bash

- Descripción -

Este proyecto consiste en un script en Bash que automatiza tareas comunes de mantenimiento en sistemas operativos Linux. Las funcionalidades principales del script incluyen:
1. Respaldo de directorios: Comprime y guarda un respaldo del directorio del usuario, gestionando la eliminación de backups antiguos.
2. Generación de informes del sistema: Crea un archivo log con el uso actual de CPU, memoria y disco.
3. Gestión de usuarios: Permite la creación de nuevos usuarios y configura permisos básicos en sus directorios personales.

El script incluye un menú interactivo para facilitar su uso y está diseñado para realizar cada tarea de forma simple y eficiente.

- Requisitos -

- Entorno Linux o WSL (Windows Subsystem for Linux).
- Permisos de `sudo` para la creación de usuarios.
- Herramientas necesarias: `tar`, `top`, `free`, `df`, y `useradd`.

- Instrucciones de Uso -

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/dervalar/TrabajoOperativos.git
2. Accede al directorio del proyecto:
  `cd nombre-del-repositorio`
3. Asegúrate de que el script tenga permisos de ejecución:
  `chmod +x script.sh`
4. Ejecuta el script:
   `./script.sh`

- Ejemplo de Uso -
Al ejecutar el script, verás un menú con opciones numeradas:

`Menú Principal:`
`1) Respaldo de directorio`
`2) Generar informe de uso del sistema`
`3) Gestión de usuarios`
`4) Salir`

Opción de respaldo de directorio: Comprime un directorio y mantiene un máximo de 5 archivos de respaldo, eliminando los más antiguos.
Generación de informe de sistema: Guarda el uso actual de CPU, memoria y disco en un archivo de log.
Gestión de usuarios: Solicita el nombre de un nuevo usuario y lo crea en el sistema.

- Colaboración -

Las contribuciones son bienvenidas. Puedes colaborar de las siguientes maneras:

Reportando problemas (issues) y errores.
Proponiendo mejoras o nuevas funcionalidades mediante pull requests.
Compartiendo sugerencias para optimizar el código o agregar nuevas funciones.
Para colaborar, sigue estos pasos:

Realiza un fork de este repositorio.
Crea una nueva rama `(git checkout -b nombre-de-tu-rama)`.
Realiza tus cambios y haz un commit `(git commit -m 'Añadir nueva funcionalidad')`.
Sube tus cambios `(git push origin nombre-de-tu-rama)`.
Abre un pull request y describe los cambios.

- Licencia -

Este proyecto se distribuye bajo la licencia MIT. Consulta el archivo LICENSE para obtener más detalles.









