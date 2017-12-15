package main;

import g.Gui;

public class Main {

    public int all = 0;
    public int fault = 0;
    public int resource = 0;
    public int success = 0;

    public void start(int runs, int gen_base, int res_help, int procent) {
        int total_runs_all = 0;
        int total_runs_fault = 0;
        int total_runs_successs = 0;
        int total_runs_resource = 0;

        for (int i = 0; i < runs; i++) {
            long time = 0;
            long endTime = 10 * 1000;
            Generator generator = new Generator(gen_base);
            Channel channelOne = new Channel(res_help);
            Channel channelTwo = new Channel(res_help);
            Decoder decoder = new Decoder();
            Resource resource = new Resource();
            while (time < endTime || generator.all() > decoder.all) {
                Package newPackage = null;
                if (time < endTime) {
                    newPackage = generator.getPackage();
                }

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
                if (ratio > procent) {
                    channelOne.addResource();
                    channelTwo.addResource();
                    resource.call();
                } else {
                    channelOne.deleteResource();
                    channelTwo.deleteResource();
                }
                time += 1;
                channelOne.updatePackagesTime();
                channelTwo.updatePackagesTime();
            }

            total_runs_all += generator.all();
            total_runs_fault += decoder.fault;
            total_runs_successs += decoder.success;
            total_runs_resource += resource.getCalled();
        }

        this.all = total_runs_all/runs;
        this.fault = total_runs_fault/runs;
        this.success = total_runs_successs/runs;
        this.resource = total_runs_resource/runs;
    }

    public static void main(String[] args) {
        Gui dialog = new Gui();
        dialog.pack();
        dialog.setVisible(true);
        System.exit(0);
    }
}
