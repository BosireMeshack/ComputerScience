/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ranger;

/**
 *
 * @author maksudbagirov
 */
public class Arrow {
    public int damage;
    public String type;
    public Arrow(int damage, String type) {
        this.damage = damage;
        this.type = type;
    }
    
    @Override
    public String toString()  {
        return "{" + this.type + ": " + this.damage + "}";
    }
}
