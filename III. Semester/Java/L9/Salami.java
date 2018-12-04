//srim1761
//Szabo Robert
//524/1

import java.awt.Graphics;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Salami extends PizzaIngredient{
    private BufferedImage img;

    public Salami(Pizza x) {
        super(x);

        try {
            this.img = ImageIO.read(new File("src/pizza/salami.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void bake(Graphics g) {
        super.bake(g);
        this.addSalami(g);
    }

    public int getPrice() {
        System.out.println("Salami: 5 RON");
        return super.getPrice() + 5;
    }

    public String getIngredients() {
        return super.getIngredients() + ", salami";
    }

    private void addSalami(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }
}