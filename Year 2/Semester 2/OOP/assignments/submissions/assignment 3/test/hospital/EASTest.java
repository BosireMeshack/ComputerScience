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
public class EASTest {
    
    public EASTest() {
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
     * Test of registerHospital method, of class EAS.
     */
     @Test
    public void testEASInitialization() {
        Hospital h = new Hospital("Eldoret Hospital", 1);
        Ambulance a = new Ambulance("A3");
        EAS eas = new EAS(new Hospital[]{h}, new Ambulance[]{a});
        // No exception expected
    }

    /**
     * Test of registerAmbulance method, of class EAS.
     */
    
    
}
