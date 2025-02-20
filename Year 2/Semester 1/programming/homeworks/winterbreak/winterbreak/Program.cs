//Console.WriteLine("Hello, World!");

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Give the threshold for the price per day and the count of Easter break travel packages!");
        //reading in the first line of the input
        string input = Console.ReadLine();
        int threshold = Convert.ToInt32(input.Split(' ')[0]);//T in the task description
        int packageNum = Convert.ToInt32(input.Split(' ')[1]);//N in the task description

        //printing an error message and reading in the input again if there's an error in the first row of the input
        while (threshold < 10 || threshold > 500 || packageNum < 2 || packageNum > 50)
        {
            Console.WriteLine("The given data is wrong, write it in again!");
            input = Console.ReadLine();
            threshold = Convert.ToInt32(input.Split(' ')[0]);
            packageNum = Convert.ToInt32(input.Split(' ')[1]);
        }

        Console.WriteLine("T and N input successful\n");
        //reading in the next N lines of the input, error message, reading it in again if needed
        string[] packages = new string[packageNum];
        int[] price = new int[packageNum];
        int[] duration = new int[packageNum];

        for (int i = 0; i < packageNum; i++)
        {
            Console.WriteLine("Give the name, total price, and the duration of travel days for the " + (i + 1) + ". travel package separated by semicolons.");

            string line = Console.ReadLine();
            packages[i] = line.Split(';')[0];
            price[i] = Convert.ToInt32(line.Split(';')[1]);
            duration[i] = Convert.ToInt32(line.Split(';')[2]);

            while (price[i] > 10000 || duration[i] < 1 || duration[i] > 30)
            {
                Console.WriteLine("The given data is wrong, type it in again!");
                line = Console.ReadLine();
                packages[i] = line.Split(';')[0];
                price[i] = Convert.ToInt32(line.Split(';')[1]);
                duration[i] = Convert.ToInt32(line.Split(';')[2]);
            }
        }

        //TASK 1: Returns the name of the cheapest Winter break travel package
        int minPrice = 10001;
        int minIndex = 0;

        for (int i = 1; i < packageNum; i++)
        {
            if (price[i] < minPrice)
            {
                minPrice = price[i];
                minIndex = i;
            }
        }

        //TASK 2: List the indexes of all Winter break travel packages where the price per day is greater than the specified threshold.
        int[] expensivePricePerDay = new int[packageNum];
        int aboveThresholdNum = 0;

        for (int i = 0; i < packageNum; i++)
        {
            if (price[i] / duration[i] > threshold)
            {
                expensivePricePerDay[aboveThresholdNum] = i + 1;
                aboveThresholdNum++;
            }
        }

        //PRINTING THE OUTPUT
        //task A
        Console.WriteLine("Cheapest Package is: " + packages[minIndex]);

        //task B
        Console.Write("Count and Indexes Above Treshold: " + aboveThresholdNum);

        for (int i = 0; i < aboveThresholdNum; i++)
        {

            Console.Write(" " + expensivePricePerDay[i]);

        }
    }
}