public class Result {
    private int min;
    private int sec;
    private int id;
    private Category cat;
    private Competitor comp;

    public Result(int m, int s, Competitor c, Category cat) throws Exception{
        if(m<=0 || s<0 || s>59){throw new Exception();}
        this.min = m; this.sec = s; this.comp= c; this.cat = cat;
    }

    public Category Cat(){
        return cat;
    }

    public int ID(){
        return id;
    }

    public int Min(){
        return min;
    }

    public int Sec(){
        return sec;
    }

    public Competitor Comp(){
        return comp;
    }
}

