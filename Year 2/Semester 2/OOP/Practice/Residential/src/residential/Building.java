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
public class Building {
    private ArrayList<Level> levels;
    private ArrayList<Stairwell> stairwells;
    private ArrayList<Elevator> elevators;

    public Building() {
        this.levels = new ArrayList<>();
        this.stairwells = new ArrayList<>();
        this.elevators = new ArrayList<>();
        // Create building with 2 initial levels and 1 stairwell
        Level level0 = new Level(this);
        Level level1 = new Level(this);
        this.levels.add(level0);
        this.levels.add(level1);
        Stairwell stairwell = new Stairwell(this);
        this.stairwells.add(stairwell);
        level0.addStairwell(stairwell);
        level1.addStairwell(stairwell);
    }
    
    public void addLevel(Level level) {
        this.levels.add(level);
        for (var e : elevators) {
            e.connect(level);
        }
        // we don't connect the level to the stairwells automatically        
    }

    public ArrayList<Level> getLevels() {
        return levels;
    }

    public ArrayList<Stairwell> getStairwells() {
        return stairwells;
    }

    public ArrayList<Elevator> getElevators() {
        return elevators;
    }
    
    
}
