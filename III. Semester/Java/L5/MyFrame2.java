//srim1761
//Szabo Robert
import java.awt.*;
import java.awt.event.*;

public class MyFrame2 extends Frame implements MouseListener{
    private Label lbl;
    private Button but;
    private TextField tf;
    private TextArea ta;
    public MyFrame2(){
        tf = new TextField("ma",20);
        but = new Button("Filter");
        ta = new TextArea("Almafakorte",20,20);
        this.setLayout(new BorderLayout());
        this.add(tf,BorderLayout.WEST);
        this.add(but,BorderLayout.CENTER);
        this.add(ta,BorderLayout.EAST);
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
        ta.setText(ta.getSelectedText().replace(tf.getText(),""));
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

