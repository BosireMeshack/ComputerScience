package Basics;

import java.util.Scanner;

public class conditions {
    // if condition
    public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    int age = scanner.nextInt();
    scanner.close();
    if (age < 18){
        System.err.println("You are underage");
    }
    else if(age > 18 && age < 65){
        System.out.println("You are an adult");
    }
    else{
        System.out.println("You are retired and lived enough");
    }
    }
    
}
