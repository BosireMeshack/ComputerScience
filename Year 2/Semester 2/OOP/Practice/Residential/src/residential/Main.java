/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package residential;

/**
 *
 * @author mekigelashvili
 */
public class Main {
    public static void main(String[] args) {
        Building building = new Building();
        //Building constructor creates building with two initial levels and one stairwell
        Level level2 = new Level(building);
        building.addLevel(level2);
        System.out.println("Added level 2 to the building");
        
        // Add a new flat to level2, the two flats will be neighbors
        Flat flat = new Flat(level2);
        level2.addFlat(flat);
        level2.makeNeighbors(0, 1);

        // Create an elevator and connecting it to levels
        Elevator elevator = new Elevator(building);
        
        System.out.println("Neighbors on Level 2:");
        for (var f : level2.getFlats()) {
            System.out.println("Flat " + f + ":");
            for (var n : f.getNeighbors()) {
                System.out.println("\t" + n);
            }
        }
    }
}
