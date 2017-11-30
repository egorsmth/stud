package main;

public class Resource {
    private int called;

    public Resource() {
        this.called = 0;
    }
    public void call()
    {
        this.called += 1;
    }
    public int getCalled()
    {
        return this.called;
    }
}
