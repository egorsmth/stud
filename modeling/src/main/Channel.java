package main;

import java.util.LinkedList;
import java.util.Queue;


public class Channel {

    private Queue<Package> packages;
    private int res_help;
    private int speed;
    private int counter;
    private boolean resourceAdded;

    public Channel(int res_help) {
        this.res_help = res_help;
        this.speed = 5;
        this.counter = this.speed;
        this.packages = new LinkedList<Package>();
    }

    public void addPackage(Package newPackage) {
        if (this.packages.isEmpty()) {
            this.counter = this.speed;
        }
        this.packages.add(newPackage);
    }

    public Package getPackage() {

        if (this.counter < 1) {
            this.counter = this.speed;
            this.counter -= 1;
            return this.packages.poll();
        }
        this.counter -= 1;
        return null;
    }

    public void updatePackagesTime()
    {
        for (Package pack : this.packages) {
            pack.tick();
        }
    }

    public void addResource() {
        if (this.resourceAdded) {
            return;
        }
        this.resourceAdded = true;
        this.speed = this.speed - this.res_help;
        if (this.counter > 0) {
            this.counter -= this.res_help;
        }
    }

    public void deleteResource() {
        this.speed = 5;
        this.resourceAdded = false;
    }
}
