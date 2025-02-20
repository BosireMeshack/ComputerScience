// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");
// declaration of variables
        int t = 0; //Threshold value
        int n = 0; // number of packets
        bool correctinput = false;

        //validation of the number of tickets and threshold
        while(!correctinput)
        {
            Console.Write("Please give the threshold for the price per day(the value has to be between 10 and 500) and the number of tickets(the value has to be between 2 and 50) in one line separated by space:");
            string line = Console.ReadLine();
            t = Convert.ToInt32(line.Split(' ')[0]);//T
            n = Convert.ToInt32(line.Split(' ')[1]);//N
            if(n>=2 && n<=50 && t>=10 && t<=500)
            {
                correctinput=true;
            }
        }
        // Console.WriteLine("Input the threshold\n");
        // int t = Convert.ToInt32(Console.ReadLine());
        // Console.WriteLine("How many packets do you have?\n");
        // int n = Convert.ToInt32(Console.ReadLine());

        string[] pktNames=new string[n];
        int[] pktPrices=new int[n];
        int[] pktDurations=new int[n];

        for(int i=0; i<n; i++)
        {
            Console.Write("Give the name of the city {0}, price of the packets {1} and number of days {2} all separated by a semicolons: ");
            string values = Console.ReadLine();
            pktNames[i] = values.Split(';')[0];
            pktPrices[i] = Convert.ToInt32(values.Split(';')[1]);
            pktDurations[i] = Convert.ToInt32(values.Split(';')[2]);
            if(pktPrices[i]<5 || pktPrices[i] > 10000 || pktDurations[i] <1 || pktDurations[i] >30)
            {
                i--;
                Console.WriteLine("\n The Input is incorrect. Please give this values again!");
            }
        }

        int cnt=0;
        int minPrice=pktPrices[0];
        int[] pos = new int[n];
        int minInd=0;

        for (int i=0; i<n; i++)
        {
            float threshold = pktPrices[i]/pktDurations[i];
            if (threshold<t)
            {
                
                pos[cnt]=i+1;
                cnt=cnt+1;
            }
            if(pktPrices[i]<minPrice)
            {
                minInd=i;
            }
        }
        string nm=pktNames[minInd]; 
        Console.Write("Cheapest Package is: \n"+ nm);
        Console.Write("Count and indexes Above Threshold:" + cnt);
        for(int j=0; j<cnt; j++)
        {
            Console.WriteLine(pos[j]);
        }
