# 📋 Tarea Calificada: Condicional Si en Casa (Semana 7 - CESDE)

> [!IMPORTANT]
> **Valor de la actividad:** **1.5 puntos** (Evaluación directa de Lógica de Programación).  
> **Plataforma de entrega:** **ecesde** ➔ Módulo Lógica de Programación ➔ **Semana 7**.  
> **Nombre de la tarea en ecesde:** `subir tarea condicional si en casa`.  
> **Fecha límite:** Subir a plataforma y traer listo/verificado para la próxima clase.  
> **Formato de entrega:** Carpeta comprimida en archivo **`.zip`** con los 3 archivos requeridos.

---

## 🎯 Requisitos de Entrega

La profesora **Ana Liliana Vera** enviará **1 solo ejercicio** a través del grupo. Ese ejercicio debe resolverse exactamente en los tres formatos trabajados en clase:

| # | Archivo | Formato / Herramienta | Requisitos clave |
|---|---|---|---|
| 1 | `ejercicio_tarea.txt` | Bloc de notas (Texto plano) | Estructura canónica obligatoria de 4 bloques: `DATOS DE ENTRADA`, `PROCESO`, `DATOS DE SALIDA`, `ALGORITMO`. |
| 2 | `ejercicio_tarea.psc` | PSeInt | Algoritmo funcional con validaciones `Si...Sino...FinSi`, salidas formateadas y probado con casos de prueba. |
| 3 | `EjercicioTarea.java` | Java (VS Code / Terminal) | Clase pública ejecutable, uso de `Scanner`, manejo de tipos (`int`, `double`, `String`), `.toUpperCase()` o `.equalsIgnoreCase()` y cálculo matemático idéntico. |

---

## 🏛️ Estructura Canónica Obligatoria del `.txt` (Regla 40)

Todo archivo de texto para la profesora Liliana debe cumplir estrictamente esta plantilla:

```text
DATOS DE ENTRADA
    Variable_1=""
    Variable_2=0
    Variable_3=0

PROCESO
    Si (condicion)
        Leer Variable_2
        ...
    Sino
        Si (otra_condicion)
            ...
        Sino
            Escribir "Error... Mensaje de validación"
        FinSi
    FinSi
    Resultado = Formula_Matematica

DATOS DE SALIDA
    Variable_1
    Variable_2
    Resultado

ALGORITMO
    // Inicialización
    Variable_1=""
    Variable_2=0
    Resultado=0

    // Lectura inicial
    Escribir "Ingrese ...:"
    Leer Variable_1

    // Árbol de decisiones
    Si (Variable_1 = "OPCION_A" o Variable_1 = "opcion_a")
        ...
    Sino
        Si (...)
            ...
        Sino
            Escribir "Error..."
        FinSi
    FinSi

    Resultado = Formula_Matematica

    // DATOS DE SALIDA - MOSTRAR
    Escribir "--------------- INFORME ---------------"
    Escribir "Etiqueta 1: " + Variable_1
    Escribir "Etiqueta 2: " + Variable_2
    Escribir "---------------------------------------"
    Escribir "Neto / Total: " + Resultado
Fin algoritmo
```

---

## 📦 Instrucciones para el Empaquetado y Subida a ecesde

1. Crear una carpeta localmente llamada:  
   `Tarea_Condicional_Si_Jeiser_Gutierrez`
2. Guardar dentro los 3 archivos:
   - `ejercicio_tarea.txt`
   - `ejercicio_tarea.psc`
   - `EjercicioTarea.java`
3. Clic derecho en la carpeta ➔ **Enviar a** ➔ **Carpeta comprimida en .zip** (o con 7-Zip/WinRAR como `.zip`).
4. Ingresar a [ecesde](https://ecesde.cesde.edu.co/) ➔ Curso **Lógica de Programación** ➔ **Semana 7** ➔ **subir tarea condicional si en casa**.
5. Adjuntar el archivo `.zip` y dar clic en **Guardar cambios / Enviar tarea**.

---

## 🚀 Plan de Acción en Casa

1. Estar atento al mensaje del grupo con el enunciado del ejercicio.
2. Pegar el enunciado en el repositorio para generar automáticamente el `.txt`, `.psc` y `.java`.
3. Probar en PSeInt y compilar en Java con `javac` y `java`.
4. Comprimir y subir a **ecesde**.
