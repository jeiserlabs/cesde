import java.util.Scanner;

/**
 * ejercicio_5
 */
public class ejercicio_5 {

  public static void main(String[] args) {
String Tipo_de_trabajador="";
	    String Nombre_trabajador="";
	    int Horas_trabajadas=0;
	    double Salario_basico_hora=0, Deducciones=0;
	    double Bonificaciones=0, Salario_neto=0;
        Scanner leer= new Scanner(System.in);
        System.out.println("Tipo de empleado (FIJO / TEMPORAL)");
        Tipo_de_trabajador=leer.nextLine();
        System.out.println("Nombre del trabajador: ");
        Nombre_trabajador=leer.nextLine();
        Tipo_de_trabajador=Tipo_de_trabajador.toUpperCase();
        if (Tipo_de_trabajador.equals("FIJO") ) {
            System.out.println("Cantidad de horas trabajadas: ");
            Horas_trabajadas=leer.nextInt();
            System.out.println("Valor hora de trabajo: ");
            Salario_basico_hora=leer.nextDouble();
            System.out.println("Valor deducciones: ");
            Deducciones=leer.nextDouble();
            System.out.println("Valor de las bonificaciones: ");
            Bonificaciones=leer.nextDouble();
        }
        else{
            if (Tipo_de_trabajador.equals("TEMPORAL")) {
                System.out.println("Cantidad de horas trabajadas: ");
                Horas_trabajadas=leer.nextInt();
                Salario_basico_hora=6000;
			    Bonificaciones=0;
			    Deducciones=0;
            }
            else{
                System.out.println("Error.... Tipo de trabajador incorrecto!!!");
            } //FINSI
        }// FINSI
        Salario_neto = Horas_trabajadas * Salario_basico_hora + Bonificaciones - Deducciones;
        System.out.println("--------------- INFORME ---------------");
        System.out.println("Tipo de empleado: " + Tipo_de_trabajador);
        System.out.println("Nombre empleado: " + Nombre_trabajador);
        System.out.println("Cantidad de horas trabajadas: " + Horas_trabajadas);
        System.out.println("Valor hora trabajada: " + Salario_basico_hora);
        System.out.println("valor de las bonificaciones: " + Bonificaciones);
        System.out.println( "Valor de las deducciones: " + Deducciones);
        System.out.println("------------------------------");
        System.out.println("Neto a pagar: " + Salario_neto);
  }
}
