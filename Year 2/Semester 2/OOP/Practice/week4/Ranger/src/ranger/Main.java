/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ranger;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maksudbagirov
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Objects of Arrow class
        Arrow fireArrow1 = new Arrow(10, "Fire");
        Arrow fireArrow2 = new Arrow(15, "Fire");
        Arrow iceArrow = new Arrow(12, "Ice");
        
        // Objects of Ranger class 
        Ranger r = new Ranger();
        r.addArrow(fireArrow1);
        r.addArrow(fireArrow2);
        r.addArrow(iceArrow);
        
        System.out.println(r.getArrows());
        
        
        System.out.println("Quick shot fire: " + r.quickShot("Fire"));
        System.out.println("Quick shot fire: " + r.quickShot("Ice"));
        
        
        System.out.println("Called shot fire: " + r.calledShot("Fire"));
        System.out.println("Called shot fire: " + r.calledShot("Ice"));

        System.out.println("Rain of arrows fire: " + r.rainOfArrows("Fire"));
        System.out.println("Rain of arrows ice: " + r.rainOfArrows("Ice"));
        
        System.out.println("Count of arrows fire: " + r.countArrows("Fire"));
        System.out.println("Count of arrows ice: " + r.countArrows("Ice"));
        
        System.out.println("Shoot one (fire1): " + r.shoot(fireArrow1));
        System.out.println("List of arrows:" + r.getArrows());
        
        System.out.println("Shoot one (fire1 - nonexistent): " + r.shoot(fireArrow1));
        System.out.println("List of arrows:" + r.getArrows());
        
//        List<Arrow> arrows = new ArrayList<>();
//        arrows.add(fireArrow2);
//        arrows.add(iceArrow);
        
        Arrow[] arrows = {fireArrow2, iceArrow};
        System.out.println("Shoot many (all): " + r.shootMany(arrows));
        System.out.println("List of arrows:" + r.getArrows());

    }
    
}
