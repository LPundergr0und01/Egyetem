//srim1761
//Szabo Robert
import java.awt.*;
import java.awt.event.*;
import java.util.Random;

public class MyFrame extends Frame implements MouseListener{
    private Label lbl;
    private Button but;
    private Choice ch;
    public MyFrame(){
        ch = new Choice();
        ch.add("Red");
        ch.add("Green");
        ch.add("Blue");
        ch.add("Random");
        but = new Button("Submit");
        this.setLayout(new FlowLayout());
        this.add(ch);
        this.add(but);
        this.addWindowListener(
                new WindowAdapter() {
                    @Override
                    public void windowClosing(WindowEvent e) {
                        System.exit(0);
                    }
                }
        );
        but.addMouseListener(this);
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        String a = ch.getSelectedItem();
        switch (a){
            case "Red": {
                this.setBackground(Color.RED);
                break;
            }
            case "Green": {
                this.setBackground(Color.GREEN);
                break;
            }
            case "Blue" : {
                this.setBackground(Color.BLUE);
                break;
            }
            case "Random": {
                int r = (int )(Math.random() * 255 );
                int g = (int )(Math.random() * 255 );
                int b = (int )(Math.random() * 255 );
                Color c = new Color(r,g,b);
                this.setBackground(c);
                break;
            }
        }
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

}
