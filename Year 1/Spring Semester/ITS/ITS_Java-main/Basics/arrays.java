package Basics;

import java.util.Arrays;

public class arrays {
    public static void main(String[] args) {
        int[] numbers = new int[5];
        numbers[0] = 12;
        numbers[1] = 6;
        numbers[2] = 2;
        numbers[3] = 57;
        numbers[4] = 4;

        String[] names = new String[]{"Alice", "Bob", "Charlie", "David", "Emily"};

        for (int i = 0; i < numbers.length; i++) {
            System.out.println(numbers[i]);
        }

        System.out.println(Arrays.toString(numbers));
        Arrays.sort(numbers);
        System.out.println(Arrays.toString(numbers));
        System.out.println(Arrays.toString(names));

        
    }
}
