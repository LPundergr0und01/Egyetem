//srim1761
//Szabo Robert
//524/1

import java.awt.*;

public class PizzaIngredient implements Pizza {
    protected Pizza pizza;

    public PizzaIngredient(Pizza x) {
        this.pizza = x;
    }

    @Override
    public void bake(Graphics g) {
        this.pizza.bake(g);
    }

    @Override
    public int getPrice() {
        return this.pizza.getPrice();
    }

    @Override
    public String getIngredients() {
        return this.pizza.getIngredients();
    }
}