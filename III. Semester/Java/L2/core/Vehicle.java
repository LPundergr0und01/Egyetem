//Szabo Robert
package core;

public class Vehicle {
    protected String type;
    protected int age;
    public Vehicle(String t, int a){
        type = t;
        age = a;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}