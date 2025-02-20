package OOP;

public class Cat extends Animal {

    private String name;

    public Cat(String name, String sound) {
        super(name, sound);
        this.name = name;
    }

    public void purr() {
        System.out.println(name + " purrs softly.");
    }
    
}
