//Szabo Robert-Istvan
//srim1761
//524/1

package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Slider;
import javafx.scene.control.TextField;

import java.util.ArrayList;
import java.util.HashMap;

public class Controller {

    HashMap<Integer, ArrayList<String>> hmap = new HashMap<Integer, ArrayList<String>>();

    @FXML
    Slider s;

    @FXML
    Label l;

    @FXML
    Button b1;

    @FXML
    Button b2;

    @FXML
    TextField name;

    @FXML
    TextField age;

    @FXML
    public void lw(){
        l.setText(""+(int)s.getValue());
    }

    @FXML
    public void add(){
        hmap.put((int)s.getValue(),array(name.getText(),(int)s.getValue()));
    }

    @FXML
    public void get(){
        System.out.println(hmap.get(Integer.parseInt(age.getText())));
    }

    private ArrayList<String> array(String name, int age){
        ArrayList<String> tmp = hmap.get(age);

        if (tmp == null){
            tmp = new ArrayList<String>();
        }

        if (tmp.contains(name))
            return tmp;

        tmp.add(name);

        return tmp;
    }
}
