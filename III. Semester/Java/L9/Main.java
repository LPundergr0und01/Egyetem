//srim1761
//Szabo Robert
//524/1

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Main {
    public static void main(String args[]) throws IOException {
        File file = new File("src/pizza/pizza_base.png");
        BufferedImage d = ImageIO.read(file);

        Pizza a = new Olive(new Corn(new Salami(new Mushroom(new Tomato(new PizzaBase())))));
        JFrame f = new JFrame("Pizza Time") {
            @Override
            public void paint(Graphics g) {
                a.bake(g);
            }
        };
        f.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        f.setSize(d.getWidth(),d.getHeight());


        f.setVisible(true);

        System.out.println("INGREDIENTS: "+a.getIngredients().toUpperCase());
        System.out.println("Price: "+a.getPrice()+" RON");
    }

}