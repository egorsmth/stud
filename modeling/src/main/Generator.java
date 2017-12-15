package main;

import java.util.Random;

public class Generator {

    private Random random;
    private int timer;
    private int all;
    private int bound;
    private int upperbound;
    private int lowerbound;

    public Generator(int base) {

        this.random = new Random();
        this.bound = base;
        this.upperbound = this.bound + 3 + 1;
        this.lowerbound = this.bound - 3;
        this.timer = 1;
        this.all = 0;
    }

    public Package getPackage() {
        this.timer -= 1;
        if (this.timer <= 0) {
            this.timer = this.random.nextInt(upperbound-lowerbound) + lowerbound;
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
