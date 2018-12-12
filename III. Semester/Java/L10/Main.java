//srim1761
//524/1
//Szabo Robert
import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Random;

public class Main {

    public static void main(String args[]) {
        ArrayList<Model> x = new ArrayList<>();
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));
        x.add(new Model((new Random()).nextInt(250),(new Random()).nextInt(250)+250));

        ArrayList<View> v = new ArrayList<>();

        for (Model k : x) {
            v.add(new View(k));
        }

        for (View k : v) {
            k.setBackground(new Color(100,40,10));
        }

        JPanel p = new JPanel(new GridLayout());

        JFrame f = new JFrame("Viragoskert");
        f.setLayout(new BorderLayout());
        f.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        f.setSize(600,600);

        for (View k : v) {
            p.add(k);
        }

        f.add(p,BorderLayout.CENTER);

        ArrayList<Controller> c = new ArrayList<>();

        for (int i=0; i<x.size(); i++) {
            c.add(new Controller(x.get(i),v.get(i)));
        }



        ArrayList<Thread> t = new ArrayList<>();

        for (Controller k : c) {
            t.add(new Thread(k));
        }

        f.setVisible(true);

        for (Thread k : t) {
            k.start();
        }
    }
}
