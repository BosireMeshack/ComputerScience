public class Super implements Category {

    private static Super instance;
    private Super() {}

    public static Super getInstance(){
        if(instance == null){instance = new Super();}
        return instance;
    }

    @Override
    public String Type(){
        return "super";
    }
}