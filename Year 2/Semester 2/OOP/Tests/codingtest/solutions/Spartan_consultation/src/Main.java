import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        try {
            System.out.print("Competition constructor check: ");
            List<Category> categories = new ArrayList<>();
            Competition comp = new Competition(2009, "salgo", categories);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - zero categories");
        }

        try {
            System.out.print("Competition constructor check: ");
            List<Category> categories = new ArrayList<>();
            categories.add(Sprint.getInstance());
            Competition comp = new Competition(1999, "salgo", categories);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - too small year");
        }

        try {
            System.out.print("Competition score check: ");
            List<Category> categories = new ArrayList<>();
            categories.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", categories);
            comp.Score(1, 1, 1, Super.getInstance());
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - nonexisting category");
        }

        try {
            System.out.print("Competition score check: ");
            List<Category> categories = new ArrayList<>();
            categories.add(Sprint.getInstance());
            Competition comp = new Competition(2009, "salgo", categories);
            comp.Score(1, 1, 1, Sprint.getInstance());
            comp.Score(1, 2, 1, Sprint.getInstance());
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - existing score");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(-2, 2, 1, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - negative min");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(2, -2, 1, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - negative sec");
        }

        try {
            System.out.print("Result constructor check: ");
            Result res = new Result(2, 60, 1, null);
            System.out.println("WRONG");
        } catch (Exception e) {
            System.out.println("OK - too big sec");
        }

        // Initialize categories for testing
        List<Category> categories = new ArrayList<>();
        categories.add(Sprint.getInstance());
        categories.add(Super.getInstance());

        // Create a competition with valid data
        Competition competition = new Competition(2001, "Salgotarjan", categories);
        System.out.println("Popular empty: " + (competition.PopularCat().Type().equals("sprint") ? "OK" : "WRONG"));

        boolean isWinner;
        int winnerId;

        // Test Winner with empty competition
        Tuple<Boolean, Integer> result = competition.Winner(Sprint.getInstance());
        isWinner = result.first;
        winnerId = result.second;
        System.out.println("Winner empty: " + (!isWinner ? "OK" : "WRONG"));

        // Add scores for the competition
        competition.Score(10, 8, 4, Super.getInstance());
        competition.Score(10, 8, 4, Sprint.getInstance());

        // Test Winner with scores
        result = competition.Winner(Sprint.getInstance());
        isWinner = result.first;
        winnerId = result.second;
        System.out.println("Winner 4: " + (isWinner && winnerId == 4 ? "OK" : "WRONG"));

        // More scores added
        competition.Score(10, 10, 1, Sprint.getInstance());
        competition.Score(20, 10, 1, Super.getInstance());

        // Test Popular Category and Winner after more scores
        System.out.println("Popular sprint: " + (competition.PopularCat().Type().equals("sprint") ? "OK" : "WRONG"));
        result = competition.Winner(Sprint.getInstance());
        isWinner = result.first;
        winnerId = result.second;
        System.out.println("Winner 1: " + (isWinner && winnerId == 4 ? "OK" : "WRONG"));

        // Further scores
        competition.Score(10, 7, 2, Super.getInstance());

        // Test Popular Category and Winner for Super category
        System.out.println("Popular super: " + (competition.PopularCat().Type().equals("super") ? "OK" : "WRONG"));
        result = competition.Winner(Super.getInstance());
        isWinner = result.first;
        winnerId = result.second;
        System.out.println("Winner 2: " + (isWinner && winnerId == 2 ? "OK" : "WRONG"));
    }
}
