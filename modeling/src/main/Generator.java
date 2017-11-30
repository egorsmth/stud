package main;

import java.util.Random;

public class Generator {

    private Random random;
    private int timer;
    private int all;
    private int bound = 6;
    private int upperbound = bound + 3 + 1;
    private int lowerbound = bound - 3;

    public Generator() {
        this.random = new Random();
        this.timer = 1;
        this.all = 0;
    }

    public Package getPackage() {
        this.timer -= 1;
        if (this.timer == 0) {
            this.timer = this.random.nextInt(upperbound-lowerbound) + lowerbound;
            System.out.println(this.timer + " " + this.all);
            this.all += 1;
            return new Package();
        } else {
            return null;
        }
    }

    public int all() {
        return this.all;
    }
}
