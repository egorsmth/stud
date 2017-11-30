package main;

public class Package {

    private int time;

    public Package() {
        this.time = 0;
    }

    public void tick() {
        this.time += 1;
    }

    public int getTime() {
        return this.time;
    }
}
