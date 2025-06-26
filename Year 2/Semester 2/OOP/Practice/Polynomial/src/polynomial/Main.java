/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package polynomial;

/**
 *
 * @author maksudbagirov
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Polynomial p = new Polynomial(2,3,4);
        System.out.println("Current values: " + p);
        Polynomial l = new Polynomial(4,5,6);
        
        System.out.println("Result of adding: " + p.add(p, l));
        
        System.out.println("Result of multiplication: " + p.mul(p, 3.3));
        
        System.out.println("Result of sub: " + p.sub(l, p));
    }
    
}
