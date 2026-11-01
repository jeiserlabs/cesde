Algoritmo TiendaVirtual_Semana8
	// =========================================================================
	// INSTITUCIÓN: CESDE - Escuela de Desarrollo de Software
	// CURSO: Lógica de Programación (Semana 8)
	// DOCENTE: Ana Liliana Vera Gómez
	// TEMA: Estructuras de Control - SI y CASO (Selector Múltiple)
	// =========================================================================

	// 1. INICIALIZACIÓN DE VARIABLES (Estándar Flexible)
	nomCliente = ""
	etiquetaTipo = ""
	catCliente = 0
	montoBruto = 0.0
	porcBase = 0.0
	porcVolumen = 0.0
	rebajaBase = 0.0
	rebajaVolumen = 0.0
	rebajaTotal = 0.0
	montoNeto = 0.0

	// 2. ENTRADA DE DATOS
	Escribir "========================================================="
	Escribir "       SISTEMA DE FACTURACIÓN - TIENDA EN LÍNEA          "
	Escribir "========================================================="
	Escribir "Ingrese el nombre del cliente: "
	Leer nomCliente

	Escribir "Ingrese el valor bruto de la compra ($ COP): "
	Leer montoBruto

	Escribir "Seleccione la categoría del cliente: "
	Escribir "  [1] Cliente Nuevo      (5% descuento base)"
	Escribir "  [2] Cliente Frecuente  (10% descuento base)"
	Escribir "  [3] Cliente VIP        (15% descuento base)"
	Escribir "Digite su opción (1, 2 o 3): "
	Leer catCliente

	// 3. PROCESO FACTOR 1: SELECTOR MÚLTIPLE (CASO / SEGUN)
	Segun (catCliente) Hacer
		1:
			porcBase = 5
			etiquetaTipo = "Nuevo"
		2:
			porcBase = 10
			etiquetaTipo = "Frecuente"
		3:
			porcBase = 15
			etiquetaTipo = "VIP"
		De Otro Modo:
			Escribir "Advertencia: Categoría no válida. Se asigna 0% base."
			porcBase = 0
			etiquetaTipo = "No Registrado"
	Fin Segun

	// 4. PROCESO FACTOR 2: CONDICIONAL (SI) POR MONTO DE COMPRA
	// Si el monto es mayor o igual a $10.000.000 COP aplica 15%; de lo contrario 5%.
	Si (montoBruto >= 10000000) Entonces
		porcVolumen = 15
	SiNo
		porcVolumen = 5
	Fin Si

	// 5. CÁLCULOS MATEMÁTICOS DE LIQUIDACIÓN
	rebajaBase = montoBruto * (porcBase / 100)
	rebajaVolumen = montoBruto * (porcVolumen / 100)
	rebajaTotal = rebajaBase + rebajaVolumen
	montoNeto = montoBruto - rebajaTotal

	// 6. DATOS DE SALIDA / REPORTE FINAL
	Escribir " "
	Escribir "========================================================="
	Escribir "                 RESUMEN DE LIQUIDACIÓN                  "
	Escribir "========================================================="
	Escribir "Nombre del Cliente                : ", nomCliente
	Escribir "Tipo de Cliente Asignado          : ", etiquetaTipo
	Escribir "Valor Compra Inicial              : $", montoBruto
	Escribir "Descuento por Categoría (", porcBase, "%)     : $", rebajaBase
	Escribir "Descuento por Monto (", porcVolumen, "%)         : $", rebajaVolumen
	Escribir "---------------------------------------------------------"
	Escribir "Total Descuentos Concedidos       : $", rebajaTotal
	Escribir "TOTAL NETO A PAGAR                : $", montoNeto
	Escribir "========================================================="
	Escribir "Liquidación efectuada exitosamente."
FinAlgoritmo
