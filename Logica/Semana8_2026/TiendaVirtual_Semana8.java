package semana8_descuentos;

import java.util.Scanner;

/**
 * CESDE - Escuela de Desarrollo de Software
 * Submódulo: Lógica de Programación - Semana 8
 * Docente: Ana Liliana Vera Gómez
 * Tema: Estructuras SI y CASO (switch-case e if-else)
 * Variante: Variables Alternativas Independientes
 */
public class TiendaVirtual_Semana8 {

    public static void main(String[] args) {
        // Inicialización de variables
        String nomCliente = "";
        String etiquetaTipo = "";
        int catCliente = 0;
        double montoBruto = 0.0;
        double porcBase = 0.0;
        double porcVolumen = 0.0;
        double rebajaBase = 0.0;
        double rebajaVolumen = 0.0;
        double rebajaTotal = 0.0;
        double montoNeto = 0.0;

        Scanner teclado = new Scanner(System.in);

        System.out.println("=========================================================");
        System.out.println("       SISTEMA DE FACTURACIÓN - TIENDA EN LÍNEA          ");
        System.out.println("=========================================================");

        System.out.print("Ingrese el nombre del cliente: ");
        nomCliente = teclado.nextLine();

        System.out.print("Ingrese el valor bruto de la compra ($ COP): ");
        montoBruto = teclado.nextDouble();

        System.out.println("Seleccione la categoría del cliente:");
        System.out.println("  [1] Cliente Nuevo      (5% descuento base)");
        System.out.println("  [2] Cliente Frecuente  (10% descuento base)");
        System.out.println("  [3] Cliente VIP        (15% descuento base)");
        System.out.print("Digite su opción (1, 2 o 3): ");
        catCliente = teclado.nextInt();

        // Factor 1: Selector Múltiple (switch)
        switch (catCliente) {
            case 1:
                porcBase = 5.0;
                etiquetaTipo = "Nuevo";
                break;
            case 2:
                porcBase = 10.0;
                etiquetaTipo = "Frecuente";
                break;
            case 3:
                porcBase = 15.0;
                etiquetaTipo = "VIP";
                break;
            default:
                System.out.println("Advertencia: Categoría no válida. Se asigna 0% base.");
                porcBase = 0.0;
                etiquetaTipo = "No Registrado";
                break;
        }

        // Factor 2: Condicional (if-else) por monto de compra
        if (montoBruto >= 10000000.0) {
            porcVolumen = 15.0;
        } else {
            porcVolumen = 5.0;
        }

        // Cálculos matemáticos
        rebajaBase = montoBruto * (porcBase / 100.0);
        rebajaVolumen = montoBruto * (porcVolumen / 100.0);
        rebajaTotal = rebajaBase + rebajaVolumen;
        montoNeto = montoBruto - rebajaTotal;

        // Salida formateada
        System.out.println();
        System.out.println("=========================================================");
        System.out.println("                 RESUMEN DE LIQUIDACIÓN                  ");
        System.out.println("=========================================================");
        System.out.println("Nombre del Cliente                : " + nomCliente);
        System.out.println("Tipo de Cliente Asignado          : " + etiquetaTipo);
        System.out.printf("Valor Compra Inicial              : $%,.2f COP%n", montoBruto);
        System.out.printf("Descuento por Categoría (%.0f%%)     : $%,.2f COP%n", porcBase, rebajaBase);
        System.out.printf("Descuento por Monto (%.0f%%)         : $%,.2f COP%n", porcVolumen, rebajaVolumen);
        System.out.println("---------------------------------------------------------");
        System.out.printf("Total Descuentos Concedidos       : $%,.2f COP%n", rebajaTotal);
        System.out.printf("TOTAL NETO A PAGAR                : $%,.2f COP%n", montoNeto);
        System.out.println("=========================================================");
        System.out.println("Liquidación efectuada exitosamente.");

        teclado.close();
    }
}
