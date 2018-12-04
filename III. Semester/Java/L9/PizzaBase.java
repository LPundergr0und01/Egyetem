//srim1761
//Szabo Robert
//524/1

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class PizzaBase implements Pizza {

    private BufferedImage img;

    PizzaBase() {
        try {
            this.img = ImageIO.read(new File("src/Pizza/pizza_base.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void bake(Graphics g) {
        g.drawImage(this.img,0,0,null);
    }

    @Override
    public int getPrice() {
        return 5;
    }

    @Override
    public String getIngredients() {
        return "flour, yeast, egg";
    }
}
