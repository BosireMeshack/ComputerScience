package OOP;

public class Main {
    /* 
     * 
     *  inheritance example
     * 
    */
    public static void main(String[] args) {
        Cat cat = new Cat("Snowball", "meow");
        Dog dog = new Dog("Doggo", "woof");

        cat.makeSound();
        dog.makeSound();

        cat.purr();
        dog.wagTail();
    }
}
