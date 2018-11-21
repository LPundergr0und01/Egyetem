//Szabo Robert
//srim1761
//524/1

public class Main {
    public static void main(String args[]) {
        Forest fe = new Forest();
        Forest be = new Forest();

        Field f1 = new Field();
        Field f2 = new Field();

        Field f3 = new Field();
        Field f4 = new Field();
        Field f5 = new Field();

        f1.add(new Grass());
        f1.add(new Flower());
        f1.add(new Mushroom());

        f2.add(new Grass());
        f2.add(new Flower());

        f3.add(new Grass());
        f3.add(new Mushroom());
        f3.add(new Flower());

        f4.add(new Grass());
        f4.add(new Mushroom());
        f4.add(new Flower());

        f5.add(new Grass());
        f5.add(new Mushroom());
        f5.add(new Flower());

        fe.add(new PineTree());
        fe.add(f1);
        fe.add(f2);

        be.add(f3);
        be.add(f4);
        be.add(f5);
        be.add(new OakTree());

        System.out.println("A fenyőerdő "+fe.getOxigenAmountPerYear()+" liter oxigént termel évente, és várható élettartama "+fe.getLifeTime());
        System.out.println("A bükkerdő "+be.getOxigenAmountPerYear()+" liter oxigént termel évente és várható élettartama "+be.getLifeTime());
    }
}