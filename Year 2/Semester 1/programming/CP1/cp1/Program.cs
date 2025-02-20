// See https://aka.ms/new-console-template for more information

// Console.WriteLine("Enter the number of employees");
namespace CP1
{
    internal class Program
    {
        static void Main(string[] args)
        {
        int countOfEmployees=Convert.ToInt32(Console.ReadLine());
        int []ages = new int [countOfEmployees];
        int []salaries  = new int [countOfEmployees];

        // Console.WriteLine("Input the Ages");
        for (int i = 0; i < countOfEmployees; i++)
        {
            ages[i] = Convert.ToInt32(Console.ReadLine());
        }
        // Console.WriteLine("Input the Salaries");
        for (int i = 0; i < countOfEmployees; i++)
        {
            salaries[i] = Convert.ToInt32(Console.ReadLine());
        }


        int oldestEmployeeInd=0;
        int oldestage=ages[0];
        int oldestEmployeeSalary=0;
        float averageSalary=0;
        float sum=0;

        for(int i=0;i<countOfEmployees;i++) {
            sum=sum+salaries[i];
            if(ages[i]>oldestage)
            {
                oldestage=ages[i];
                oldestEmployeeInd=i;
            }
        }

        averageSalary=sum/countOfEmployees;
        oldestEmployeeSalary=salaries[oldestEmployeeInd];
        Console.WriteLine(oldestEmployeeSalary);
        Console.WriteLine(averageSalary);
        // Console.WriteLine(oldestEmployeeInd);
        }
    }
}