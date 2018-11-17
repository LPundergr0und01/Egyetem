//Szabo Robert
package core;

public class Car extends Vehicle {
    private float perf;
    public Car(String t,int a, float p){
        super(t,a);
        perf = p;
    }

    public void setPerformance(float p){
        perf = p;
    }

    public float getPerformance(){
        return perf;
    }
    public String toString(){
        return type + " " + age  + " " + perf;
    }
}