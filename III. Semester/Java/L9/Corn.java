//srim1761
//Szabo Robert
//524/1

import java.awt.Graphics;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Corn extends PizzaIngredient{
    private BufferedImage img;

    public Corn(Pizza x) {
        super(x);

        try {
            this.img = ImageIO.read(new File("src/pizza/corn.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void bake(Graphics g) {
        super.bake(g);
        this.addCorn(g);
    }

    public int getPrice() {
        System.out.println("Corn: 1 RON");
        return super.getPrice() + 1;
    }

    public String getIngredients() {
        return super.getIngredients() + ", corn";
    }

    private void addCorn(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }
}