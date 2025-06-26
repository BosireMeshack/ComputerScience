/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package polynomial;

/**
 *
 * @author maksudbagirov
 */
public class Polynomial {
    private double a; 
    private double b;
    private double c;
    
    public Polynomial(double x, double y, double z){
        this.a = x;
        this.b = y;
        this.c = z;
    }
    
    public double value(double x){
    return a * (Math.pow(x, 2)) + b * x + c;
    }
    
    public Polynomial add(Polynomial p, Polynomial q){
        return new Polynomial(p.a + q.a, p.b + q.b, p.c + q.c);
    }
    
    public Polynomial sub(Polynomial p, Polynomial q) {
        return new Polynomial(p.a - q.a, p.b-q.b,p.c-q.c);
        
    }
    
    public Polynomial mul(Polynomial p, Double s){
        return new Polynomial(p.a*s, p.b * s, p.c * s);
    }
    
    public String toString() {
        String result = String.valueOf(a) + "x^2";
        if (b >= 0) {
            result += "+";
        }
        
        result += String.valueOf(b) + "x";
        if (c >=0) {
            result += "+";
        }
        result += String.valueOf(c);
                
        return result;
        
    }
}
