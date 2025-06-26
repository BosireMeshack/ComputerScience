import java.util.ArrayList;
import java.util.List;

public class Competition {
    private int year;
    private String place;
    private List<Category> cat;
    private List<Result> res = new ArrayList<>();
    private List<Competitor> competitors = new ArrayList<>();

    public Competition(int y, String p, List<Category> c) throws Exception {
        if (c.size() == 0 || y <= 2000){
            throw new Exception();
        }
        this.year = y; this.place = p; this.cat = c;
    }

    public Category PopularCat(){
        Category popularCat = cat.get(0);
        int maxCnt = 0;

        //OUTER FOR -> MAX
        for(Category e : cat){
            int count = 0;

            //INNER FOR -> SUM
            for(Result e2: res){
                if(e2.Cat().Type().equals(e.Type())){
                    count++;
                }
            }

            if(count > maxCnt){
                maxCnt = count;
                popularCat = e;
            }
        }

        return popularCat;
    }

    public void Score(int min, int sec, int num, Category c) throws Exception{
        boolean l = false;
        Competitor elem = null;
        for(Competitor e: competitors){
            if(e.ID() == num){l = true; elem = e; break;}
        }

        boolean l2 = false;
        for(Category e: cat){
            if(e==c){l2 = true; break;}
        }
        if(!l2){throw new Exception();}

        boolean l3 = false;
        for(Result  e: res){
            if(e.Cat() == c && e.Comp().ID() == num){
                l3 = true; break;
            }
        }
        if(l3){
            throw new Exception();
        }

        res.add(new Result(min, sec, elem, c));
    }

    public Tuple<Boolean, Competitor> Winner(Category c, boolean man) {
        Competitor winner = null;
        int minTime = Integer.MAX_VALUE;

        for (Result res : this.res) {
            if (res.Cat().Type().equals(c.Type()) && res.Comp().Man() == man) {
                int time = res.Min() * 60 + res.Sec();
                if (time < minTime) {
                    winner = res.Comp();
                    minTime = time;
                }
            }
        }

        return new Tuple<>(winner != null, winner);
    }

    public void Register(Competitor c) throws Exception{
        boolean l = false;
        for(Competitor e: competitors){
            if(e.ID() == c.ID()){
                l = true; break;
            }
        }
        if(l){throw new Exception();}
        competitors.add(c);
        c.SetCompetition(this);
    }
}
