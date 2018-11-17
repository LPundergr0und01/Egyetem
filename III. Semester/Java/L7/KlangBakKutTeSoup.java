public class KlangBakKutTeSoup implements Soup {

    @Override
    public void associateMainDish(MainDish x) {
        System.out.println("A(z) Klang Bak Kut Te Soup leveshez a(z) "+ x +" foetelt tarsitottam.");
    }

    @Override
    public String toString() {
        return "Klang Bak Kut Te Soup";
    }
}
