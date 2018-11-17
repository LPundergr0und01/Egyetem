//srim1761
//Szabo Robert

public class L3_2 {
    public static void main(String[] args) {
        double sum_paros = 0;
        double sum_paratlan = 0;
        for (int i=0; i<args.length; ++i) {
            double  a = Double.parseDouble(args[i]);
            if (i%2==0) sum_paros+=a;
            else sum_paratlan+=a;
        }
        System.out.println("Paros Osszeg: "+sum_paros+"\nParatlan osszeg "+sum_paratlan);
    }
}
