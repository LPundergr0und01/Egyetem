//Szabo Robert

package core;
import core.*;

public class Airplane implements Vehicle {
    private String type;
    private int age;
    private float length;

    public Airplane(String type, int age, float length) {
        this.type = type;
        this.age = age;
        this.length = length;
    }

    @Override
    public String toString() {
        return "type= " + type +
                ", age= " + age +
                ", length= " + length ;
    }

    public void numberOfWheels(){
        System.out.println("6 wheels");
    }
}
