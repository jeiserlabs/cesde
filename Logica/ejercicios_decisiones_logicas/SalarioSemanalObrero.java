import java.util.Scanner;

/**
 * CESDE - Técnico Laboral en Desarrollo de Software
 * Materia: Lógica de Programación
 * Docente: Ana Liliana Vera / Jonathan Piedrahita
 * Estudiante: Jeiser Gutiérrez
 * Ejercicio 5: Cálculo de salario semanal con horas extras
 */
public class SalarioSemanalObrero {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
        String nombreObrero = "";
        int horasTrabajadas = 0;
        int horasExtras = 0;
        double pagoOrdinario = 0.0;
        double pagoExtras = 0.0;
        double salarioTotal = 0.0;

        final double TARIFA_NORMAL = 16000.0;
        final double TARIFA_EXTRA = 20000.0;
        final int LIMITE_HORAS = 40;

        // DATOS DE ENTRADA
        System.out.println("Ingrese el nombre del obrero:");
        nombreObrero = scanner.nextLine();

        System.out.println("Ingrese el número de horas trabajadas en la semana:");
        horasTrabajadas = scanner.nextInt();

        // PROCESO
        if (horasTrabajadas <= LIMITE_HORAS) {
            horasExtras = 0;
            pagoOrdinario = horasTrabajadas * TARIFA_NORMAL;
            pagoExtras = 0.0;
            salarioTotal = pagoOrdinario;
        } else {
            horasExtras = horasTrabajadas - LIMITE_HORAS;
            pagoOrdinario = LIMITE_HORAS * TARIFA_NORMAL;
            pagoExtras = horasExtras * TARIFA_EXTRA;
            salarioTotal = pagoOrdinario + pagoExtras;
        }

        // DATOS DE SALIDA
        System.out.println("==============================================");
        System.out.println("LIQUIDACIÓN SEMANAL DE SALARIO");
        System.out.println("==============================================");
        System.out.println("Nombre del Obrero: " + nombreObrero);
        System.out.println("Total Horas Trabajadas: " + horasTrabajadas);
        System.out.println("Horas Extras Realizadas: " + horasExtras);
        System.out.printf("Pago por Horas Ordinarias: $%,.2f\n", pagoOrdinario);
        System.out.printf("Pago por Horas Extras: $%,.2f\n", pagoExtras);
        System.out.println("----------------------------------------------");
        System.out.printf("SALARIO TOTAL SEMANAL: $%,.2f\n", salarioTotal);
        System.out.println("==============================================");
        System.out.println("Programa realizado por: Jeiser Gutierrez");

        scanner.close();
    }
}
