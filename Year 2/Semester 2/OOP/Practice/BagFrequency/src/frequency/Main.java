/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package frequency;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;

/**
 *
 * @author zizi
 */
public class Main {
    public static void main(String[] args){
        try {
            String filename = "input25.txt";
            Scanner sc = new Scanner(new BufferedReader(new FileReader(filename)));
            
            int m = sc.nextInt();
            
            Bag bag = new Bag(m);
            
            while (sc.hasNextInt()){
                try {
                    bag.insert(sc.nextInt());
                } catch (Bag.IllegalElementException ex) {
                    System.out.println("The element of the bag must be in [0..{" + m + "}].");
                }
            }
            
            System.out.println("The most frequent element: " + bag.mostFrequent());
        
        } catch (java.io.FileNotFoundException e) {
            System.out.println("Input file does not exist");
        } catch (Bag.NegativeSizeException e) {
            System.out.println("Upper limit of the input natural numbers cannot be negative.");
        } catch (Bag.EmptyBagException e) {
            System.out.println("There is no most frequented element");
        }
    }
}
