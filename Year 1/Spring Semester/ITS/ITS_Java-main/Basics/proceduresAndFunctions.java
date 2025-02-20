package Basics;

public class proceduresAndFunctions {

    public static void add(int x, int y) {
        int sum = x + y;
        System.out.println("The sum of " + x + " and " + y + " is " + sum);
    }

    public static int addFunc(int x,int y){
        return (x + y);
    }

    public static void main(String[] args) {
        add(10, 20);
        int x = addFunc(10, 20);
        System.out.println(x);
    }
}
