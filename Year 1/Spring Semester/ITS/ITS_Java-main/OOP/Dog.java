package OOP;

public class Dog extends Animal {
    private String name;

    public Dog(String name, String sound) {
        super(name, sound);
        this.name = name;
    }

    public void wagTail() {
        System.out.println(name + " wags tail happily.");
    }

}
