package OOP;

public class Animal {
    private String name;
    private String sound;

    // Constructor
    public Animal(String name, String sound){
        this.name = name;
        this.sound = sound;
    }
    public Animal(String name){
        this.name = name;
        this.sound = "woof";
    }
    public Animal(){
        this.name = "Brutus";
        this.name = "woof";
    }
    public void makeSound(){
        System.out.println(sound + " from " + name);
    }
}
