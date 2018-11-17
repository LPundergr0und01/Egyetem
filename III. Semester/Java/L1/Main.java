//srim1761
//Szabo Robert

public class Main {
    public static void main(String[] args) {
        int sum_paros = 0;
        int sum_paratlan = 0;

        try {
            for (int i=0; i<args.length; ++i) {
                int a = Integer.parseInt(args[i]);
                if (i%2==0) sum_paros+=a;
                else sum_paratlan+=a;
            }
            System.out.println("Paros Osszeg: "+sum_paros+"\nParatlan osszeg "+sum_paratlan);
        } catch (Exception e) {
            System.out.println("Minden szam valos kell legyen");
        }
    }
}
