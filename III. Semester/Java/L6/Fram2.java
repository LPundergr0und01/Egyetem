import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Fram2 extends JFrame {
    private Mypanel mp;
    private int cx,cy;
    private JButton up,down,left,right;
    private int sz,m;
    public Fram2(){
        JButton up = new JButton("Up");
        JButton down = new JButton("Down");
        JButton left = new JButton("Left");
        JButton right = new JButton("Right");
        this.setBounds(0,0,500,500);
        this.setVisible(true);
        Mypanel mp = new Mypanel();
        this.add(up,BorderLayout.NORTH);
        this.add(down,BorderLayout.SOUTH);
        this.add(left,BorderLayout.WEST);
        this.add(right,BorderLayout.EAST);
        this.add(mp,BorderLayout.CENTER);
        this.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        up.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (mp.getCircle_y() > 0) {
                    mp.setCircle_y(mp.getCircle_y() - 10);
                    repaint();
                }
            }
        });
        down.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (mp.getCircle_y() < 350) {
                    mp.setCircle_y(mp.getCircle_y() + 10);
                    repaint();
                }
            }
        });
        left.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (mp.getCircle_x() > 10) {
                    mp.setCircle_x(mp.getCircle_x() - 10);
                    repaint();
                }
            }
        });
        right.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (mp.getCircle_x() < 310) {
                    mp.setCircle_x(mp.getCircle_x() + 10);
                    repaint();
                }

            }
        });
    }

}


