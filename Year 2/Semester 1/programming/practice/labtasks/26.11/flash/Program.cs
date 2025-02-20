// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");


using System;

namespace flash
{
    internal class Program
    {
public struct Race
{
    public string id;
    public int laps;
    public int time;
}
static void Main(string[] args)
{
        //declarations
    int n = Convert.ToInt32(Console.ReadLine()); // number of races
    Race[] races = new Race[n];

    for(int i=0; i<n; i++)
        {
            string input = Console.ReadLine();
            string id = input.Split(" ")[0];
            int laps = Convert.ToInt32(input.Split(" ")[1]);
            int time = Convert.ToInt32(input.Split(" ")[2]);
            if(laps >=1 && laps <=50 && time>=1 && time<=5000)
            {
                races[i].id = id;
                races[i].laps = laps;
                races[i].time = time;
            }
            else {
                Console.WriteLine("Invalid input, please enter the correct input");
            }
      }
      int minind=0;
      for(int i=1; i<races.Length;i++)
      {
        if((double)races[i].time/ races[i].laps<minind)
        {
            minind=i;
        }
      }
   }
}
}