//Szabo Robert

import collection.MyHashMap;
import core.Car;

public class Main {
    public static void main(String[] argv){
        Car car1 = new Car("Toyota",10);
        Car car2 = new Car("Suzuki", 9);
        Car car3 = new Car("Mitsubishi",3);
        Car car4 = new Car("Nissan", 6);

        MyHashMap uj = new MyHashMap(3);
        uj.put(1406,car1);//2
        uj.put(2012,car2);//2
        uj.put(3013,car3);//1
        uj.put(8493,car4);//0

        System.out.println(uj.get(1406));
        System.out.println(uj.get(8493));
        System.out.println(uj.get(3013));
        System.out.println(uj.get(2012));
        System.out.println(uj.get(1340));  // nem létező elem lekérdezése; null-ot kell visszatérítsen

        System.out.println(uj.containsKey(3013));
        System.out.println(uj.containsKey(1340));
    }
}
