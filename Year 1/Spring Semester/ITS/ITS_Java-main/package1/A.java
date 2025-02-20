package package1;
import package2.*;

public class A {
    protected String protectedString = "This is protected";
    public static void main(String[] args) {
        C c = new C();
        System.out.println(c.defaultMessage);
        System.out.println(c.publicMessage);
    }
}
