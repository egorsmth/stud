package main;

import g.Gui;

public class Main {

    public int all = 0;
    public int fault = 0;
    public int resource = 0;

    public void start() {
        long time = 0;
        long endTime = 10 * 1000;
        Generator generator = new Generator();
        Channel channelOne = new Channel();
        Channel channelTwo = new Channel();
        Decoder decoder = new Decoder();
        Resource resource = new Resource();
        while (time < endTime) {
            Package newPackage = generator.getPackage();
            if (newPackage != null) {
                channelOne.addPackage(newPackage);
            }
            Package package1 = channelOne.getPackage();
            if (package1 != null) {
                channelTwo.addPackage(package1);
            }
            Package package2 = channelTwo.getPackage();
            if (package2 != null) {
                decoder.addPackage(package2);
            }
            int ratio = decoder.getGetDeletedRatio();
            if (ratio > 30) {
                channelOne.addResource(resource);
                channelTwo.addResource(resource);
            } else {
                channelOne.deleteResource();
                channelTwo.deleteResource();
            }
            time += 1;
            channelOne.updatePackagesTime();
            channelTwo.updatePackagesTime();
        }

        this.all = decoder.all;
        this.fault = decoder.fault;
        this.resource = resource.getCalled();
    }

    public static void main(String[] args) {
        Gui dialog = new Gui();
        dialog.pack();
        dialog.setVisible(true);
        System.exit(0);
    }
}
