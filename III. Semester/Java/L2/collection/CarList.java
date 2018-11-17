//Szabo Robert


package collection;
import core.*;

public class CarList {
    private int current;
    private Car cars[];
    public CarList(int size){
        cars = new Car[size];
        current = 0;
    }

    public void addCar(Car c){
        if (current < cars.length){
            cars[current++] = c;
        }
        else {
            System.out.printf("Full");
        }
    }

    public CarIterator getIterator(){
        CarIterator c = new CarIterator();
        return c;
    }

    public class CarIterator{
        protected int index;
        public CarIterator(){
            index = 0;
        }

        public Car nextElement(){
            return cars[index++];
        }

        public boolean hasMoreElements(){
            return current>index;
        }
    }

}

