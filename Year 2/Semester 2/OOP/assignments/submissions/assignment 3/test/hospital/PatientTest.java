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
public class PatientTest {
    
    public PatientTest() {
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
     * Test of setStatus method, of class Patient.
     */
    @Test
    public void testSetStatus() {
        System.out.println("setStatus");
        boolean status = false;
        Patient instance = new Patient("John", 7);
        instance.setStatus(status);
       
    }

    /**
     * Test of recoveryProgress method, of class Patient.
     */
    @Test
    public void testRecoveryProgress() {
        System.out.println("recoveryProgress");
        int sL = 0;
        Patient instance = new Patient("John", 7);
        String expResult = "Recovery updated: Severity Level 0, Status: Critical";
        String result = instance.recoveryProgress(sL);
        assertEquals(expResult, result);
        
    }

   
}
