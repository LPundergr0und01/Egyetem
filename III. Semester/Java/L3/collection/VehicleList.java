//Szabo Robert

package collection;

import core.*;

public class VehicleList {
    private int current;
    private Vehicle vehicles[];

    public class VehicleForwardIterator implements VehicleIterator{
        private int index;

        @Override
        public boolean hasMoreElements() {
            return (index<current);
        }

        @Override
        public Vehicle nextElement() {
            return vehicles[index++];
        }

        public VehicleForwardIterator() {
            index = 0;
        }
    }

    public class VehicleBackwardIterator implements VehicleIterator{
        private int index;

        public  VehicleBackwardIterator(){
            index = current - 1;
        }

        @Override
        public boolean hasMoreElements() {
            return (index>=0);
        }

        @Override
        public Vehicle nextElement() {
            return vehicles[index--];
        }
    }

    public VehicleList(int current) {
        vehicles = new Vehicle[current];
        this.current = 0;
    }

    public void addVehicle(Vehicle v){
        if (current < vehicles.length){
            vehicles[current++] = v;
        }
        else
            System.out.println("List is full");
    }

    public VehicleIterator getForwardIterator(){
        VehicleIterator i = new VehicleForwardIterator();
        return i;
    }

    public VehicleIterator getBackwardIterator(){
        VehicleIterator i = new VehicleBackwardIterator();
        return i;
    }
}
