import java.util.Scanner;

/**
 * CESDE - Técnico Laboral en Desarrollo de Software
 * Materia: Lógica de Programación - Semana 7
 * Docente: Ana Liliana Vera Gomez
 * Estudiante: Jeiser Abraham Gutierrez Torres
 * Ejercicio 5: Salario según tipo de vinculación (FIJO vs TEMPORAL)
 */
public class SalarioTrabajador {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // DECLARACIÓN E INICIALIZACIÓN DE VARIABLES
        String nombre = "";
        int tipoTrabajador = 0;
        String tipoTexto = "";
        int horasTrabajadas = 0;
        double valorHora = 0.0;
        double bonificaciones = 0.0;
        double deducciones = 0.0;
        double salarioBruto = 0.0;
        double salarioNeto = 0.0;

        // DATOS DE ENTRADA
        System.out.println("Ingrese el nombre del trabajador:");
        nombre = scanner.nextLine();

        System.out.println("Seleccione el tipo de vinculación (1: FIJO, 2: TEMPORAL):");
        tipoTrabajador = scanner.nextInt();

        System.out.println("Ingrese el número de horas trabajadas en el mes:");
        horasTrabajadas = scanner.nextInt();

        // PROCESO
        if (tipoTrabajador == 1) {
            tipoTexto = "FIJO";
            System.out.println("Ingrese el valor pactado por hora:");
            valorHora = scanner.nextDouble();

            System.out.println("Ingrese el total de bonificaciones:");
            bonificaciones = scanner.nextDouble();

            System.out.println("Ingrese el total de deducciones:");
            deducciones = scanner.nextDouble();

            salarioBruto = horasTrabajadas * valorHora;
            salarioNeto = salarioBruto + bonificaciones - deducciones;
        } else {
            tipoTexto = "TEMPORAL";
            valorHora = 6000.0;
            bonificaciones = 0.0;
            deducciones = 0.0;
            salarioBruto = horasTrabajadas * valorHora;
            salarioNeto = salarioBruto;
        }

        // DATOS DE SALIDA
        System.out.println("==================================================");
        System.out.println("LIQUIDACIÓN MENSUAL DE SALARIO");
        System.out.println("==================================================");
        System.out.println("Trabajador: " + nombre);
        System.out.println("Tipo de Vinculación: " + tipoTexto);
        System.out.println("Horas Trabajadas: " + horasTrabajadas);
        System.out.printf("Valor por Hora: $%,.2f\n", valorHora);
        System.out.printf("Salario Bruto: $%,.2f\n", salarioBruto);
        System.out.printf("Bonificaciones: $%,.2f\n", bonificaciones);
        System.out.printf("Deducciones: $%,.2f\n", deducciones);
        System.out.println("--------------------------------------------------");
        System.out.printf("Salario Neto a Pagar: $%,.2f\n", salarioNeto);
        System.out.println("==================================================");
        System.out.println("Programa realizado por: Jeiser Gutierrez");

        scanner.close();
    }
}
