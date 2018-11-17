import javax.swing.*;
import java.awt.*;

public class Mypanel extends JPanel {
    private int circle_x =150;
    private int circle_y =170;
    public int circle_size = 50;
    public int spd = 10;
    public Color c = new Color(255,0,0);
    public Color bc = new Color(255, 255, 255);

    public Mypanel() {
        this.setVisible(true);
        this.setSize(100,100);
        this.setBackground(bc);
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.create(this.getWidth()/2,this.getHeight()/2,this.getWidth(),this.getHeight());
        g.setColor(c);
        g.fillOval(circle_x,circle_y,circle_size,circle_size);
        this.repaint();
    }

    public void setCircle_x(int circle_x) {
        this.circle_x = circle_x;
    }

    public void setCircle_y(int circle_y) {
        this.circle_y = circle_y;
    }

    public int getCircle_x() {
        return circle_x;
    }

    public int getCircle_y() {
        return circle_y;
    }
}