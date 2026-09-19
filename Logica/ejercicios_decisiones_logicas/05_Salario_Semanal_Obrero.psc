Algoritmo Salario_Semanal_Obrero
	// DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
	nombre_obrero = ""
	horas_trabajadas = 0
	horas_extras = 0
	pago_ordinario = 0
	pago_extras = 0
	salario_total = 0

	// DATOS DE ENTRADA
	Escribir "Ingrese el nombre del obrero:"
	Leer nombre_obrero

	Escribir "Ingrese el número de horas trabajadas en la semana:"
	Leer horas_trabajadas

	// PROCESO
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

	// DATOS DE SALIDA
	Escribir "=============================================="
	Escribir "LIQUIDACIÓN SEMANAL DE SALARIO"
	Escribir "=============================================="
	Escribir "Nombre del Obrero: ", nombre_obrero
	Escribir "Total Horas Trabajadas: ", horas_trabajadas
	Escribir "Horas Extras Realizadas: ", horas_extras
	Escribir "Pago por Horas Ordinarias: $", pago_ordinario
	Escribir "Pago por Horas Extras: $", pago_extras
	Escribir "----------------------------------------------"
	Escribir "SALARIO TOTAL SEMANAL: $", salario_total
	Escribir "=============================================="
	Escribir "Programa realizado por: Jeiser Gutierrez"
FinAlgoritmo
