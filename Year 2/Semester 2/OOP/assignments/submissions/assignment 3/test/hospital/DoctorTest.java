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
public class DoctorTest {
    
    public DoctorTest() {
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
     * Test of treat method, of class Doctor.
     */
    @Test
    public void testTreat() {
        System.out.println("treat");
        Patient p = new Patient("John", 7);
        Doctor d = new Doctor("Dr_Smith ", 5);
        d.treat(p);
//        assertEquals("The updated severity level of " + p.getName() + " is 2 " , p.getSeverityLevel());
     
    }

    /**
     * Test of checkRecovery method, of class Doctor.
     */
    @Test
    public void testCheckRecovery() {
        System.out.println("checkRecovery");
        Patient p = new Patient("John", 7);
        Doctor instance = new Doctor("Dr_Smith", 5);
        String expResult = "Patient still criticial";
        String result = instance.checkRecovery(p);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of assignHospital method, of class Doctor.
     */
    @Test
    public void testAssignHospital() {
        System.out.println("assignHospital");
        Hospital h = new Hospital("City_Medical_Center ", 2);
        Doctor instance = new Doctor("Dr_Smith", 5);
        instance.assignHospital(h);
        
    }



    /**
     * Test of isAssigned method, of class Doctor.
     */
    @Test
    public void testIsAssigned() {
        System.out.println("isAssigned");
        Doctor instance = new Doctor("Dr_Smith", 5);
        Hospital h = new Hospital("City_Medical_Center ", 2);
        instance.assignHospital(h);
        boolean expResult = true;
        boolean result = instance.isAssigned();
        assertEquals(expResult, result);
    
    }

  
//    }
    
}
