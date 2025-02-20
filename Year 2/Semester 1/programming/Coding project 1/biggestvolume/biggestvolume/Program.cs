namespace biggestvolume
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int countOfCubes = Convert.ToInt32(Console.ReadLine());
            int[] cubesSizes = new int[countOfCubes];
            int bpv = 0;
            for (int i = 0; i < countOfCubes; i++)
            {
                cubesSizes[i] = Convert.ToInt32(Console.ReadLine());

                bpv = bpv + (cubesSizes[i] * cubesSizes[i] * cubesSizes[i]);
            }
            Console.WriteLine(bpv);
        }
    }
}
