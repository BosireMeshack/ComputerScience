package Basics;
public class precedency {
    public static void main(String[] args) {
        int x = 10 * 5 + 2;
        int y = -2 + ++x;
        int z = true ? 1 : 0;
        System.out.println(x);
        System.out.println(y);
        System.out.println(z);
    }
}
