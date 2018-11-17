//srim1761
//Szabo Robert
import java.awt.*;
import java.awt.event.*;

public class MyFrame3 extends Frame implements MouseListener{
    private Label lbl;
    private Button but1,but2;
    private List l1,l2;
    public MyFrame3(){
        l1 = new List();
        l2 = new List();
        l1.setMultipleMode(true);
        l2.setMultipleMode(true);
        l1.add("Egy");
        l1.add("Ketto");
        l1.add("Harom");
        l1.add("Negy");
        l1.add("Ot");
        l1.add("Hat");
        l2.add("Tiz");
        l2.add("Husz");
        l2.add("Harminc");
        l2.add("Negyven");
        l2.add("Otven");
        l2.add("Hatvan");
        but1 = new Button("<<");
        but2 = new Button(">>");
        setLayout(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.fill = GridBagConstraints.HORIZONTAL;
        this.add(l1,gbc);
        gbc.fill = GridBagConstraints.VERTICAL;
        this.add(but1,gbc);
        this.add(but2,gbc);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        this.add(l2,gbc);
        this.addWindowListener(
                new WindowAdapter() {
                    @Override
                    public void windowClosing(WindowEvent e) {
                        System.exit(0);
                    }
                }
        );
        but1.addMouseListener(this);
        but2.addMouseListener(this);
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        if(but1.isFocusOwner()){
            int n = l2.getSelectedIndexes().length;
            String [] a = l2.getSelectedItems();
            for (int i=0 ; i<n;i++){
                l1.add(a[i]);
                l2.remove(a[i]);
            }
        }
        if(but2.isFocusOwner()){
            int n = l1.getSelectedIndexes().length;
            String [] a = l1.getSelectedItems();
            for (int i=0 ; i<n;i++){
                l2.add(a[i]);
                l1.remove(a[i]);
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

