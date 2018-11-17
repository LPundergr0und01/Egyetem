import javax.swing.*;
import java.time.*;
import javax.swing.event.MouseInputListener;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.time.format.DateTimeFormatter;

public class Fram1 extends JFrame implements MouseInputListener {

    private JLabel lbl;
    private JButton bt;
    public Fram1(){
        bt = new JButton("Get date!");
        lbl = new JLabel();
        this.setLayout(new BorderLayout());
        this.add(bt,BorderLayout.NORTH);
        this.add(lbl,BorderLayout.CENTER);
        this.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        bt.addMouseListener(this);
    }


    @Override
    public void mouseClicked(MouseEvent e) {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = now.format(formatter);
        lbl.setText(formatDateTime);
    }

    @Override
    public void mousePressed(MouseEvent e) {

    }

    @Override
    public void mouseReleased(MouseEvent e) {

    }

    @Override
    public void mouseEntered(MouseEvent e) {

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
