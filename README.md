# Haskell_Proyectos_Tareas


# Sistema de Gestión de Proyectos

## Descripción
Este es un sistema de gestión de proyectos escrito en Haskell que permite administrar proyectos, empleados y tareas asociadas. Proporciona funciones para crear, asignar y completar tareas, así como gestionar la información de los empleados y proyectos.

## Características
- Creación de proyectos con fecha de inicio y fin.
- Registro de empleados.
- Creación y asignación de tareas a empleados.
- Marcado de tareas como completadas.
- Eliminación de tareas y proyectos.
- Conteo de tareas completadas y pendientes.
- Interfaz interactiva basada en consola.

## Instalación y Ejecución
### Prerrequisitos
Para ejecutar este proyecto, necesitas tener instalado GHC (Glasgow Haskell Compiler) y Stack (opcional) en tu sistema.

### Clonar el repositorio
```sh
 git clone <URL_DEL_REPOSITORIO>
 cd <NOMBRE_DEL_PROYECTO>
```

### Compilar y ejecutar
Si usas GHC:
```sh
ghc -o proyecto Main.hs
./proyecto
```
Si usas Stack:
```sh
stack run
```

## Funciones Disponibles

### Creación
- `crearProyecto`  
- `crearEmpleado`  

### Búsqueda
- `buscarEmpleado`  
- `buscarProyecto`  

### Gestión de Proyectos y Empleados
- `agregarProyecto`  
- `agregarEmpleado`  

### Gestión de Tareas
- `agregarTarea`  
- `asignarTarea`  
- `marcarCompletada`  

### Visualización
- `verProyectos`  
- `verEmpleados`  
- `verEmpleado`  
- `verTarea`  
- `verProyecto`  
- `verTareas`  

### Estadísticas y Eliminación
- `contarTareas`  
- `eliminarProyecto`  
- `eliminarTarea` 

El usuario puede interactuar con el menú ingresando el número de la opción deseada.

## Estructura del Código
El código está estructurado de la siguiente manera:
- **Tipos de datos**: Se definen los tipos `Empleado`, `Tarea` y `Proyecto`.
- **Funciones de manipulación**:
  - Creación de empleados y proyectos.
  - Búsqueda y filtrado de proyectos y empleados.
  - Asignación y actualización de tareas.
- **Interfaz interactiva**: `menuLoop` gestiona la interacción con el usuario mediante la consola.

## Contribuciones
 # Pacheco Infanzon Daniel 
 # Santos Venegas Victor Adrian

