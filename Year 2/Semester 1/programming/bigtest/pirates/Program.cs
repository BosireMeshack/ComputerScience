using System.Reflection.Metadata.Ecma335;

internal class Program
{

    struct LootInf {
        public int lootValue;
        public string lootRegion;
        public string pirateName;

    }

    // Function for minimum selection

    static int miniV(LootInf[] Loots, int n)
    {
        int minind=0;
        for(int j=0; j<n; j++)
        {
            if(Loots[j].lootValue < Loots[minind].lootValue)
            {
                minind = j;
            }
        }
        return minind;
    }

    static int numAboveThresh(int t, LootInf[] Loots,int n)
    {
        int count=0;
        for(int i=0; i<n; i++)
        {
            if(Loots[i].lootValue > t || Loots[i].lootValue == t)
            {
                count+=1;
            }
        }
        return count;

    }

    // static int howmany(LootInf[] Loots, int ind, int n)
    // {
    //     int cnt=0;
    //     for(int j=n; j>ind; j--)
    //     {
    //         if(Loots[j].lootRegion == Loots[ind].lootRegion)
    //         {
    //             cnt+=1;
    //         }
    //     }
    //     return cnt;
    // }

    static int jack(LootInf[] Loots, int n)
    {
        int jackval=0;
        int cnt=0;
        for(int i=0; i<n; i++)
        {
            if(Loots[i].pirateName == "Jack")
            {
                jackval+=Loots[i].lootValue;
                cnt+=1;
            }
        }
        return jackval;
        
    }

    static int jackaboveT(LootInf[] Loots, int n, int t)
    {
        int cnt = 1;
        for(int i=0; i<n; i++)
        {
            if(Loots[i].pirateName == "Jack" && Loots[i].lootValue >t)
            {
                cnt+=i;
                break;
            }
        }
        return cnt;
    }
    private static void Main(string[] args)
    {
        string input = Console.ReadLine();
        int n = Convert.ToInt32(input.Split(" ")[0]); // number of lootings
        int t = Convert.ToInt32(input.Split(" ")[1]); // threshold

        LootInf[] Loots = new LootInf[n];

        for (int i=0; i<n; i++)
        {
            string lootinput = Console.ReadLine();
            Loots[i].lootValue = Convert.ToInt32(lootinput.Split(" ")[0]);
            Loots[i].lootRegion = lootinput.Split(" ")[1];
            Loots[i].pirateName = lootinput.Split(" ")[2];
        }
        // Confirm the right inputs
        //   for (int i=0; i<n; i++)
        // {
           
        //    Console.WriteLine(Loots[i].lootValue + " " + Loots[i].lootRegion + " " + Loots[i].pirateName);
           
        // }
        // Name of pirate with lowest value of single loot
        //a
        //Console.WriteLine(Loots[miniV(Loots, n)].pirateName);


        // b
        //Console.WriteLine(numAboveThresh(t, Loots,n));
        //c
        List<string> uniqueRegions = new List<string>(); 
        Dictionary<string, int> valueByRegion = new Dictionary<string, int>();

        

        for(int i=0; i<n;i++)
        {
            // if(Loots[i].lootRegion != Loots[i-1].lootRegion)
            // {
            //     Console.WriteLine(Loots[i].lootRegion + howmany(Loots, i, n));
            // }
            if(!valueByRegion.ContainsKey(Loots[i].lootRegion))
            {
                valueByRegion[Loots[i].lootRegion]=0;
                uniqueRegions.Add(Loots[i].lootRegion);
            }
            valueByRegion[Loots[i].lootRegion] += Loots[i].lootValue;
        }

        foreach (string region in uniqueRegions)
        {
            Console.WriteLine(region + " " + valueByRegion[region]);
        }

        // for(int k=0; k<uniqueRegions.Count(); k++)
        // {   
        //     //Console.WriteLine(uniqueRegions[k]);
        //     int cnt=0;
        //     for(int w=0; w<n; w++)
        //     {
        //         if (uniqueRegions[k] == Loots[w].lootRegion)
        //         {
        //             cnt+=Loots[w].lootValue;
        //         }
        //     }
        //     Console.WriteLine(uniqueRegions[k] + " " + cnt);
        //      }
        //d
        // Console.WriteLine(jackaboveT(Loots, n, t));
        // Console.WriteLine("Jack" + " "+ jack(Loots, n));

    }
}