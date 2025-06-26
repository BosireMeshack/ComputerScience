package pointcircle;

import java.util.ArrayList;

public class Main {
    
    public static void main(String[] args) {
        Disc disc = new Disc(new Point(0, 0), 1);
        
        ArrayList<Point> points = new ArrayList<>();
        points.add(new Point(0, 0));
        points.add(new Point(1, 0));
        points.add(new Point(0, 1));
        points.add(new Point(0, 2));
        
        long count = 0;
        for (var p : points) {
            if (disc.contains(p)) {
                count++;
            }
        }
        System.out.println("There are " + count + " points in the circle.");
        
        count = points.stream().filter((p) -> {return disc.contains(p);}).count();
        System.out.println("There are " + count + " points in the circle.");

        count = points.stream().filter(p -> disc.contains(p)).count();        
        System.out.println("There are " + count + " points in the circle.");
        
    }
}
