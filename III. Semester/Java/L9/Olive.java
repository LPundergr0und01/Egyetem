//srim1761
//Szabo Robert
//524/1

import java.awt.Graphics;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Olive extends PizzaIngredient{
    private BufferedImage img;

    public Olive(Pizza x) {
        super(x);

        try {
            this.img = ImageIO.read(new File("src/pizza/olive.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void bake(Graphics g) {
        super.bake(g);
        this.addOlive(g);
    }

    public int getPrice() {
        System.out.println("Olive: 2 RON");
        return super.getPrice() + 2;
    }

    public String getIngredients() {
        return super.getIngredients() + ", olive";
    }

    private void addOlive(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }
}