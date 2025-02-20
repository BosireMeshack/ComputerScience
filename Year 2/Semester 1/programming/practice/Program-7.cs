namespace lesson3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //task18: There is an array of Q length (1<=Q<=100).
            Console.Write("How many numbers do you need? ");
            int Q = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Write " + Q + " numbers line by line.");
            int[] numbers = new int[Q];//we create a Q long array
            for (int i = 0; i < Q; i++)
            {
                numbers[i] = Convert.ToInt32(Console.ReadLine());//we read the values from the console
            }

            //a: How many even numbers are there in the array?
            int NumberOfEvenNumbers = 0;
            for (int i = 0; i < numbers.Length; i++)
            {
                if (numbers[i] % 2 == 0)//if the current number divided by 2 has no remainder
                {
                    NumberOfEvenNumbers++;//then that number is an even number
                }
            }
            Console.WriteLine("The count of even numbers in this array is: " + NumberOfEvenNumbers);
            
            //b: What is the sum of all the elements?
            int SumOfNumbers = 0;
            for (int i = 0; i < numbers.Length; i++)
            {
                SumOfNumbers = SumOfNumbers + numbers[i];
            }
            Console.WriteLine("The sum of the numbers in this array is: " + SumOfNumbers);
            
            //c: Is there an even number in the array?
            bool EvenNumber = false;//boolean variable set to false
            int index = 0;//variable for the index (not in a for loop)
            while (EvenNumber == false && index < numbers.Length)//while loop, we go to the next element until we find an even number or we get to the last element
            {
                if (numbers[index] % 2 == 0)//if we find an even number
                {
                    EvenNumber = true;//we set the variable to true
                }
                index++;//we move on to the next element
            }
            if (EvenNumber == true)
            {
                Console.WriteLine("Yes, there is an even number in the array!");
            }
            else
            {
                Console.WriteLine("No, there isn't an even number in the array!");
            }

            //task19: We measured the temperatures for T days.
            Console.Write("How many days did you measure? ");
            int T = Convert.ToInt32(Console.ReadLine());
            int[] temperatures = new int[T];//we create a T long array
            Console.WriteLine("Add the temperatures line by line.");
            for (int i = 0; i < T; i++)
            {
                temperatures[i] = Convert.ToInt32(Console.ReadLine());//we read the values from the console
            }

            //a: It was freezing if the temperature was below 0. Write a program that gives us the number of days it was freezing.
            int CountOfFrozenDays = 0;
            for (int i = 0; i < temperatures.Length; i++)
            {
                if (temperatures[i] < 0)//if the current temperature is below 0
                {
                    CountOfFrozenDays++;//then it's a frozen day
                }
            }
            Console.WriteLine("The number of days the lake was frozen: " + CountOfFrozenDays);

            //b: If it's a strong monotone increasing sequence of the measured temperatures, then print “It’s getting warmer”.
            bool IsMonotone = true;
            for (int i = 0; i < temperatures.Length - 1; i++)//length-1 because we compare the current element and the next element
            {
                if (temperatures[i] > temperatures[i + 1])//if the current element is bigger than the next one
                {
                    IsMonotone = false;//then the whole sequence is not increasing in a monotone way
                    break;//we don't need to check the next element
                }
            }
            if (IsMonotone == true)
            {
                Console.WriteLine("Yes, the temperatures increased in a monotone sequence!");
            }
            else
            {
                Console.WriteLine("No, the temperatures didn't increase in a monotone sequence!");
            }

            //task20: We have the result of students on an exam. Give the first student who has the same result as one of their neighbours.
            int[] results = { 55, 86, 66, 32, 100, 98, 98, 75, 23, 23 };//array with predefined values: constant array
            bool SameAsNeighbours = false;
            int index2 = 0;
            //Console.Write("The results of the exam: ");
            for (int i = 1; i < results.Length - 1; i++)//we compare the current element with the previous and the next
            {
                //Console.Write(" "+results[i]);
                if (results[i] == results[i - 1] || results[i] == results[i + 1])
                {
                    SameAsNeighbours = true;
                    index2 = i + 1;
                    break;
                }
            }
            if (SameAsNeighbours == true)
            {
                Console.WriteLine("The index of the student who had the same result as one of their neighbour: " + index2);
            }
            else
            {
                Console.WriteLine("There was no student who had the same result as their neighbours.");
            }

            //task21: Write a program that gives the number of the month if the name of the month is given.
            Console.Write("Give the name of a month in short form: ");
            //we create an array and fill it with the names of the months: constant array
            string[] months = { "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec" };
            //we create a variable for the name of the month we get from the user
            string nameOfMonth = Console.ReadLine();

            //1st solution:
            int numOfMonth = 0;
            while (numOfMonth < months.Length && months[numOfMonth] != nameOfMonth)
            {
                numOfMonth++;
            }
            Console.WriteLine("The index of the month is: ", numOfMonth);
            
            //2nd solution:
            for (int i = 0; i < months.Length; i++)//with a for loop we go through all the elements of the month array
            {
                if (months[i] == nameOfMonth)//if the input is the same as the current element of the array
                {
                    Console.WriteLine(i + 1);//then we print out the index of the element (+1 because we started with 0)
                }
            }

            //task22:
            string[] NumbersAsStrings = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
            string[] TensAsStrings = { "teen", "twenty", "thirthy", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety" };
            //a:
            Console.Write("Give the number between 1 and 9: ");
            int Between1And9 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("The number as a string is: " + NumbersAsStrings[Between1And9 - 1]);
            //b:
            Console.Write("Give the number between 1 and 99: ");
            int Between1And99 = Convert.ToInt32(Console.ReadLine());

            if (Between1And99 < 10)
            {
                Console.WriteLine("The number as a string is: " + NumbersAsStrings[Between1And99 - 1]);
            }
            else
            {
                char firstNumber = Between1And99.ToString()[0];
                char secondNumber = Between1And99.ToString()[1];

                if (secondNumber == '0')
                {
                    if (Between1And99 == 10)
                    {
                        Console.WriteLine("The number as a string is: ten");
                    }
                    else
                    {
                        Console.WriteLine("The number as a string is: " + TensAsStrings[int.Parse(firstNumber.ToString()) - 1]);
                    }
                }
                else if (Between1And99 > 10 && Between1And99 < 20)
                {
                    if (Between1And99 == 11)
                    {
                        Console.WriteLine("The number as a string is: eleven");
                    }
                    else if (Between1And99 == 12)
                    {
                        Console.WriteLine("The number as a string is: twelve");
                    }
                    else if (Between1And99 == 13)
                    {
                        Console.WriteLine("The number as a string is: thirteen");
                    }
                    else if (Between1And99 == 15)
                    {
                        Console.WriteLine("The number as a string is: fifteen");
                    }
                    else if (Between1And99 == 18)
                    {
                        Console.WriteLine("The number as a string is: eighteen");
                    }
                    else//between 10 and 20 but not an exception
                    {
                        Console.WriteLine("The number as a string is: " + NumbersAsStrings[int.Parse(secondNumber.ToString()) - 1] + TensAsStrings[0]);
                    }
                }
                else//more than 19
                {
                    Console.WriteLine("The number as a string is: " + TensAsStrings[int.Parse(firstNumber.ToString()) - 1] + NumbersAsStrings[int.Parse(secondNumber.ToString()) - 1]);
                }
            }

            //task23
            bool res = false;
            Random rnd = new Random();
            int r = rnd.Next(1, 100);
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine("Guess what number I'm thinking (1-100)");
                int n = Convert.ToInt32(Console.ReadLine());
                if (n == r)
                {
                    Console.WriteLine("You got the right number");
                    res = true;
                    break;
                }
                else if (r < n)
                {
                    Console.WriteLine("Try a lower number");
                }
                else
                {
                    Console.WriteLine("Try a greater number");
                }
            }
            if (res)
            {
                Console.WriteLine("You won");
            }
            else
            {
                Console.WriteLine("You are out of attempts, you lost");
            }

            //task24
            Console.Write("Give me a number you want the factorial of: ");
            int n24 = Convert.ToInt32(Console.ReadLine());
            int f = 1;
            for (int i = 1; i < n24; i++)
            {
                f += f * i;
            }
            Console.WriteLine("The factorial of your number is: " + f);

            //task25
            Console.Write("Give me a number you want a proper divisor of: ");
            int n25 = Convert.ToInt32(Console.ReadLine());
            bool exists = false;
            int i25 = 2;
            int divisor = 1;
            while (!exists && i25 < n25)
            {
                if (n25 % i25 == 0)
                {
                    exists = true;
                    divisor = i25;
                }
                else
                {
                    i25++;
                }
            }
            if (exists)
            {
                Console.WriteLine("There is a proper divisor for your number! It is: " + divisor);
            }
            else
            {
                Console.WriteLine("There was no proper divisor for your number!");
            }
        }
    }
}