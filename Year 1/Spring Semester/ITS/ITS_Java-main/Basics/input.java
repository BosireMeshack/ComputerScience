package Basics;

import java.util.Scanner;

public class input {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Can you give me a name?");
        String name = scanner.nextLine();
        System.out.println("How old are you?");
        int age = scanner.nextInt();
        System.out.println("Hi! My name is " + name + " and I'm " + String.valueOf(age) + " old.");
        scanner.close();
    }
}
