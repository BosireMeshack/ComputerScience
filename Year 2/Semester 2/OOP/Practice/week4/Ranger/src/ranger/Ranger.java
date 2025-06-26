/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ranger;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maksudbagirov
 */
public class Ranger {
    private List<Arrow> quiver;
    // Constructor
    public Ranger() {
        this.quiver = new ArrayList<>();
    }
    
    public Arrow quickShot(String type) {
        for(Arrow arrow : quiver) {
            if ( arrow.type.equals(type))
                return arrow;
        }
        
        return null;
    }

    
    public Arrow calledShot(String type){
        Arrow maxArrow = null;
        for( Arrow arrow : quiver ) {
            if(arrow.type.equals(type)) {
                if(maxArrow == null || arrow.damage > maxArrow.damage){
                maxArrow = arrow;
                }
            }
        }
        return maxArrow;
    }
    
    public List<Arrow> rainOfArrows(String type){
        List list = new ArrayList<>();
        
        for( Arrow arrow : quiver ){
            if ( arrow.type.equals(type)) {
                list.add(arrow);
            }
        }
        return list;
    }
    
    public int countArrows(String type){
        int count = 0;
        for(Arrow arrow : quiver){
            if(arrow.type.equals(type)){
                count++;
            }
        }
        return count;
    }
    
    
    public boolean shoot(Arrow arrow) {
        return quiver.remove(arrow);
    }
    
    public boolean shootMany(Arrow[] arrows){
        boolean success = true;
        for(Arrow arrow : arrows) {
            if (!quiver.remove(arrow)) {
                success = false;
            }
        }
        return success;
    }
    
    public void addArrow(Arrow arrow) {
        quiver.add(arrow);
    }
    
    public List<Arrow> getArrows() {
        return quiver;
    }
}
