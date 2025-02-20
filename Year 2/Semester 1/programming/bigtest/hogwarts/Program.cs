using System.Security.Cryptography;

internal class Program
{

    static int minV(int [,] performances, int n, int m)
    {
        int minvalue=performances[0,0];

        for(int i=0; i<n; i++)
        {
            for(int j=0; j<m; j++)
            {
                if(performances[i,j]<minvalue)
                {
                    minvalue = performances[i,j];
                }
            }
        }
        return minvalue;
    }

    static int sumV(int [,] performances, int n, int m)
     {
        int sum=0;

        for(int i=0; i<n; i++)
        {
            for(int j=0; j<m; j++)
            {
 
              sum += performances[i,j];
                
            }
        }
        return sum;
    }

    // static float avg(int [,] performances, int n, int m)
    // {
    //     int cntH=0;
    //     for(int i=0; i<n; i++)
    //     {
    //         int sumH=0;
    //         for(int j=0; j<m; j++)
    //         {
    //             sumH+=performances[j,i];
    //         }
    //         float aveg = sumH / n;
    //         if(aveg>85)
    //         {
    //             cntH+=1;
    //         }
    //     }
        
    //     return aveg;
    // }
    private static void Main(string[] args)
    {
        string input = Console.ReadLine();

        int n = Convert.ToInt32(input.Split(" ")[0]);
        int m = Convert.ToInt32(input.Split(" ")[1]);

        int[,] performances = new int[n,m];

        for (int i=0; i<n; i++)
        {
            string line = Console.ReadLine();
            for(int j=0; j<m; j++)
            {
                performances[i,j] = Convert.ToInt32(line.Split(" ")[j]);
            }
        } 

        //confirm input
        // for (int i=0; i<n; i++)
        // {
            
        //     for(int j=0; j<m; j++)
        //     {
        //         Console.Write(performances[i,j]+ " ");
        //     }
        //     Console.WriteLine();
        // } 
        // a 
        //Console.WriteLine(minV(performances, n,m));

        //b
        // Console.WriteLine(sumV(performances, n, m));
        //c
        // List<int> maxis = new List<int>();
        // int cnt=0;
        // for(int k=0; k<n; k++)
        // {
        //     int maxv=0;
        //     for(int l=0; l<m; l++)
        //     {
        //         if(performances[k,l]>maxv)
        //         {
        //             maxv=performances[k,l];
        //             //cnt+=1;
        //         }

        //     }
        //     maxis.Add(maxv);
        // }

        // for(int i=0; i<maxis.Count(); i++)
        // {
        //     Console.Write(maxis[i]+ " ");
        // }

        //d
        List <int> indexes = new List<int>();
       // double[] houseaverages = new double [m];
        int cntH=0;
        for(int i=0; i<m; i++)
        {
            int sumH=0;
            for(int j=0; j<n; j++)
            {
                sumH+=performances[j,i];
                //Console.Write(performances[j,i]+" ");
            }
            int aveg = sumH / n;
            //Console.Write(aveg);
            if(aveg>80 || aveg == 80)
            {
                cntH+=1;
                indexes.Add(i+1);
            }
            // Console.WriteLine();
            //houseaverages[i] = aveg;
        }

        // int countH=0;
        // for(int w=0;w<m; m++ )
        // {
        //     if(houseaverages[w]>=80)
        //     {
        //         countH+=1;
        //     }
        // }

        Console.WriteLine(cntH);
        for(int k=0; k<indexes.Count; k++)
        {
           
            
            Console.Write(indexes[k] + " ");
            
            
        }

        
    }
}