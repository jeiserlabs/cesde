# 🧠 TALLER DE DECISIONES LÓGICAS Y CONDICIONALES — CESDE
> **Estudiante:** Jeiser Abraham Gutiérrez Torres (`jeiserlabs`)  
> **Docente:** Ana Liliana Vera Gómez  
> **Asignatura:** Lógica de Programación (Semana 7)  
> **Estándar:** Tríada CESDE (Análisis E-P-S + PSeInt Oficial + Código Java)

---

## 📑 ÍNDICE DE EJERCICIOS

### PARTE 1: TALLER OFICIAL DE CLASE (ASIGNACIÓN DIRECTA)
1. [Ejercicio 1: Mayor de 2 Hermanos y Diferencia de Edad](#ejercicio-1-mayor-de-2-hermanos)
2. [Ejercicio 3: Recaudación entre 2 Buses](#ejercicio-3-recaudación-entre-2-buses)
3. [Ejercicio 5: Salario Trabajador (FIJO vs TEMPORAL)](#ejercicio-5-salario-trabajador-fijo-vs-temporal)

### PARTE 2: GUÍA COMPLEMENTARIA (EJERCICIOS 1 AL 5 DEL PDF)
4. [Ejercicio 1B: Promedio Universitario (Aprobado >= 3.0)](#ejercicio-1b-promedio-universitario)
5. [Ejercicio 2B: Incremento Producto Importado (< $2.800)](#ejercicio-2b-incremento-producto-importado)
6. [Ejercicio 3B: Inversión Bancaria e Intereses (> $7.000)](#ejercicio-3b-inversión-bancaria-e-intereses)
7. [Ejercicio 4B: Pelotas de Basketball (Con / Sin Descuento)](#ejercicio-4b-pelotas-de-basketball)
8. [Ejercicio 5B: Salario Semanal Obrero con Horas Extras](#ejercicio-5b-salario-semanal-obrero-con-horas-extras)

---

# PARTE 1: TALLER OFICIAL DE CLASE

---

## EJERCICIO 1: MAYOR DE 2 HERMANOS
### 📋 Enunciado
Elaborar un algoritmo que lea el nombre y la edad de dos hermanos (no gemelos) y determine cuál es el hermano mayor y la diferencia de edad en años entre ambos.

### 1. Análisis Entrada - Proceso - Salida (E-P-S)
* **DATOS DE ENTRADA:**
  * `nombre_hermano1 = ""`
  * `edad_hermano1 = 0`
  * `nombre_hermano2 = ""`
  * `edad_hermano2 = 0`
* **PROCESO:**
  * Si `edad_hermano1 > edad_hermano2`:
    * `nombre_mayor = nombre_hermano1`
    * `edad_mayor = edad_hermano1`
    * `diferencia_edad = edad_hermano1 - edad_hermano2`
  * Sino:
    * `nombre_mayor = nombre_hermano2`
    * `edad_mayor = edad_hermano2`
    * `diferencia_edad = edad_hermano2 - edad_hermano1`
* **DATOS DE SALIDA:**
  * `nombre_mayor`, `edad_mayor`, `diferencia_edad`.

### 2. Algoritmo en PSeInt
```text
Algoritmo Mayor_Hermanos
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	nombre_hermano1 = ""
	edad_hermano1 = 0
	nombre_hermano2 = ""
	edad_hermano2 = 0
	nombre_mayor = ""
	edad_mayor = 0
	diferencia_edad = 0

	// DATOS DE ENTRADA
	Escribir "Ingrese el nombre del primer hermano:"
	Leer nombre_hermano1
	Escribir "Ingrese la edad del primer hermano:"
	Leer edad_hermano1
	Escribir "Ingrese el nombre del segundo hermano:"
	Leer nombre_hermano2
	Escribir "Ingrese la edad del segundo hermano:"
	Leer edad_hermano2

	// PROCESO
	Si (edad_hermano1 > edad_hermano2) Entonces
		nombre_mayor = nombre_hermano1
		edad_mayor = edad_hermano1
		diferencia_edad = edad_hermano1 - edad_hermano2
	Sino
		nombre_mayor = nombre_hermano2
		edad_mayor = edad_hermano2
		diferencia_edad = edad_hermano2 - edad_hermano1
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "El hermano mayor es: ", nombre_mayor, " con ", edad_mayor, " años."
	Escribir "La diferencia de edad es de: ", diferencia_edad, " años."
	Escribir "=================================================="
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

### 3. Código en Java
```java
import java.util.Scanner;

public class MayorHermanos {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String nombre1 = "", nombre2 = "", mayor = "";
        int edad1 = 0, edad2 = 0, edadMayor = 0, diferencia = 0;

        System.out.println("Nombre primer hermano:");
        nombre1 = scanner.nextLine();
        System.out.println("Edad primer hermano:");
        edad1 = scanner.nextInt();
        scanner.nextLine();
        System.out.println("Nombre segundo hermano:");
        nombre2 = scanner.nextLine();
        System.out.println("Edad segundo hermano:");
        edad2 = scanner.nextInt();

        if (edad1 > edad2) {
            mayor = nombre1; edadMayor = edad1; diferencia = edad1 - edad2;
        } else {
            mayor = nombre2; edadMayor = edad2; diferencia = edad2 - edad1;
        }

        System.out.println("Hermano mayor: " + mayor + " (" + edadMayor + " años)");
        System.out.println("Diferencia de edad: " + diferencia + " años");
        System.out.println("Programa realizado por: Jeiser Gutierrez");
        scanner.close();
    }
}
```

---

## EJERCICIO 3: RECAUDACIÓN ENTRE 2 BUSES
### 📋 Enunciado
Elaborar un algoritmo que lea la placa, cantidad de pasajeros y valor del pasaje de dos buses. Calcular el recaudo individual de cada bus, el total general y determinar cuál bus obtuvo la mayor recaudación.

### 1. Análisis Entrada - Proceso - Salida (E-P-S)
* **DATOS DE ENTRADA:**
  * `placa_bus1 = ""`, `pasajeros_bus1 = 0`, `pasaje_bus1 = 0.0`
  * `placa_bus2 = ""`, `pasajeros_bus2 = 0`, `pasaje_bus2 = 0.0`
* **PROCESO:**
  * `recaudo_bus1 = pasajeros_bus1 * pasaje_bus1`
  * `recaudo_bus2 = pasajeros_bus2 * pasaje_bus2`
  * `total_general = recaudo_bus1 + recaudo_bus2`
  * Si `recaudo_bus1 > recaudo_bus2` $\rightarrow$ Mayor es Bus 1.
  * Si `recaudo_bus2 > recaudo_bus1` $\rightarrow$ Mayor es Bus 2.
  * De lo contrario $\rightarrow$ Ambos recaudaron igual.
* **DATOS DE SALIDA:**
  * `recaudo_bus1`, `recaudo_bus2`, `total_general`, `mensaje_mayor`.

### 2. Algoritmo en PSeInt
```text
Algoritmo Recaudacion_Buses
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	placa_bus1 = ""
	pasajeros_bus1 = 0
	pasaje_bus1 = 0.0
	recaudo_bus1 = 0.0

	placa_bus2 = ""
	pasajeros_bus2 = 0
	pasaje_bus2 = 0.0
	recaudo_bus2 = 0.0

	total_general = 0.0
	mensaje_mayor = ""

	// DATOS DE ENTRADA
	Escribir "Ingrese placa del primer bus:"
	Leer placa_bus1
	Escribir "Cantidad de pasajeros bus ", placa_bus1, ":"
	Leer pasajeros_bus1
	Escribir "Valor del pasaje bus ", placa_bus1, ":"
	Leer pasaje_bus1

	Escribir "Ingrese placa del segundo bus:"
	Leer placa_bus2
	Escribir "Cantidad de pasajeros bus ", placa_bus2, ":"
	Leer pasajeros_bus2
	Escribir "Valor del pasaje bus ", placa_bus2, ":"
	Leer pasaje_bus2

	// PROCESO
	recaudo_bus1 = pasajeros_bus1 * pasaje_bus1
	recaudo_bus2 = pasajeros_bus2 * pasaje_bus2
	total_general = recaudo_bus1 + recaudo_bus2

	Si recaudo_bus1 > recaudo_bus2 Entonces
		mensaje_mayor = "El bus de placa " + placa_bus1 + " obtuvo la mayor recaudación."
	Sino
		Si recaudo_bus2 > recaudo_bus1 Entonces
			mensaje_mayor = "El bus de placa " + placa_bus2 + " obtuvo la mayor recaudación."
		Sino
			mensaje_mayor = "Ambos buses obtuvieron la misma recaudación."
		FinSi
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "Recaudo Bus 1 (", placa_bus1, "): $", recaudo_bus1
	Escribir "Recaudo Bus 2 (", placa_bus2, "): $", recaudo_bus2
	Escribir "Total General Recaudado: $", total_general
	Escribir "Veredicto: ", mensaje_mayor
	Escribir "=================================================="
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

---

## EJERCICIO 5: SALARIO TRABAJADOR (FIJO vs TEMPORAL)
### 📋 Enunciado
Elaborar un algoritmo que calcule el salario neto mensual de un trabajador según su tipo de vinculación: **1 para FIJO** o **2 para TEMPORAL**.
* Si es FIJO: Se digita valor pactado por hora, bonificaciones y deducciones.  
  $$\text{Neto} = (\text{horas} \times \text{valor}) + \text{bonificaciones} - \text{deducciones}$$
* Si es TEMPORAL: Tarifa fija de **\$6.000 COP** por hora base, sin bonificaciones ni deducciones.  
  $$\text{Neto} = \text{horas} \times 6000$$

### 1. Análisis Entrada - Proceso - Salida (E-P-S)
* **DATOS DE ENTRADA:**
  * `nombre = ""`
  * `tipo_trabajador = 0` (1 o 2)
  * `horas_trabajadas = 0`
  * `valor_hora = 0.0`, `bonificaciones = 0.0`, `deducciones = 0.0`
* **PROCESO:**
  * Si `tipo_trabajador = 1`:
    * `tipo_texto = "FIJO"`
    * `salario_bruto = horas_trabajadas * valor_hora`
    * `salario_neto = salario_bruto + bonificaciones - deducciones`
  * Sino:
    * `tipo_texto = "TEMPORAL"`
    * `valor_hora = 6000.0`
    * `salario_bruto = horas_trabajadas * valor_hora`
    * `salario_neto = salario_bruto`
* **DATOS DE SALIDA:**
  * `nombre`, `tipo_texto`, `horas_trabajadas`, `valor_hora`, `salario_bruto`, `bonificaciones`, `deducciones`, `salario_neto`.

### 2. Algoritmo en PSeInt
```text
Algoritmo Salario_Trabajador
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	nombre = ""
	tipo_trabajador = 0
	tipo_texto = ""
	horas_trabajadas = 0
	valor_hora = 0.0
	bonificaciones = 0.0
	deducciones = 0.0
	salario_bruto = 0.0
	salario_neto = 0.0

	// DATOS DE ENTRADA
	Escribir "Ingrese el nombre del trabajador:"
	Leer nombre

	Escribir "Seleccione el tipo de vinculación (1: FIJO, 2: TEMPORAL):"
	Leer tipo_trabajador

	Escribir "Ingrese el número de horas trabajadas en el mes:"
	Leer horas_trabajadas

	// PROCESO
	Si tipo_trabajador = 1 Entonces
		tipo_texto = "FIJO"
		Escribir "Ingrese el valor pactado por hora:"
		Leer valor_hora

		Escribir "Ingrese el total de bonificaciones:"
		Leer bonificaciones

		Escribir "Ingrese el total de deducciones:"
		Leer deducciones

		salario_bruto = horas_trabajadas * valor_hora
		salario_neto = salario_bruto + bonificaciones - deducciones
	Sino
		tipo_texto = "TEMPORAL"
		valor_hora = 6000.0
		bonificaciones = 0.0
		deducciones = 0.0
		salario_bruto = horas_trabajadas * valor_hora
		salario_neto = salario_bruto
	FinSi

	// DATOS DE SALIDA
	Escribir "=================================================="
	Escribir "LIQUIDACIÓN MENSUAL DE SALARIO"
	Escribir "=================================================="
	Escribir "Trabajador: ", nombre
	Escribir "Tipo de Vinculación: ", tipo_texto
	Escribir "Horas Trabajadas: ", horas_trabajadas
	Escribir "Valor por Hora: $", valor_hora
	Escribir "Salario Bruto: $", salario_bruto
	Escribir "Bonificaciones: $", bonificaciones
	Escribir "Deducciones: $", deducciones
	Escribir "--------------------------------------------------"
	Escribir "Salario Neto a Pagar: $", salario_neto
	Escribir "=================================================="
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

### 3. Código en Java
```java
import java.util.Scanner;

public class SalarioTrabajador {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String nombre = "", tipoTexto = "";
        int tipoTrabajador = 0, horasTrabajadas = 0;
        double valorHora = 0.0, bonificaciones = 0.0, deducciones = 0.0, bruto = 0.0, neto = 0.0;

        System.out.println("Nombre del trabajador:");
        nombre = scanner.nextLine();
        System.out.println("Tipo vinculación (1: FIJO, 2: TEMPORAL):");
        tipoTrabajador = scanner.nextInt();
        System.out.println("Horas trabajadas en el mes:");
        horasTrabajadas = scanner.nextInt();

        if (tipoTrabajador == 1) {
            tipoTexto = "FIJO";
            System.out.println("Valor hora:");
            valorHora = scanner.nextDouble();
            System.out.println("Bonificaciones:");
            bonificaciones = scanner.nextDouble();
            System.out.println("Deducciones:");
            deducciones = scanner.nextDouble();
            bruto = horasTrabajadas * valorHora;
            neto = bruto + bonificaciones - deducciones;
        } else {
            tipoTexto = "TEMPORAL";
            valorHora = 6000.0;
            bruto = horasTrabajadas * valorHora;
            neto = bruto;
        }

        System.out.println("Trabajador: " + nombre + " (" + tipoTexto + ")");
        System.out.printf("Salario Bruto: $%,.2f\n", bruto);
        System.out.printf("Salario Neto: $%,.2f\n", neto);
        System.out.println("Programa realizado por: Jeiser Gutierrez");
        scanner.close();
    }
}
```

---

# PARTE 2: GUÍA DE EJERCICIOS COMPLEMENTARIOS (PDF 1-5)

---

## EJERCICIO 1B: PROMEDIO UNIVERSITARIO
### 📋 Enunciado
Construya un Algoritmo que al recibir como dato el promedio de un alumno en un curso universitario, escriba "Aprobado" en caso de que el promedio sea satisfactorio, es decir mayor o igual a 3.0. De lo contrario escriba "Reprobado".

### Código PSeInt
```text
Algoritmo Promedio_Alumno
	nombre = ""
	promedio = 0.0
	estado = ""

	Escribir "Ingrese el nombre del estudiante:"
	Leer nombre
	Escribir "Ingrese el promedio del curso (0.0 a 5.0):"
	Leer promedio

	Si promedio >= 3.0 Entonces
		estado = "Aprobado"
	Sino
		estado = "Reprobado"
	FinSi

	Escribir "Estudiante: ", nombre
	Escribir "Promedio: ", promedio
	Escribir "Resultado: ", estado
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

---

## EJERCICIO 2B: INCREMENTO PRODUCTO IMPORTADO
### 📋 Enunciado
Construya un algoritmo que al recibir como dato el precio de un producto importado, incremente el 15% del mismo si es inferior a $2.800 y que además escriba el nuevo precio del producto.

### Código PSeInt
```text
Algoritmo Incremento_Producto
	nombre_producto = ""
	precio_inicial = 0.0
	precio_final = 0.0
	incremento = 0.0

	Escribir "Ingrese el nombre del producto:"
	Leer nombre_producto
	Escribir "Ingrese el precio del producto:"
	Leer precio_inicial

	Si precio_inicial < 2800 Entonces
		incremento = precio_inicial * 0.15
		precio_final = precio_inicial + incremento
		Escribir "Aplica incremento del 15% ($", incremento, ")"
	Sino
		precio_final = precio_inicial
		Escribir "No aplica incremento (Precio >= $2800)"
	FinSi

	Escribir "Producto: ", nombre_producto
	Escribir "Precio Final: $", precio_final
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

---

## EJERCICIO 3B: INVERSIÓN BANCARIA E INTERESES
### 📋 Enunciado
Un hombre desea saber cuánto dinero se genera por concepto de intereses sobre la cantidad que tiene en inversión en el banco. Decidirá reinvertir los intereses siempre y cuando estos excedan a $7.000, y en ese caso desea saber cuánto dinero tendrá finalmente en su cuenta.

### Código PSeInt
```text
Algoritmo Inversion_Banco
	capital_inversion = 0.0
	tasa_interes = 0.0
	intereses_generados = 0.0
	saldo_final = 0.0

	Escribir "Ingrese el capital invertido:"
	Leer capital_inversion
	Escribir "Ingrese el porcentaje de interés (ej: 0.05 para 5%):"
	Leer tasa_interes

	intereses_generados = capital_inversion * tasa_interes

	Si intereses_generados > 7000 Entonces
		saldo_final = capital_inversion + intereses_generados
		Escribir "Decisión: REINVERTIR INTERESES (Superan $7.000)"
	Sino
		saldo_final = capital_inversion
		Escribir "Decisión: NO REINVERTIR (Intereses <= $7.000)"
	FinSi

	Escribir "Intereses Generados: $", intereses_generados
	Escribir "Saldo Total en Cuenta: $", saldo_final
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

---

## EJERCICIO 4B: PELOTAS DE BASKETBALL
### 📋 Enunciado
El precio unitario de las pelotas de basketball es de 7.60 dólares si se compran 10 o más, y 8.00 dólares si se compran menos de 10. Imprima el costo total a pagar y el mensaje correspondiente ("Descuento" o "Sin descuento").

### Código PSeInt
```text
Algoritmo Pelotas_Basketball
	cantidad = 0
	precio_unitario = 0.0
	total_pagar = 0.0
	mensaje = ""

	Escribir "Ingrese la cantidad de pelotas a comprar:"
	Leer cantidad

	Si cantidad >= 10 Entonces
		precio_unitario = 7.60
		mensaje = "Descuento"
	Sino
		precio_unitario = 8.00
		mensaje = "Sin descuento"
	FinSi

	total_pagar = cantidad * precio_unitario

	Escribir "Cantidad Comprada: ", cantidad
	Escribir "Precio Unitario: $", precio_unitario
	Escribir "Total a Pagar: $", total_pagar
	Escribir "Estado: ", mensaje
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```

---

## EJERCICIO 5B: SALARIO SEMANAL OBRERO (HORAS EXTRAS)
### 📋 Enunciado
Un obrero necesita calcular su salario semanal:
* Si trabaja 40 horas o menos se le paga a **\$16.000** por hora.
* Si trabaja más de 40 horas se le paga a **\$16.000** cada una de las primeras 40 horas y a **\$20.000** por cada hora extra.

### Código PSeInt
```text
Algoritmo Salario_Semanal_Obrero
	nombre_obrero = ""
	horas_trabajadas = 0
	horas_extras = 0
	pago_ordinario = 0
	pago_extras = 0
	salario_total = 0

	Escribir "Ingrese el nombre del obrero:"
	Leer nombre_obrero
	Escribir "Ingrese horas trabajadas en la semana:"
	Leer horas_trabajadas

	Si horas_trabajadas <= 40 Entonces
		horas_extras = 0
		pago_ordinario = horas_trabajadas * 16000
		pago_extras = 0
		salario_total = pago_ordinario
	Sino
		horas_extras = horas_trabajadas - 40
		pago_ordinario = 40 * 16000
		pago_extras = horas_extras * 20000
		salario_total = pago_ordinario + pago_extras
	FinSi

	Escribir "Obrero: ", nombre_obrero
	Escribir "Horas normales: ", horas_trabajadas
	Escribir "Horas extras: ", horas_extras
	Escribir "Pago ordinario: $", pago_ordinario
	Escribir "Pago extras: $", pago_extras
	Escribir "SALARIO TOTAL: $", salario_total
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
```
