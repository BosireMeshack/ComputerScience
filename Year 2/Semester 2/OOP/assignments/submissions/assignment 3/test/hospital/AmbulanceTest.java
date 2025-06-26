/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package hospital;

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
public class AmbulanceTest {
    
    public AmbulanceTest() {
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
     * Test of getStatus method, of class Ambulance.
     */
   

    /**
     * Test of changeStatus method, of class Ambulance.
     */
    @Test
    public void testChangeStatus() {
        System.out.println("changeStatus");
        String newStatus = "en route";
        Ambulance instance = new Ambulance("A1");
        instance.changeStatus(newStatus);
        // TODO review the generated test code and remove the default call to fail.
        assertEquals("en route", instance.getStatus());
    }

    /**
     * Test of setDestinationHospital method, of class Ambulance.
     */
    @Test
    public void testSetDestinationHospital() {
        System.out.println("setDestinationHospital");
        Hospital h = new Hospital("Nairobi Hospital", 2);
        Ambulance instance = new Ambulance("A1");
        instance.setDestinationHospital(h);
        // TODO review the generated test code and remove the default call to fail.
        
    }
    
}
