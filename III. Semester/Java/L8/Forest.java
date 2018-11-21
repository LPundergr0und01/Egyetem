//Szabo Robert
//srim1761
//524/1

import java.util.ArrayList;

public class Forest implements Plant {
    private ArrayList<Plant> elems = new ArrayList<Plant>();

    public void add(Plant x) {
        this.elems.add(x);
    }

    public void remove(Plant x) {
        this.elems.remove(x);
    }

    public Plant getChild(int i) {
        return this.elems.get(i);
    }

    @Override
    public float getOxigenAmountPerYear() {
        float sum = 0;
        for (Plant x : this.elems) {
            sum += x.getOxigenAmountPerYear();
        }

        return sum;
    }

    @Override
    public int getLifeTime() {
        int max = 0;
        for (Plant x : this.elems) {
            if (x.getLifeTime()>max) max = x.getLifeTime();
        }

        return max;
    }
}