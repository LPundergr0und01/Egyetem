//srim1761
//524/1
//Szabo Robert
import java.awt.*;
import java.util.Random;

public class Model {
    private double size;
    private double maxSize;
    private Color c;


    public Model(double size, double maxSize) {
        this.size = size;
        this.maxSize = maxSize;
        Random r = new Random();
        this.c = new Color(r.nextInt(254),r.nextInt(254),r.nextInt(254));
    }

    public void add(int x){
        if (this.size < this.maxSize)
            this.size += x;
    }

    public double getSize() {
        return size;
    }


    public double getMaxSize() {
        return maxSize;
    }


    public Color getC() {
        return c;
    }
}
