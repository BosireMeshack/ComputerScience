public class Beast implements Category {

    private static Beast instance;
    private Beast() {}

    public static Beast getInstance(){
        if(instance == null){instance = new Beast();}
        return instance;
    }

    @Override
    public String Type(){
        return "beast";
    }
}