// See https://aka.ms/new-console-template for more information
using System;

namespace MyConsoleApp
{
    class Program
    {
        static void Main(string[] args) 
        {
           // Console.WriteLine("Hello, World!");

           // Task 18
           // a
        //  Console.WriteLine("Enter the length of your array");
        //  int len = Convert.ToInt32(Console.ReadLine());
        //  int[] array  = new int[len];
        //  Console.WriteLine("Enter the elements of the array line by line");

        //  for(int i = 0; i < array.Length; i++)
        //  {
        //     array[i] = Convert.ToInt32(Console.ReadLine());
        //  }

        //  int evenNumbers = 0;

        //  for(int i = 0; i < array.Length; i++)
        //  {
        //     if(array[i]%2 == 0)
        //     {
        //         evenNumbers++;
        //     }
        //  }
        //  Console.WriteLine("The number of even numbers is " + evenNumbers);

         // b
        //  Console.WriteLine("What is the size of your array?");
        //  int length = Convert.ToInt32(Console.ReadLine());
        //  int[] ints = new int[length];

        //  int sum = 0;
        //  for(int i = 0; i < length; i++)
        //  {

        //     Console.WriteLine("Enter the numbers line by line:");
        //     ints[i] = Convert.ToInt32(Console.ReadLine());
        //     sum = sum + ints[i];
        //  }

        // Console.WriteLine("The sum of the elements is " + sum);
        // }

        // c
        // int [] numbers = {1, 2, 4, 6, 12};        
        // bool iseven = false;
        // int index = 0;

        // while(iseven == false && index < numbers.Length)
        // {
        //     if(numbers[index] % 2 == 0)
        //     {
        //         iseven = true;
        //     }
        //     index++;
        // }

        // if(iseven == true)
        // {
        //     Console.WriteLine("There is an even number in the array!");
        // }

        // 19 b
// int [] temps = {12, 12,13, 14, 15, 18};

// bool isMonotone = false;

// for(int i=0; i<temps.Length-1; i++)
// {
//     if(temps[i] > temps[i+1])
//     {
//         isMonotone  = false;
//         break;
//     }
//     else 
//     {
//         isMonotone = true;
//     }
    
// }

// if(isMonotone == false)
// {
//     Console.WriteLine("The temperature is monotone decreasing");
       
// }
// else 
// {
//     Console.WriteLine("The temperature is monotone increasing");
        
// }

// task 23

bool res = false;
Random rnd = new Random();
int r = rnd.Next(1,100);

// Console.WriteLine("Enter the magic number: ");
// int magic_number = Convert.ToInt32(Console.ReadLine());

int index = 0;

while(index < 10)
{
    Console.WriteLine("input the guess ");
    int guess = Convert.ToInt32(Console.ReadLine());

    if(guess == r)
    {
        Console.WriteLine("Congratulations, the correct number is: " + r);
        res = true;
        break;
    }
    else if(guess < r)
    {
        Console.WriteLine("Guess is too small");
    }
    else 
    {
        Console.WriteLine("Guess too big");
    }

    index++;
}

if(res)
{
    Console.WriteLine("You won");
}
else 
{
    Console.WriteLine("You are out of attempts");
}





    }}
}



