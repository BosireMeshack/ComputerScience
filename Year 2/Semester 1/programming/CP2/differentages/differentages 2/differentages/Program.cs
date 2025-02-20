
namespace differentages
{
internal class Program
{
    // function that is counting how many times each age appears
    static int hm(int ind, int[] a)
    {
         if (ind < 0 || ind >= a.Length)
            {
                throw new ArgumentOutOfRangeException(nameof(ind), "Index is out of bounds.");
            }
        int cnt=0;
        int n= a.Length;
        for(int j=ind; j<n; j++)
        {
           if( a[ind] == a[j])
           {
                cnt=cnt+1;
           }
        }
        return cnt;
    }
    private static void Main(string[] args)
    {
        //Console.WriteLine("Enter the number of employees");
        // number of enployees
        int n = Convert.ToInt32(Console.ReadLine());

        while(n<1 || n>100)
        {
            Console.WriteLine("The entered number is out of bound, please enter again!");
            n = Convert.ToInt32(Console.ReadLine());
        }

        //Console.WriteLine(n);
        //declaration of arrays for storing ages and salaries
        int[] a = new int [n];
        int[] s = new int [n];
        int cnt=0;
        // inputing the ages and salaries of the employees
        for(int i=0; i<n; i++)
        {
            
            string input = Console.ReadLine();
           string[] inputs = input.Split(" ");
            if (inputs.Length != 2 || !int.TryParse(inputs[0], out a[i]) || !int.TryParse(inputs[1], out s[i]))
                {
                 Console.WriteLine("Invalid input. Please enter again (format: <age> <salary>):");
                 input = Console.ReadLine();
                 inputs = input.Split(" ");
                 a[i] = Convert.ToInt32(inputs[0]);
                 s[i] = Convert.ToInt32(inputs[1]);
                }

            while(a[i] <1 || a[i] > 100 || s[i] < 1 || s[i] > 2000000)
            {
                Console.WriteLine("The input data is invalid, Kindly enter again");
                input = Console.ReadLine();
                a[i]=Convert.ToInt32(input.Split(" ")[0]);
                s[i]=Convert.ToInt32(input.Split(" ")[1]);
            }
        }
        // looping through counting number of elements that are unique
        for(int k=0; k<n;k++)
        {
            if(hm(k,a)==1)
            {
                cnt=cnt+1;
            }
        }

        Console.WriteLine(cnt);


        
    }
}

}