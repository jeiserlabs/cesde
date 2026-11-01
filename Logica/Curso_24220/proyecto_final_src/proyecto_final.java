
import java.util.Scanner;
public class proyecto_final {
    //declarar variables globales
    static Scanner leer= new Scanner(System.in);
    static String[] nombres=new String[50];
    static Double[] salarios= new Double[50];
    static int n=0;

    public static void main(String[] args) {
        int opcion=0;
        do {
            System.out.println("===========================================");
            System.out.println("     SISTEMA DE GESTIÓN DE EMPLEADOS");
            System.out.println("");
            System.out.println("         Ana Liliana Vera Gómez");
            System.out.println("===========================================");
            System.out.println(" 1. Registrar empleados");
            System.out.println(" 2. Mostrar empleados");
            System.out.println(" 3. Calcular promedio salarial");
            System.out.println(" 4. Modificar salario");
            System.out.println(" 5. Localizar empleado por nombre");
            System.out.println(" 6. Mostrar empleado con MENOR salario");
            System.out.println(" 7. Mostrar empleado con MAYOR salario\"");
            System.out.println(" 8. Salir");
            System.out.println("");
            System.out.println(" Ingresar opción: --> ");
            try {
                opcion = Integer.parseInt(leer.nextLine());
            } catch (NumberFormatException e) {
                opcion= 0;
            }
            switch (opcion) {
                case 1:
                    System.out.println("Opción 1 sin implementar");
                    break;

                case 2:
                    System.out.println("Opción 2 sin implementar");
                    break;

                case 3:
                    System.out.println("Opción 3 sin implementar");
                    break;

                case 4:
                    System.out.println("Opción 4 sin implementar");
                    break;

                case 5:
                    System.out.println("Opción 5 sin implementar");
                    break;

                case 6:
                    System.out.println("Opción 6 sin implementar");
                    break;

                case 7:
                    System.out.println("Opción 7 sin implementar");
                    break;

                case 8:
                    System.out.println("Hemos terminado.... ");
                    break;

                default:
                    System.out.println("Opción Incorrecta.....!!!!");
                    break;
            }
        } while (opcion!=8);
    }
}
