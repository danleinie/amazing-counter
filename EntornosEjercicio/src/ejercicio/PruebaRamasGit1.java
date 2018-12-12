package ejercicio;

public class PruebaRamasGit1 {
	
	public static void main(String[] args) {
		
		System.out.println("Hola Mundo mira voy a crear un array");
		
		int [] a = new int[10];
		
		for (int i = 0; i < a.length; i++) {
			a[i]=i+2;
		}
		
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
	}

}
