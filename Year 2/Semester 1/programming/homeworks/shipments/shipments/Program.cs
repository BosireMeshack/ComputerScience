internal class Program
{
    
//SHIPMENTS A
        static int maxV(int i, int[,] s, int n)
        {
            int maxind = 0;

            for(int j = 1; j < n; j++)
            {
                if (s[i, j] > s[i,maxind])
                {
                    maxind = j;
                }
            }
            return s[i,maxind];
        }

//SHIPMENTS B
        static int sumV(int i, int[,] s, int n)
        {
            int sum = 0;

            for(int j=0; j < n; j++)
            {
                sum += s[i,j];
            }
            return sum;
        }
    private static void Main(string[] args)
    {
         //1st line of the input: contains the count of months and number of shipments
            Console.WriteLine("Give the count of months and number of shipments!");
            string input = Console.ReadLine();
            int m = Convert.ToInt32(input.Split(' ')[0]);
            int n = Convert.ToInt32(input.Split(' ')[1]);
            //shipments:
            Console.WriteLine("Give the number of items in each shipment:");
            //creating a matrix with m rows and n columns
            int[,] s = new int[m, n];
            //filling the matrix with 2 for-loops (nested for loop)
            for (int i = 0; i < m; i++)//going through the rows with the outer for loop
            {
                string line = Console.ReadLine();//g1etting the i. line (row) of the data
                for (int j = 0; j < n; j++)//going through the columns with the inner for loop
                {
                    s[i, j] = Convert.ToInt32(line.Split(" ")[j]);//splitting the line by the space characters
                                                                 //and keeping only the data for the current amount
                }
            }

            //checking if we filled the matrix correctly
            /*
            Console.WriteLine("\nChecking the matrix:");
            for (int i = 0; i < m; i++)//rows
            {
                for (int j = 0; j < n; j++)//columns
                {
                    Console.Write(s[i, j] + " ");
                }
                Console.WriteLine();
            }
            */


            //calling the function after it's written
//SHIPMENTS A TASK
            int max = 0;
                
            for(int i = 0; i < m; i++)
            {
                if (maxV(i,s,n) > max)
                {
                    max = maxV(i,s,n);
                }
            }
//SHIPMENTS B TASK
            int minsum = sumV(0,s,n);
            
            for(int i = 1;i < m; i++)
            {
                if(sumV(i,s,n) < minsum)
                {
                    minsum= sumV(i,s,n);
                }
            }


            //printing the result to the output
//SHIPMENTS A TASK
            Console.WriteLine("The highest amount of items shipped in one shipment is "+max);
//SHIPMENTS B TASK
            Console.WriteLine("The smallest amount of items shipped overall in one month of shipments is " + minsum);
    }
}