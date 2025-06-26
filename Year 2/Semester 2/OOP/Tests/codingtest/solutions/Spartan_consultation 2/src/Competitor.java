public class Competitor {
    private int id;
    private String name;
    private boolean man;
    private Competition competition;


    public Competitor(int id, String n, boolean m) throws Exception{
        if(id<=0){throw new Exception();}
        this.id = id; this.name = n; this.man = m;
    }

    public int ID(){
        return id;
    }

    public boolean Man(){
        return man;
    }

    public boolean IsWinner(Category c){
        boolean l=false;
        Competitor comp;
        Tuple<Boolean, Competitor> winner = competition.Winner(c,l);
        l=winner.first;
        comp = winner.second;
        return l;
    }

    public void SetCompetition(Competition c){
        competition = c;
    }
}
