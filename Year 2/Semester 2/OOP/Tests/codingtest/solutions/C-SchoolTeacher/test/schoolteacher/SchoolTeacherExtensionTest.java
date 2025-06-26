/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;

public class SchoolTeacherExtensionTest {

    private Projector projector;
    private Whiteboard whiteboard;
    private Computer computer;
    private School school;

    @Before
    public void setUp() {
        projector = new Projector("Smart Projector", 2000, 5);
        whiteboard = new Whiteboard("Interactive Board", 1000, 8);
        computer = new Computer("Laptop", 1500, 3);
        school = new School("Test School");
    }

    @Test
    public void testProjectorAnnualBudget() {
        assertEquals(600.0, projector.calculateAnnualBudget(), 0.01); // 400 + 200
    }

    @Test
    public void testWhiteboardAnnualBudget() {
        assertEquals(145.0, whiteboard.calculateAnnualBudget(), 0.01); // 125 + 20
    }

    @Test
    public void testComputerAnnualBudget() {
        assertEquals(725.0, computer.calculateAnnualBudget(), 0.01); // 500 + 225
    }

    @Test
    public void testResourceProperties() {
        assertEquals("Smart Projector", projector.getName());
        assertEquals(2000.0, projector.getCost(), 0.01);
        assertEquals(5, projector.getLifespan());
        
        assertEquals("Interactive Board", whiteboard.getName());
        assertEquals(1000.0, whiteboard.getCost(), 0.01);
        assertEquals(8, whiteboard.getLifespan());
        
        assertEquals("Laptop", computer.getName());
        assertEquals(1500.0, computer.getCost(), 0.01);
        assertEquals(3, computer.getLifespan());
    }

    @Test
    public void testTotalAnnualResourceBudget() {
        school.addResource(projector);
        school.addResource(whiteboard);

        double expected = 600.0 + 145.0;
        assertEquals(expected, school.getTotalAnnualResourceBudget(), 0.01);
    }

    @Test
    public void testMultipleResourceTypes() {
        school.addResource(projector);
        school.addResource(whiteboard);
        school.addResource(computer);

        double expected = 600.0 + 145.0 + 725.0;
        assertEquals(expected, school.getTotalAnnualResourceBudget(), 0.01);
    }

    @Test
    public void testEmptyResourceList() {
        assertEquals(0.0, school.getTotalAnnualResourceBudget(), 0.01);
        assertEquals(0, school.getResources().size());
    }

    @Test
    public void testResourceWithDifferentLifespans() {
        Projector shortLived = new Projector("Basic Projector", 1000, 2);
        Projector longLived = new Projector("Durable Projector", 1000, 10);
        
        assertEquals(600.0, shortLived.calculateAnnualBudget(), 0.01); // 500 + 100
        assertEquals(200.0, longLived.calculateAnnualBudget(), 0.01); // 100 + 100
    }

    @Test
    public void testResourceWithDifferentCosts() {
        Computer cheap = new Computer("Basic Laptop", 500, 3);
        Computer expensive = new Computer("Gaming Laptop", 3000, 3);
        
        assertEquals(241.67, cheap.calculateAnnualBudget(), 0.01); // 166.67 + 75
        assertEquals(1450.0, expensive.calculateAnnualBudget(), 0.01); // 1000 + 450
    }

    @Test
    public void testMaintenanceRates() {
        // Test that different resource types have different maintenance rates
        double projectorRate = 2000 * 0.1; // 10% for projectors
        double whiteboardRate = 1000 * 0.02; // 2% for whiteboards
        double computerRate = 1500 * 0.15; // 15% for computers
        
        assertEquals(projectorRate, 200.0, 0.01);
        assertEquals(whiteboardRate, 20.0, 0.01);
        assertEquals(computerRate, 225.0, 0.01);
    }

    @Test
    public void testZeroCostResource() {
        Projector freeProjector = new Projector("Free Projector", 0, 5);
        assertEquals(0.0, freeProjector.calculateAnnualBudget(), 0.01);
    }

    @Test
    public void testOneYearLifespan() {
        Computer oneYear = new Computer("Disposable Computer", 1000, 1);
        assertEquals(1150.0, oneYear.calculateAnnualBudget(), 0.01); // 1000 + 150
    }
}
