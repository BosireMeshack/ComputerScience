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
public class Elevator {

    private final Building building;
    private ArrayList<Level> levels = new ArrayList<>();

    /**
     * Constructs the elevator and connects it to all of the levels.
     *
     * @param building
     */
    public Elevator(Building building) {
        this.building = building;
        // the class diagram doesn't require that the elevator is connected to
        // all levels, this is new in the implementation, we could have done
        // otherwise
        for (Level level : building.getLevels()) {
            connect(level);
        }
    }

    public void connect(Level level) {
        if (this.building != level.getBuilding()) {
            System.out.println("The elevator and level does not belong to the same building");
            return;
        }
        // maybe it's already connected
        if (!this.levels.contains(level)) {
            this.levels.add(level);
        }
        System.out.println("Connected elevator to level " + building.getLevels().indexOf(level));
    }
}
