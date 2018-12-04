//srim1761
//Szabo Robert
//524/1

import java.awt.Graphics;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;


public class Mushroom extends PizzaIngredient{
    private BufferedImage img;

    public Mushroom(Pizza x) {
        super(x);

        try {
            this.img = ImageIO.read(new File("src/pizza/mushroom.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void bake(Graphics g) {
        super.bake(g);
        this.addMushroom(g);
    }

    public int getPrice() {
        System.out.println("Mushroom: 3 RON");
        return super.getPrice() + 3;
    }

    public String getIngredients() {
        return super.getIngredients() + ", mushroom";
    }

    private void addMushroom(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }
}