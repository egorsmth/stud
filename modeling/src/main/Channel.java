package main;

import java.util.LinkedList;
import java.util.Queue;


public class Channel {

    private Queue<Package> packages;
    private int speed;
    private int counter;
    private boolean resourceAdded;

    public Channel() {
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

        if (this.counter == 0) {
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

    public void addResource(Resource resource) {
        if (this.resourceAdded) {
            return;
        }
        resource.call();
        this.resourceAdded = true;
        this.speed = 4;
        if (this.counter > 0) {
            this.counter -= 1;
        }
    }

    public void deleteResource() {
        this.speed = 5;
        this.resourceAdded = false;
    }
}
