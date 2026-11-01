package cesde.logica.semana8;

import java.util.Scanner;

/**
 * ============================================================================
 * INSTITUCIÓN: CESDE - Escuela de Desarrollo de Software
 * SUBMÓDULO  : Lógica de Programación (Semana 8)
 * DOCENTE    : Ana Liliana Vera Gómez
 * TEMA       : Estructuras de Control - Selector Múltiple (switch - case)
 * CASO       : CineExpress (Variante con Variables Alternativas Independientes)
 * ============================================================================
 */
public class CineExpress_VarianteSemana8 {

    public static void main(String[] args) {
        // CONSTANTES
        final double VALOR_BOLETO_BASE = 35000.0; // Tarifa oficial $35.000 COP

        // VARIABLES DE ENTRADA Y CONTROL (Nombres renovados independientes)
        String condicionEstudiante = "";
        double notaPromedio = 0.0;
        int seleccionCombo = 0;

        // VARIABLES DE PROCESO Y CÁLCULO
        double rebajaBoleta = 0.0;
        double valorBoleta = 0.0;
        int valorCombo = 0;
        String detalleCombo = "";
        double montoFinalFactura = 0.0;

        Scanner consola = new Scanner(System.in);

        // ---------------------------------------------------------------------
        // MÓDULO 1: CONTROL DE ENTRADA Y DESCUENTO ACADÉMICO (if - else)
        // ---------------------------------------------------------------------
        System.out.println("=========================================================");
        System.out.println("               SISTEMA DE TAQUILLA CINEEXPRESS           ");
        System.out.println("=========================================================");
        System.out.print("¿El usuario cuenta con carnet de estudiante? (SI / NO): ");
        condicionEstudiante = consola.nextLine().trim();

        if (condicionEstudiante.equalsIgnoreCase("SI")) {
            System.out.print("Ingrese el promedio acumulado del estudiante (ej: 4.0): ");
            notaPromedio = consola.nextDouble();

            if (notaPromedio >= 3.8) {
                rebajaBoleta = VALOR_BOLETO_BASE * 0.50; // 50% de descuento por excelencia
            } else {
                rebajaBoleta = VALOR_BOLETO_BASE * 0.20; // 20% de descuento base estudiante
            }
            valorBoleta = VALOR_BOLETO_BASE - rebajaBoleta;
        } else if (condicionEstudiante.equalsIgnoreCase("NO")) {
            rebajaBoleta = 0.0;
            valorBoleta = VALOR_BOLETO_BASE;
        } else {
            System.out.println("Opción ingresada no reconocida. Se aplica tarifa particular plena.");
            rebajaBoleta = 0.0;
            valorBoleta = VALOR_BOLETO_BASE;
        }

        // ---------------------------------------------------------------------
        // MÓDULO 2: SELECTOR MÚLTIPLE DE DULCERÍA (switch - case)
        // ---------------------------------------------------------------------
        System.out.println("\n----------------- MENÚ DE DULCERÍA Y SNACKS -----------------");
        System.out.println("  [1] Combo Personal ($15.000 COP) -> Crispetas medianas + Gaseosa");
        System.out.println("  [2] Combo Dúo      ($20.000 COP) -> Crispetas grandes + 2 Gaseosas + Dulces");
        System.out.println("  [3] Combo Kids     ($25.000 COP) -> Crispetas pequeñas + Jugo + Muñeco");
        System.out.println("  [4] Sin dulcería   ($0 COP)");
        System.out.print("Digite el código del combo a elegir (1 al 4): ");
        seleccionCombo = consola.nextInt();

        // ESTRUCTURA CASO / SELECTOR MÚLTIPLE
        switch (seleccionCombo) {
            case 1:
                detalleCombo = "Combo Personal (Crispetas medianas + Gaseosa)";
                valorCombo = 15000;
                break;

            case 2:
                detalleCombo = "Combo Dúo (Crispetas grandes + 2 Gaseosas + Dulces)";
                valorCombo = 20000;
                break;

            case 3:
                detalleCombo = "Combo Kids (Crispetas pequeñas + Jugo + Muñeco)";
                valorCombo = 25000;
                break;

            case 4:
                detalleCombo = "Sin dulcería";
                valorCombo = 0;
                break;

            default:
                System.out.println("Advertencia: Código de dulcería erróneo. Se registra sin combo.");
                detalleCombo = "Sin dulcería (Código no válido)";
                valorCombo = 0;
                break;
        }

        // ---------------------------------------------------------------------
        // MÓDULO 3: TOTALIZACIÓN Y FACTURA DETALLADA
        // ---------------------------------------------------------------------
        montoFinalFactura = valorBoleta + valorCombo;

        System.out.println("\n=========================================================");
        System.out.println("                   FACTURA DE COMPRA                     ");
        System.out.println("=========================================================");
        System.out.println("Condición de estudiante           : " + condicionEstudiante.toUpperCase());
        if (condicionEstudiante.equalsIgnoreCase("SI")) {
            System.out.printf("Promedio académico registrado      : %.2f%n", notaPromedio);
            System.out.printf("Descuento obtenido en boleta       : $%,.2f COP%n", rebajaBoleta);
        }
        System.out.printf("Valor neto de la boleta de cine    : $%,.2f COP%n", valorBoleta);
        System.out.println("Combo de dulcería seleccionado     : " + detalleCombo);
        System.out.printf("Valor del combo de dulcería        : $%,.2f COP%n", (double) valorCombo);
        System.out.println("---------------------------------------------------------");
        System.out.printf("TOTAL NETO A CANCELAR              : $%,.2f COP%n", montoFinalFactura);
        System.out.println("=========================================================");
        System.out.println("¡Disfrute la función! Gracias por elegir CineExpress.");

        consola.close();
    }
}
