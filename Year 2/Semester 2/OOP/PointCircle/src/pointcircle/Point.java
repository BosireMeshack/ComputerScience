package pointcircle;

public class Point {
    private double x;
    private double y;

    public Point(double a, double b) {
        this.x = a;
        this.y = b;
    }

    public double distance(Point p){
        return Math.sqrt(Math.pow(this.x - p.x, 2) + Math.pow(this.y - p.y, 2));
    }
}
