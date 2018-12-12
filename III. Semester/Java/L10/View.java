//srim1761
//524/1
//Szabo Robert
import javax.swing.*;
import java.awt.*;
import java.util.Random;

public class View extends JPanel {
    private Model f;

    public View(Model f) {
        this.f = f;
    }

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Random r = new Random();

        g.setColor(Color.GREEN);
        g.drawLine(25,this.getHeight(),25, (int) (this.getHeight()-f.getSize()));

        g.setColor(this.f.getC());
        g.fillOval(0, (int) (this.getHeight()-this.f.getSize()-40),50,40);

    }
}
