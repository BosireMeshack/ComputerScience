package pointcircle;

public class Disc {
    private Point c;
    private double r;

    public Disc(Point p, double a) {
        if(a <= 0 ) throw new IllegalArgumentException();
        this.c = p;
        this.r = a;
    }
    public boolean contains(Point p) {
        return this.c.distance(p) <= this.r;
    }
}