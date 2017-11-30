package main;

import java.util.Random;

public class Generator {

    private Random random;
    private int timer;

    public Generator() {
        this.random = new Random();
        this.timer = 1;
    }

    public Package getPackage() {
        this.timer -= 1;
        if (this.timer == 0) {
            this.timer = this.random.nextInt(7) + 3;
            System.out.println(this.timer);
            return new Package();
        } else {
            return null;
        }
    }
}
