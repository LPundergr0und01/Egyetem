//Szabo Robert
import core.*;
import collection.*;

public class Main {
    public static void main(String args[]) {
        Vehicle a = new Airplane("Boeing747",2,747);
        Vehicle b = new Car ("Audi",3);
        Vehicle c = new Car("Tesla",'5');
        Vehicle d = new Airplane("Boeing777",1,999);
        VehicleList v = new VehicleList(5);
        v.addVehicle(a);
        v.addVehicle(b);
        v.addVehicle(c);
        v.addVehicle(d);
        VehicleIterator i = v.getForwardIterator();
        while (i.hasMoreElements()){
            Vehicle temp = i.nextElement();
            temp.numberOfWheels();
            System.out.println(temp);
        }

        System.out.println();
        System.out.println();

        VehicleIterator j = v.getBackwardIterator();

        while (j.hasMoreElements()){
            Vehicle temp = j.nextElement();
            temp.numberOfWheels();
            System.out.println(temp);
        }


    }
}