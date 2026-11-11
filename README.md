# Menu de Sistema

## Descripcion

Script en Bash con un menu interactivo que automatiza cuatro tareas de
administracion de un sistema Linux (probado en Raspberry Pi OS):

1. Informe de CPU, memoria y disco guardado en un archivo log.
2. Control del espacio en disco con alerta si se supera un umbral.
3. Limpieza de archivos temporales y cache de navegadores.
4. Busqueda de archivos grandes en una carpeta.

Trabajo final de Sistemas Operativos - Instituto Superior IDRA,
Tecnicatura Superior en Desarrollo de Software.

## Requisitos

- Linux con Bash
- Comandos `uptime`, `free`, `df`, `find`, `tail` y `tr` (vienen instalados por defecto)
- Permiso de escritura en la carpeta personal (el log se guarda en `~/sistemas.log`)

## Uso

1. Clonar este repositorio:
   `git clone https://github.com/micaelavillalba551-svg/menu-sistema-bash.git`

2. Dar permisos de ejecucion al script:
   `chmod +x sistemas.sh`

3. Ejecutar el script:
   `./sistemas.sh`

4. Elegir una opcion del menu:

| Opcion | Que hace |
|--------|----------|
| 1 | Guarda fecha, CPU, memoria y disco en `~/sistemas.log` |
| 2 | Muestra el porcentaje de disco usado y avisa si supera el umbral |
| 3 | Borra los `.tmp` de `/tmp` y la cache de Firefox y Chrome |
| 4 | Pregunta una carpeta y guarda en el log los archivos de mas de 50 MB |
| 5 | Sale del programa |

### Ejemplo

```
=== MENU ===
1. Informe del uso cpu memoria y disco
2. Controlar espacio en disco
3. Limpiar temporales y cache p/ liberar espacio
4. Detectar archivos grandes
5. Salir
Elegi una opcion:
2
El disco esta usado al 37 por ciento
El disco esta optimo
```

### Configuracion

Al principio de `sistemas.sh` se pueden cambiar estas variables:

- `LOG`: ruta del archivo log
- `UMBRAL`: porcentaje de disco que dispara la alerta (por defecto 80)
- `TAMANO`: tamano minimo en MB para la busqueda de archivos grandes (por defecto 50)

## Archivos de apoyo

- `sistemas.log`: log de ejemplo generado por el script (informes, limpiezas
  y archivos grandes). El script lo crea solo en la carpeta personal la
  primera vez que se usa.
- `capturas/`: capturas de pantalla de las pruebas.
- `MEMORIA_TECNICA.md`: documentacion tecnica del proyecto.

## Contribuciones

Si queres colaborar:

1. Hace un fork del repositorio.
2. Crea una rama para tu cambio: `git checkout -b mi-mejora`
3. Hace tus cambios y un commit: `git commit -m "Describe tu cambio"`
4. Subi la rama y abri un pull request, o abri un issue con tu sugerencia.

## Licencia

Distribuido bajo la Licencia MIT.

## Autoras

- Micaela Villalba
- Antonella Dubar
