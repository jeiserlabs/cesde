Algoritmo Simulacion_Formalizacion_MiPrimeraEmpresa
	// ============================================================================
	// PROYECTO INTEGRADOR CESDE - NIVEL 1
	// Módulo: Lógica de Programación
	// Descripción: Simulación secuencial de cálculo de costos de formalización
	//              y facturación para una microempresa en Colombia.
	// ============================================================================

	// DATOS DE ENTRADA
	razonSocial = ""
	nitRut = ""
	capitalInicial = 0
	subtotalVenta = 0
	esResponsableIva = 0
	tarifaCamara = 0
	costoRut = 0
	impuestoIcaEstimado = 0
	costoTotalFormalizacion = 0
	valorIva = 0
	totalFactura = 0

	Escribir "============================================================"
	Escribir "     SISTEMA MIPRIMERAEMPRESA - FORMALIZACIÓN & FACTURACIÓN"
	Escribir "============================================================"
	Escribir "Ingrese la Razón Social o Nombre Comercial:"
	Leer razonSocial
	Escribir "Ingrese el NIT o Cédula del Representante:"
	Leer nitRut
	Escribir "Ingrese el Capital Inicial de Trabajo (COP):"
	Leer capitalInicial
	Escribir "Ingrese el valor Subtotal de la venta (COP):"
	Leer subtotalVenta
	Escribir "¿La microempresa es Responsable de IVA? (1 = SÍ, 0 = NO):"
	Leer esResponsableIva

	// PROCESO
	tarifaCamara = capitalInicial * 0.007
	Si tarifaCamara < 55000 Entonces
		tarifaCamara = 55000
	Fin Si

	costoRut = 0
	impuestoIcaEstimado = capitalInicial * 0.004
	costoTotalFormalizacion = tarifaCamara + costoRut + impuestoIcaEstimado

	Si esResponsableIva = 1 Entonces
		valorIva = subtotalVenta * 0.19
	Sino
		valorIva = 0
	Fin Si

	totalFactura = subtotalVenta + valorIva

	// DATOS DE SALIDA
	Escribir ""
	Escribir "------------------------------------------------------------"
	Escribir "   RESUMEN DE ESTIMACIÓN DE FORMALIZACIÓN PARA: ", Mayusculas(razonSocial)
	Escribir "------------------------------------------------------------"
	Escribir " NIT / Documento: ", nitRut
	Escribir " Capital Registrado: ", capitalInicial
	Escribir " Tarifa Cámara Comercio Est.: ", tarifaCamara
	Escribir " Tramite RUT DIAN: ", costoRut, " (Gratuito)"
	Escribir " Proyección Impuesto ICA (Anual): ", impuestoIcaEstimado
	Escribir " COSTO TOTAL ESTIMADO FORMALIZACIÓN: ", costoTotalFormalizacion
	Escribir "------------------------------------------------------------"

	Escribir ""
	Escribir "============================================================"
	Escribir "                 FACTURA DE VENTA SIMULADA"
	Escribir "============================================================"
	Escribir " Emisor: ", Mayusculas(razonSocial)
	Escribir " NIT: ", nitRut
	Escribir " Subtotal: ", subtotalVenta
	Escribir " IVA (19%): ", valorIva
	Escribir " TOTAL A PAGAR: ", totalFactura
	Escribir "============================================================"
FinAlgoritmo
