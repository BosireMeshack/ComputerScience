public class Marathon {
    public static Marathon instance;

    private Marathon () {};

    public static Marathon getInstance()
    {

        if (instance == null)
        {
            instance = new Marathon();
        }

        return instance;
    }
    
}
