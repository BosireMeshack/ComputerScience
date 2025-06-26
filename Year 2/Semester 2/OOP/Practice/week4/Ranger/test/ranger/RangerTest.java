/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package ranger;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author meshagwe
 */
public class RangerTest {
    
    public RangerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of quickShot method, of class Ranger.
     */
    @Test
    public void testQuickShot() {
        System.out.println("quickShot");
        String type = "";
        Ranger instance = new Ranger();
        Arrow expResult = null;
        Arrow result = instance.quickShot(type);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of calledShot method, of class Ranger.
     */
    @Test
    public void testCalledShot() {
        System.out.println("calledShot");
        String type = "";
        Ranger instance = new Ranger();
        Arrow expResult = null;
        Arrow result = instance.calledShot(type);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of rainOfArrows method, of class Ranger.
     */
    @Test
    public void testRainOfArrows() {
        System.out.println("rainOfArrows");
        String type = "";
        Ranger instance = new Ranger();
        List<Arrow> expResult = null;
        List<Arrow> result = instance.rainOfArrows(type);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of countArrows method, of class Ranger.
     */
    @Test
    public void testCountArrows() {
        System.out.println("countArrows");
        String type = "";
        Ranger instance = new Ranger();
        int expResult = 0;
        int result = instance.countArrows(type);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of shoot method, of class Ranger.
     */
    @Test
    public void testShoot() {
        System.out.println("shoot");
        Arrow arrow = null;
        Ranger instance = new Ranger();
        boolean expResult = false;
        boolean result = instance.shoot(arrow);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of shootMany method, of class Ranger.
     */
    @Test
    public void testShootMany() {
        System.out.println("shootMany");
        Arrow[] arrows = null;
        Ranger instance = new Ranger();
        boolean expResult = false;
        boolean result = instance.shootMany(arrows);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addArrow method, of class Ranger.
     */
    @Test
    public void testAddArrow() {
        System.out.println("addArrow");
        Arrow arrow = null;
        Ranger instance = new Ranger();
        instance.addArrow(arrow);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getArrows method, of class Ranger.
     */
//    @Test
//    public void testGetArrows() {
//        System.out.println("getArrows");
//        Ranger instance = new Ranger();
//        List<Arrow> expResult = null;
//        List<Arrow> result = instance.getArrows();
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
