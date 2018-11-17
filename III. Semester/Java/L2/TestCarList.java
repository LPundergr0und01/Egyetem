//Szabo Robert

import core.*;
import collection.*;

public class TestCarList {
    public static void main(String args[]){
        Car c = new Car ("Tesla",1,1.9f);
        CarList l = new CarList(5);
        l.addCar(c);
        l.addCar(new Car("Opel",3,2.9f));
        l.addCar(new Car("Porsche",1,0.9f));
        CarList.CarIterator i = l.getIterator();
        while (i.hasMoreElements()){
            Car a = i.nextElement();
            System.out.println(a);
        }
    }
}