import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        try {
            System.out.print("Competition constructor check: ");
            List<Category> cat = new ArrayList<>();
            Competition comp = new Competition(2009, "salgo", cat);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - zero categories");
        }

        try {
            System.out.print("Competition constructor check: ");
            List<Category> cat = new ArrayList<>();
            cat.add(Sprint.getInstance());
            Competition comp = new Competition(1999, "salgo", cat);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - too small year");
        }

        try {
            System.out.print("Competition register check: ");
            List<Category> cat = new ArrayList<>();
            cat.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", cat);
            comp.Register(new Competitor(1, "", true));
            comp.Register(new Competitor(1, "", true));
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - existing ID");
        }

        try {
            System.out.print("Competition score check: ");
            List<Category> cat = new ArrayList<>();
            cat.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", cat);
            comp.Register(new Competitor(1, "", true));
            comp.Score(1, 1, 1, Super.getInstance());
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - nonexisting category");
        }

        try {
            System.out.print("Competition score check: ");
            List<Category> cat = new ArrayList<>();
            cat.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", cat);
            comp.Register(new Competitor(1, "", true));
            comp.Score(1, 1, 2, Sprint.getInstance());
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - nonexisting ID");
        }

        try {
            System.out.print("Competition score check: ");
            List<Category> cat = new ArrayList<>();
            cat.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", cat);
            comp.Register(new Competitor(1, "", true));
            comp.Score(1, 1, 1, Sprint.getInstance());
            comp.Score(1, 2, 1, Sprint.getInstance());
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - existing ID");
        }

        try {
            System.out.print("Competitor constructor check: ");
            Competitor comp = new Competitor(-2, "", true);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - negative ID");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(-2, 2, null, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - negative min");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(2, -2, null, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - negative sec");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(2, 60, null, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - too big sec");
        }

        // Setup categories and competition
        List<Category> cat2 = new ArrayList<>();
        cat2.add(Sprint.getInstance());
        cat2.add(Super.getInstance());
        Competition comp2 = new Competition(2001, "Salgotarjan", cat2);

        // Register competitors
        List<Competitor> competitors = new ArrayList<>();
        competitors.add(new Competitor(1, "A", true)); comp2.Register(competitors.get(0));
        competitors.add(new Competitor(2, "B", true)); comp2.Register(competitors.get(1));
        competitors.add(new Competitor(3, "C", true)); comp2.Register(competitors.get(2));
        competitors.add(new Competitor(4, "D", false)); comp2.Register(competitors.get(3));
        competitors.add(new Competitor(5, "E", false)); comp2.Register(competitors.get(4));
        competitors.add(new Competitor(6, "F", false)); comp2.Register(competitors.get(5));

        System.out.println("Popular empty: " + (comp2.PopularCat().Type().equals("sprint") ? "OK" : "WRONG"));

        boolean l;
        Competitor winner;
        comp2.Score(10, 8, 4, Super.getInstance());
        comp2.Score(10, 8, 4, Sprint.getInstance());
        System.out.println("not IsWinner 0: " + (!competitors.get(0).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));
        System.out.println("IsWinner 1: " + (competitors.get(3).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));

        Tuple<Boolean, Competitor> result = comp2.Winner(Sprint.getInstance(), true);
        l = result.first;
        winner = result.second;
        System.out.println("Winner empty: " + (l ? "WRONG" : "OK"));

        comp2.Score(10, 10, 1, Sprint.getInstance());
        comp2.Score(20, 10, 1, Super.getInstance());
        System.out.println("Popular 1: " + (comp2.PopularCat().Type().equals("sprint") ? "OK" : "WRONG"));
        result = comp2.Winner(Sprint.getInstance(), true);
        l = result.first;
        winner = result.second;
        System.out.println("Winner 1: " + ((l && winner.ID() == 1) ? "OK" : "WRONG"));

        System.out.println("not IsWinner 0: " + (!competitors.get(2).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));
        System.out.println("IsWinner 1: " + (competitors.get(0).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));

        comp2.Score(10, 9, 2, Super.getInstance());
        System.out.println("Popular super: " + (comp2.PopularCat().Type().equals("super") ? "OK" : "WRONG"));
        result = comp2.Winner(Super.getInstance(), true);
        l = result.first;
        winner = result.second;
        System.out.println("Winner 2: " + ((l && winner.ID() == 2) ? "OK" : "WRONG"));
        System.out.println("IsWinner 2: " + (competitors.get(3).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));

        System.out.println("not IsWinner 2: " + (!competitors.get(0).IsWinner(Super.getInstance()) ? "OK" : "WRONG"));
    }
}
