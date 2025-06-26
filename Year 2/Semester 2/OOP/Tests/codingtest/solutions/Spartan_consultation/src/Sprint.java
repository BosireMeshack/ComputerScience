public class Sprint implements Category {

    private static Sprint instance;
    private Sprint() {}

    public static Sprint getInstance(){
        if(instance == null){instance = new Sprint();}
        return instance;
    }

    @Override
    public String Type(){
        return "sprint";
    }
}
