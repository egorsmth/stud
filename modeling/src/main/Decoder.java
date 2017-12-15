package main;

public class Decoder {
    public int all;
    public int fault;
    public int success;

    public Decoder() {
        this.all = 0;
        this.fault = 0;
        this.success = 0;
    }

    public void addPackage(Package pack) {
        if (pack.getTime() > 10) {
            this.fault += 1;
        }
        this.all += 1;
        this.success = this.all - this.fault;
    }

    public int getGetDeletedRatio() {
        if (this.fault > 0) {
            int result = (this.fault * 100) / this.all;
            return result;
        }
        return 0;
    }
}
