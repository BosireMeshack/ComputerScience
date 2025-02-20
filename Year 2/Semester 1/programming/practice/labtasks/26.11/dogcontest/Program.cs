//Console.WriteLine("Hello, World!");

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Give the number of dogs and criteria separated by space");
        string line = Console.ReadLine();
        int n = Convert.ToInt32(line.Split(" ")[0]);
        int m = Convert.ToInt32(line.Split(" ")[1]);

        //Console.WriteLine("Give the maximum and minimum scores");
        
        //int[,] maxandminscores = new int[2,m];
        //Console.WriteLine("Give the maximum scores and minimum scores");
        int[] maximum_scores = new int[m];
        //int[] minimum_scores = new int[m];

        string input = Console.ReadLine();
       
        for(int j=0;j<m;j++)
            {
                maximum_scores[j] = Convert.ToInt32(input.Split(" ")[j]);
            }
        int[] minimum_scores = new int[m];
        
        string input2 = Console.ReadLine();
        for(int j=0;j<m;j++)
            {
                minimum_scores[j] = Convert.ToInt32(input2.Split(" ")[j]);
            }

        int[,] dogs = new int[n,m];
        // int[] minimum_scores = new int[m];

        for(int i=0; i<n; i++)
        {
            string input1 = Console.ReadLine();
            for(int j=0;j<m;j++)
            {
                dogs[i,j] = Convert.ToInt32(input1.Split(" ")[j]);
            }
        } 
         
         // SOLVING THE TASK
         List<int> just_passing = new List<int>();
         for (int i=0; i<n;i++)
         {
            for(int j=0; j<m; j++)
            {
                if(dogs[i,j]==minimum_scores[j])
                {
                    just_passing.Add(i+1);
                    break;
                }
            }
         }
        //  //printing to the console
        // number of dogs passing with minimum scores 
         Console.Write(just_passing.Count());
         // indices of dogs that passed with minimum scores
         for(int i=0; i<just_passing.Count(); i++)
         {
            Console.Write(" "+just_passing[i]);
         }
    }
}