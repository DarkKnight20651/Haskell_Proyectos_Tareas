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

Para mantener una buena practica, despues de seleccionar una opcion dentro del menu, se muestra lo que sea de interes, ya sean proyectos existentes, empleados, tarea asi como su estatus para que al solicitarle el dato al usuario del sistema, pueda hacer una seleccion segura, en caso de elegir un elemento inexistente del sistema se muestra la leyenda que no existe
# Pruebas 
  Seleccionar una opcion no valida <br>
  ![Imagen de WhatsApp 2025-04-02 a las 21 03 54_55912e87](https://github.com/user-attachments/assets/8ac10cdf-02a8-4d98-85cd-1b8cc0df51eb)
<br><br>
Buscar un proyecto no existente <br>
 ![Imagen de WhatsApp 2025-04-02 a las 21 04 20_82d76248](https://github.com/user-attachments/assets/8751e240-c9e0-4685-8f2f-cb523b7a9b4b)
<br><br>
Crear una tarea <br>
![Imagen de WhatsApp 2025-04-02 a las 21 08 47_69df3750](https://github.com/user-attachments/assets/c1aef9df-3f64-4e0e-a67f-18cbfc761aa3)
<br><br>
Eliminar una tarea no encontrada<br>
![Imagen de WhatsApp 2025-04-02 a las 21 07 03_d07042f4](https://github.com/user-attachments/assets/4cd69799-cf44-4774-9997-3480c281f55f)
<br><br>
Asignar una Tarea <br>
![Imagen de WhatsApp 2025-04-02 a las 21 05 45_02c6e530](https://github.com/user-attachments/assets/a042cf72-d957-462b-b184-66ebee05f38e)
<br><br>






## Contribuciones
 # Pacheco Infanzon Daniel 
 # Santos Venegas Victor Adrian

