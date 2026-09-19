# 📜 PLANTILLA CANÓNICA OBLIGATORIA DE EJERCICIOS DE LÓGICA (CESDE)
> **Fuente SSOT:** [`C:\Users\desarrollo\Desktop\ejercicio5.txt`](file:///C:/Users/desarrollo/Desktop/ejercicio5.txt)  
> **Docente:** Ana Liliana Vera Gómez  
> **Estatus:** Grabada en Piedra (Regla Global 40) — De estricto cumplimiento para TODOS los ejercicios.

---

## 🏛️ ESTRUCTURA OBLIGATORIA EN 4 SECCIONES

```text
DATOS DE ENTRADA 
	Variable_texto=""
	Variable_numero=0
	Variable_decimal=0.0

PROCESO
  si (Condicion_1="VALOR" o Condicion_1="valor")
      Leer Variable_especifica
  sino
     si (Condicion_2="OTRO" o Condicion_2="otro")
         Variable_especifica=123
     sino
         Escribir "Error.... Dato incorrecto!!!"
     finsi
  finsi
  Formula_Calculo = Variable_A * Variable_B + Variable_C - Variable_D

DATOS DE SALIDA
    Variable_1
    Variable_2
    Variable_3
    Formula_Calculo

ALGORITMO
   // 1. Inicialización de variables arriba
   Variable_texto=""
   Variable_numero=0
   Variable_decimal=0.0
   Formula_Calculo=0

   // 2. Solicitud y lectura de datos
   Escribir "Ingrese dato inicial: "
   Leer Variable_texto

   // 3. Condicionales con validación mayúsculas/minúsculas y error
   si (Variable_texto="OPCION1" o Variable_texto="opcion1")
       Escribir "Ingrese variable específica: "
       Leer Variable_especifica
   sino
      si (Variable_texto="OPCION2" o Variable_texto="opcion2")
          Variable_especifica=6000
      sino
          Escribir "Error.... Opción incorrecta!!!"
      finsi
   finsi

   // 4. Fórmula de cálculo matemático
   Formula_Calculo = Variable_A * Variable_B + Variable_C - Variable_D

   // 5. Bloque de Salida e Informe
   //DATOS DE SALIDA -  MOSTRAR
   Escribir "--------------- INFORME ---------------"
   Escribir "Etiqueta 1: " + Variable_1
   Escribir "Etiqueta 2: " + Variable_2
   Escribir "------------------------------"
   Escribir "Total: " + Formula_Calculo
Fin algoritmo
```

---

## 📌 Puntos Clave Inmutables:
1. **4 Bloques Exactos:** `DATOS DE ENTRADA`, `PROCESO`, `DATOS DE SALIDA`, `ALGORITMO`.
2. **Insensibilidad a Mayúsculas/Minúsculas:** Siempre evaluar con `o` minúscula/mayúscula: `(Tipo="FIJO" o Tipo="fijo")`.
3. **Manejo de Error:** Si el usuario digita un tipo inexistente, el `sino` final debe mostrar `Escribir "Error.... [Mensaje]!!!"`.
4. **Fórmula Unificada:** Se calcula tras cerrar los `finsi`.
5. **Concatenación con `+`:** Se usa el signo más para unir texto y variables en el informe de salida.
6. **Encabezado y Separador:** `--------------- INFORME ---------------` y `------------------------------`.
7. **Cierre:** `Fin algoritmo` (o `FinAlgoritmo`).
