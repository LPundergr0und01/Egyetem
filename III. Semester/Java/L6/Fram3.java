import javax.swing.*;
import javax.swing.event.MouseInputListener;
import java.awt.event.MouseEvent;
import java.util.Random;

public class Fram3 extends JFrame implements MouseInputListener {
    private JButton bt;
    private JPanel pn;
    private Random r = new Random();
    public Fram3(){
        pn = new JPanel(null);
        bt = new JButton("Push Me!");
        pn.setBounds(0,0,this.getWidth(),this.getHeight());
        bt.setSize(95,30);
        bt.setLocation(50,100);
        this.add(pn);
        pn.add(bt);
        this.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        this.setBounds(0,0,300,300);
        this.setVisible(true);
        bt.addMouseListener(this);
    }

    @Override
    public void mouseClicked(MouseEvent e) {

    }

    @Override
    public void mousePressed(MouseEvent e) {

    }

    @Override
    public void mouseReleased(MouseEvent e) {

    }

    @Override
    public void mouseEntered(MouseEvent e) {
        int x = r.nextInt(this.getWidth()-100);
        int y = r.nextInt(this.getHeight()-100);
        bt.setLocation(x,y);
    }

    @Override
    public void mouseExited(MouseEvent e) {

    }

    @Override
    public void mouseDragged(MouseEvent e) {

    }

    @Override
    public void mouseMoved(MouseEvent e) {

    }
}
