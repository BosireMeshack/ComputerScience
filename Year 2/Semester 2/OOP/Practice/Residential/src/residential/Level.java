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
public class Level {
    private Building building;
    private ArrayList<Flat> flats;
    private ArrayList<Stairwell> stairwells;
    private ArrayList<Elevator> elevators;

    public Level(Building building) {
        this.building = building;
        this.flats = new ArrayList<>();
        this.stairwells = new ArrayList<>();
        this.elevators = new ArrayList<>();
        // Create level with initial flat
        Flat flat1 = new Flat(this);
        this.flats.add(flat1);
    }

    public void addFlat(Flat flat) {
        this.flats.add(flat);
    }
    
    public void addStairwell(Stairwell stairwell) {
        stairwells.add(stairwell);
    }
    
    /**
     * Make two flats neighbors.
     * @param num1 The number of the first flat.
     * @param num2 The number of the second flat.
     */
    public void makeNeighbors(int num1, int num2) {
        flats.get(num1).addNeighbor(flats.get(num2));
        flats.get(num2).addNeighbor(flats.get(num1));
    }

    public Building getBuilding() {
        return building;
    }

    public ArrayList<Flat> getFlats() {
        return flats;
    }

    public ArrayList<Stairwell> getStairwells() {
        return stairwells;
    }

    public ArrayList<Elevator> getElevators() {
        return elevators;
    }
    
    
}
