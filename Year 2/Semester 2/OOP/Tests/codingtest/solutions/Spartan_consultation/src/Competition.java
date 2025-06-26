import java.util.ArrayList;
import java.util.List;

public class Competition {
    private int year;
    private String place;
    private List<Category> cat;
    private List<Result> res = new ArrayList<>();

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
        boolean l2 = false;
        for(Category e: cat){
            if(e==c){l2 = true; break;}
        }
        if(!l2){throw new Exception();}

        boolean l3 = false;
        for(Result  e: res){
            if(e.Cat() == c && e.ID() == num){
                l3 = true; break;
            }
        }
        if(l3){
            throw new Exception();
        }

        res.add(new Result(min, sec, num, c));
    }

    public Tuple<Boolean, Integer> Winner(Category c){
        Result winner = null;
        int minT = Integer.MAX_VALUE;

        for(Result e: res){
            if(e.Cat() == c){
                int totalTime = e.Min()*60 + e.Sec();
                if(totalTime < minT){
                    winner = e;
                    minT = totalTime;
                }
            }
        }

        //RETURNING RESULT TUPLE WITHOUT TERNARY
        Tuple<Boolean, Integer> result;
        if(winner == null){
            result = new Tuple<>(false, Integer.MIN_VALUE);
        }else{
            result = new Tuple<>(true, winner.ID());
        }

        return result;

        //RETURNING RESULT USING TERNARY(LESS CODE : SAME LOGIC)
//        return winner == null?new Tuple<>(false, Integer.MIN_VALUE):new Tuple<>(true, winner.ID());
    }
}
