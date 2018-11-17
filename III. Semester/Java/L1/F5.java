//srim1761
//Szabo Robert

public class F5 {
    public static void main(String[] args){
        int n = 10;

        if (args.length>0) n = Integer.parseInt(args[0]);
        Integer[][] piramid = new Integer[n][];
        int num = 0;
        for (int i=0; i<piramid.length; ++i) {
            piramid[i] = new Integer[i+1];
            for (int j=0; j<piramid[i].length; ++j) {
                piramid[i][j] = ++num;
            }
        }

        for (int i=0; i<piramid.length; ++i) {
            for (int j=0; j<piramid[i].length; ++j) {
                System.out.print(""+piramid[i][j]+" ");
            }
            System.out.println();
        }
    }
}
