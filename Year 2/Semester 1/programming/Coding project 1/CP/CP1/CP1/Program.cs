// See https://aka.ms/new-console-template for more information



using System;

namespace CP1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine()); // Read number of employees

        // Validate number of employees
        if (n < 1 || n > 100)
        {
            Console.WriteLine("Number of employees must be between 1 and 100.");
            return;
        }

        int oldestAge = 0;
        double oldestSalary = 0;
        double totalSalary = 0;

        for (int i = 0; i < n; i++)
        {
            string[] input = Console.ReadLine().Split();
            int age = int.Parse(input[0]);
            double salary = double.Parse(input[1]);

            // Validate age and salary
            if (age < 1 || age > 100)
            {
                Console.WriteLine("Age must be between 1 and 100.");
                return;
            }
            if (salary < 1 || salary > 2000000)
            {
                Console.WriteLine("Salary must be between 1 and 2,000,000.");
                return;
            }

            // Check for the oldest employee
            if (age > oldestAge)
            {
                oldestAge = age;
                oldestSalary = salary;
            }

            totalSalary += salary; // Accumulate total salary
        }

        // Calculate average salary
        double averageSalary = totalSalary / n;

        // Output the results
        Console.WriteLine(oldestSalary);
           if (averageSalary % 1 == 0) // Check if the average is a whole number
        {
            Console.WriteLine($"{(int)averageSalary}"); // Print as an integer
        }
        else
        {
            // ToString with a format specifier that removes trailing zeros
            Console.WriteLine(averageSalary.ToString("0.##", System.Globalization.CultureInfo.InvariantCulture)); 
        }
    }
}

}