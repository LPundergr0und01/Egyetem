//Szabo Robert

package core;
import core.*;

public class Car implements Vehicle {
    private String type;
    private int age;

    public Car(String type, int age) {
        this.type = type;
        this.age = age;
    }


    @Override
    public String toString() {
        return "type= " + type  +
                ", age= " + age;
    }

    public void numberOfWheels(){
        System.out.println("4 wheels");
    }
}
