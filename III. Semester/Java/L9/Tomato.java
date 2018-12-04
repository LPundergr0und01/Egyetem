//srim1761
//Szabo Robert
//524/1

import java.awt.Graphics;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Tomato extends PizzaIngredient{
    private BufferedImage img;

    public Tomato(Pizza x) {
        super(x);

        try {
            this.img = ImageIO.read(new File("src/pizza/tomato.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void bake(Graphics g) {
        super.bake(g);
        this.addTomato(g);
    }

    public int getPrice() {
        System.out.println("Tomato: 2 RON");
        return super.getPrice() + 2;
    }

    public String getIngredients() {
        return super.getIngredients() + ", tomato";
    }

    private void addTomato(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }
}