
import Data.List (find)
listaProyectos :: [Proyecto]
listaProyectos = []

listaEmpleados :: [Empleado]
listaEmpleados = []
-- Tipo para representar un Empleado
data Empleado = Empleado {
    empleadoId :: Int,
    nombreEmpleado :: String
} deriving (Show, Eq)

-- Tipo para representar una Tarea
data Tarea = Tarea {
    descripcion :: String,
    fechaLimite :: String,
    prioridad :: Int,
    asignadoA :: Maybe Empleado,
    completada :: Bool
} deriving (Show, Eq)

-- Tipo para representar un Proyecto
data Proyecto = Proyecto {
    nombreProyecto :: String,
    fechaInicio :: String,
    fechaFin :: String,
    tareas :: [Tarea]
} deriving (Show, Eq)

-- Crear un nuevo proyecto
crearProyecto :: String -> String -> String -> Proyecto
crearProyecto nombre inicio fin = Proyecto nombre inicio fin []


crearEmpleado :: [Empleado] -> String -> Empleado
crearEmpleado empleados nombre =
    let nuevoId = if null empleados then 1 else maximum (map empleadoId empleados) + 1
    in Empleado nuevoId nombre


buscarEmpleado :: [Empleado] -> Int -> Maybe Empleado
buscarEmpleado empleados id = find (\empleado -> empleadoId empleado == id) empleados

buscarProyecto :: [Proyecto] -> String -> Maybe Proyecto
buscarProyecto proyectos nombreBuscado =
    find (\proyecto -> nombreProyecto proyecto == nombreBuscado) proyectos 

agregarProyecto :: Proyecto -> [Proyecto] -> [Proyecto]
agregarProyecto nuevoProyecto lista = nuevoProyecto : lista

agregarEmpleado :: Empleado -> [Empleado] -> [Empleado]
agregarEmpleado nuevoEmpleado lista = nuevoEmpleado : lista
-- Agregar una tarea a un proyecto
agregarTarea :: Proyecto -> Tarea -> Proyecto
agregarTarea proyecto tarea = proyecto { tareas = tarea : tareas proyecto }

-- Asignar una tarea a un empleado
asignarTarea :: Proyecto -> String -> Empleado -> Either String Proyecto
asignarTarea proyecto desc emp = 
    case mapearTareas (tareas proyecto) of
        Just nuevasTareas -> Right proyecto { tareas = nuevasTareas }
        Nothing -> Left "Tarea no encontrada"
  where
    mapearTareas [] = Nothing
    mapearTareas (t:ts)
        | descripcion t == desc = Just (t { asignadoA = Just emp } : ts)
        | otherwise = fmap (t :) (mapearTareas ts)

-- Marcar una tarea como completada
marcarCompletada :: Proyecto -> String -> Either String Proyecto
marcarCompletada proyecto desc =
    case actualizarTareas (tareas proyecto) of
        Just nuevasTareas -> Right proyecto { tareas = nuevasTareas }
        Nothing -> Left "Tarea no encontrada"
  where
    actualizarTareas [] = Nothing
    actualizarTareas (t:ts)
        | descripcion t == desc = Just (t { completada = True } : ts)
        | otherwise = fmap (t :) (actualizarTareas ts)
verProyectos :: [Proyecto] -> String
verProyectos proyectos = unlines (map verProyecto proyectos)

verEmpleados :: [Empleado] -> String
verEmpleados empleados = unlines (map verEmpleado empleados)

verEmpleado :: Empleado -> String
verEmpleado (Empleado id nombre) =  
    "Id: " ++ show id ++ "\n" ++  
    "Nombre: " ++ nombre ++ "\n"

verTarea :: Tarea -> String
verTarea (Tarea desc fecha prio asignado comp) =
        "  - " ++ desc ++ " (" ++ fecha ++ ")" ++ " Prioridad: " ++ show prio ++
        " | Asignado a: " ++ (maybe "Nadie" nombreEmpleado asignado) ++
        " | Estado: " ++ if comp then "Completada" else "Pendiente"
-- Ver todos los proyectos con sus tareas
verProyecto :: Proyecto -> String
verProyecto (Proyecto nombre inicio fin ts) =
    "Proyecto: " ++ nombre ++ "\n" ++
    "Inicio: " ++ inicio ++ "\n" ++
    "Fin: " ++ fin ++ "\n" ++
    "Tareas:\n" ++ unlines (map verTarea ts)
  
verTareas ::Proyecto -> String
verTareas (Proyecto nombre inicio fin ts) =
    
    "Tareas:\n" ++ unlines (map verTarea ts)




-- Contar tareas completadas y pendientes en un proyecto
contarTareas :: Proyecto -> (Int, Int)
contarTareas proyecto = 
    let completadas = length $ filter completada (tareas proyecto)
        pendientes = length (tareas proyecto) - completadas
    in (completadas, pendientes)

-- Eliminar un proyecto (solo devuelve una lista sin el proyecto)
eliminarProyecto :: [Proyecto] -> String -> Either String [Proyecto]
eliminarProyecto proyectos nombre = 
    let nuevosProyectos = filter ((/= nombre) . nombreProyecto) proyectos
    in if length nuevosProyectos == length proyectos 
       then Left "Proyecto no encontrado"
       else Right nuevosProyectos

-- Eliminar una tarea de un proyecto
eliminarTarea :: Proyecto -> String -> Either String Proyecto
eliminarTarea proyecto desc =
    let nuevasTareas = filter ((/= desc) . descripcion) (tareas proyecto)
    in if length nuevasTareas == length (tareas proyecto)
       then Left "Tarea no encontrada"
       else Right proyecto { tareas = nuevasTareas }

-- Función principal para interactuar con el sistema
main :: IO ()
main = do
   
    

    let empleado1 = Empleado 1 "Juan Pérez"
    let empleado2 = Empleado 2 "María García"
    let proyecto1 = crearProyecto "Proyecto Alpha" "2025-01-01" "2025-12-31"
    let tarea1 = Tarea "Diseñar base de datos" "2025-02-15" 1 Nothing False
    let tarea2 = Tarea "Implementar API" "2025-03-01" 2 Nothing False
    let proyectoConTareas = agregarTarea (agregarTarea proyecto1 tarea1) tarea2
    let nuevaLista = agregarProyecto proyectoConTareas listaProyectos
    
    

    
    menuLoop nuevaLista [empleado1, empleado2]

menuLoop :: [Proyecto] -> [Empleado] -> IO ()
menuLoop proyectos empleados = do
    putStrLn "Sistema de Gestión de Proyectos"
    putStrLn "1. Ver Proyectos"
    putStrLn "2. Ver Empleados"
    putStrLn "3. Asignar tarea"
    putStrLn "4. Marcar tarea como completada"
    putStrLn "5. Contar tareas completadas y pendientes"
    putStrLn "6. Eliminar tarea"
    putStrLn "7. Crear Proyecto"
    putStrLn "8. Crear Empleado"
    putStrLn "9. Crear Tarea"
    putStrLn "10. Eliminar Proyecto"
    putStrLn "11. Salir"
    putStrLn "\nSeleccione una opción:"
    opcion <- getLine
    case opcion of
        "1" -> do
            putStrLn (verProyectos proyectos)
            menuLoop proyectos empleados
        "2" -> do
            putStrLn (verEmpleados empleados)
            menuLoop proyectos empleados
        "3" -> do
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto"
            np <- getLine

            case buscarProyecto proyectos np of
                Just proyecto -> do
                    putStrLn (verTareas proyecto)
                    putStrLn "Ingresa la descripción de la tarea"
                    nt <- getLine
                    putStrLn (verEmpleados empleados)
                    putStrLn "Ingresa el id del empleado"
                    ide <- getLine

            -- Verificamos si la entrada es un número válido
                    case reads ide :: [(Int, String)] of
                        [(uid, "")] -> do  -- Si se pudo convertir correctamente
                            case buscarEmpleado empleados uid of
                                Just empleado -> do
                            -- Manejamos la función `asignarTarea` correctamente
                                    case asignarTarea proyecto nt empleado of
                                        Left err -> putStrLn ("Error: " ++ err)
                                        Right nuevoProyecto -> do
                                            putStrLn "Tarea asignada con éxito."
                                    -- Aquí podrías actualizar la lista de proyectos si fuera necesario
                                Nothing -> putStrLn "No se encontró el empleado."
                        _ -> putStrLn "ID de empleado inválido. Debe ser un número."
                Nothing -> putStrLn "No se encontró el proyecto."
            menuLoop proyectos empleados
        "4" -> do 
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto"
            np <- getLine
            case buscarProyecto proyectos np of
                Just proyecto -> do
                    putStrLn (verTareas proyecto)
                    putStrLn "Ingrese la descripción de la tarea a marcar como completada:"
                    desc <- getLine
           
                    case marcarCompletada proyecto desc of
                        Right nuevoProyecto -> do
                            case eliminarProyecto proyectos np of
                                Right proyectos2 -> do
                                    let nuevosProyectos = agregarProyecto nuevoProyecto proyectos2
                                    putStrLn "Tarea marcada como completada."
                                    menuLoop nuevosProyectos empleados
                                Left err -> do
                                    putStrLn err
                                    putStrLn "No se encontró."
                                    menuLoop proyectos empleados

                            
                            
                        Left err -> do
                            putStrLn err
                            menuLoop proyectos empleados
                Nothing -> putStrLn "No se encontró el proyecto."
            menuLoop proyectos empleados
        "5" -> do
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto para contar las tareas"
            np <- getLine
            case buscarProyecto proyectos np of
                Just proyecto -> do
                    let (completadas, pendientes) = contarTareas proyecto
                    putStrLn $ "Tareas completadas: " ++ show completadas
                    putStrLn $ "Tareas pendientes: " ++ show pendientes
                Nothing -> putStrLn "No se encontró el proyecto."
            menuLoop proyectos empleados
        "6" -> do
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto para eliminar una tarea"
            np <- getLine
            case buscarProyecto proyectos np of
                Just proyecto -> do
                    putStrLn (verTareas proyecto)
                    putStrLn "Ingrese la descripción de la tarea a eliminar:"
                    desc <- getLine
                    case eliminarTarea proyecto desc of
                        Right nuevoProyecto -> do
                            case eliminarProyecto proyectos np of
                                Right proyectos2 -> do
                                    let nuevosProyectos = agregarProyecto nuevoProyecto proyectos2
                                    putStrLn "Tarea eliminada."
                                    menuLoop nuevosProyectos empleados
                                Left err -> do
                                    putStrLn err
                                    putStrLn "No se encontró."
                                    menuLoop proyectos empleados
                            
                        Left err -> do
                            putStrLn err
                            menuLoop proyectos empleados
               
                Nothing -> putStrLn "No se encontró el proyecto."
            menuLoop proyectos empleados 



        "7" -> do
            putStrLn "Ingresa el nombre del proyecto a crear"
            np <- getLine
            putStrLn "Ingresa la fecha de inicio del proyecto"
            fi <- getLine
            putStrLn "Ingresa la fecha de fin del proyecto"
            ff <- getLine
            let nuevoProyecto= crearProyecto np fi ff
            let nuevosProyectos = agregarProyecto nuevoProyecto proyectos
            menuLoop nuevosProyectos empleados

        "8" -> do 
            putStrLn "Ingresa el nombre del empleado a crear"
            ne <- getLine
            let nuevoEmpleado = crearEmpleado empleados ne
            let nuevosEmpleados = agregarEmpleado nuevoEmpleado empleados
            menuLoop proyectos nuevosEmpleados

        "9" -> do
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto para agregar una tarea"
            np <- getLine
            case buscarProyecto proyectos np of
                Just proyecto -> do
                    putStrLn "Ingresa la descripción de la nueva tarea"
                    dt <- getLine
                    putStrLn "Ingresa la fecha limite de la nueva tarea"
                    fl <- getLine
                    putStrLn "Ingresa la prioridad de la tarea (valor numérico)"
                    p <- getLine
                    case reads p :: [(Int, String)] of
                        [(uid, "")] -> do 
                            let tarea = Tarea dt fl uid Nothing False 
                            let nuevoProyecto = agregarTarea proyecto tarea
                            case eliminarProyecto proyectos np of
                                Right proyectos2 -> do
                                    let nuevosProyectos = agregarProyecto nuevoProyecto proyectos2
                                    putStrLn "Tarea agregada Correctamente"
                                    menuLoop nuevosProyectos empleados
                                Left err -> do
                                    putStrLn err
                                    putStrLn "Algo salió mal."
                                    menuLoop proyectos empleados



                            
                        _ -> putStrLn "Prioridad inválida. Debe ser un número."
                    
                    
                Nothing -> putStrLn "No se encontró el proyecto."
            menuLoop proyectos empleados
        "10" -> do
            putStrLn (verProyectos proyectos)
            putStrLn "Ingresa el nombre del proyecto a eliminar"
            np <- getLine
            case eliminarProyecto proyectos np of
                                Right proyectos2 -> do
                                    
                                    putStrLn "Proyecto Eliminado Correctamente"
                                    menuLoop proyectos2 empleados
                                Left err -> do
                                    putStrLn err
                                    putStrLn "No se encontró el proyecto."
                                    menuLoop proyectos empleados

        "11" -> putStrLn "Saliendo del sistema..."
        _ -> do
            putStrLn "Opción no válida. Intente de nuevo."
            menuLoop proyectos empleados