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
public class HospitalTest {
    
    public HospitalTest() {
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
     * Test of registerPatient method, of class Hospital.
     */
    @Test
    public void testRegisterPatient() {
        System.out.println("registerPatient");
        Patient p = new Patient("John", 7);
        Hospital instance = new Hospital("City_Medical_Center", 2);
        instance.registerPatient(p);
     
    }

    /**
     * Test of registerDoctor method, of class Hospital.
     */
    @Test
    public void testRegisterDoctor() {
        System.out.println("registerDoctor");
        Doctor d = new Doctor("Dr_Smith ", 5);
        Hospital instance = new Hospital("City_Medical_Center", 2);
        instance.registerDoctor(d);
  
    }

    /**
     * Test of instructDoctor method, of class Hospital.
     */
    @Test
    public void testInstructDoctor() {
        System.out.println("instructDoctor");
        Hospital instance = new Hospital("City_Medical_Center", 2);
        instance.instructDoctor();
       
    }

   
}
