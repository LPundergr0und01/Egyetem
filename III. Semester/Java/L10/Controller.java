//srim1761
//524/1
//Szabo Robert

import java.util.Random;

public class Controller implements Runnable {
    private Model flower;
    private View view;

    public Controller(Model flower, View view) {
        this.flower = flower;
        this.view = view;
    }

    @Override
    public void run() {
        while (this.flower.getSize()<this.flower.getMaxSize()) {
            this.flower.add((new Random()).nextInt(10));
            this.view.repaint();

            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println("Done");
    }
}
