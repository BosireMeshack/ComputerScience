package Basics;

public class operators {
    public static void main(String[] args) {
        int x = 15;
        int y = 7;

        System.out.println(x + y);
        System.out.println(x - y);
        System.out.println(x * y);
        System.out.println(x / y); // int / int = int
        System.out.println(x % y);

        x += y; // x = x + y
        System.out.println(x);

        x *= y;
        System.out.println(x);

        x -= y;
        System.out.println(x);

        x /= y;
        System.out.println(x);

        //Precedence


        x = 15;
        y = 7;
        int z = 3;

        System.out.println(x+y*z);
        System.out.println((x + y) * z);

        /*
        Order of operator precedence
        1. Parentheses ()
        2. Exponents ^
        3. Multiplication *
        4. Division /
        5. Addition +
        6. Subtraction /
        PEMDAS!!
        Please Excuse My Dear Aunt Sally
         */
    }
}
