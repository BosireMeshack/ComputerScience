/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package residential;

import java.util.ArrayList;

/**
 *
 * @author mekigelashvili
 */
public class Flat {
    private Level level;
    private final ArrayList<Flat> neighbors;
    
    public Flat(Level level) {
        this.level = level;
        neighbors = new ArrayList<>();
    }
    
    public void addNeighbor(Flat neighbor) {
        neighbors.add(neighbor);
    }

    public ArrayList<Flat> getNeighbors() {
        return neighbors;
    }
    
    
    
}
