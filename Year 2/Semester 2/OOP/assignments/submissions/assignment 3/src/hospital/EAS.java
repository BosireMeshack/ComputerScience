/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hospital;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.*;

/**
 *
 * @author meshagwe
 * Main Emergency Alert System class
 */

public class EAS {
    private List<Hospital> hospitals = new ArrayList<>();
    private List<Ambulance> ambulances = new ArrayList<>();
    
    /** Constructor */
    public EAS(Hospital[] hospitals, Ambulance[] ambulances) {
        if (hospitals != null)
        {
            this.hospitals.addAll(Arrays.asList(hospitals));
        }
        if (ambulances != null)
        {
            this.ambulances.addAll(Arrays.asList(ambulances));
        }
        
    }
    
    /** Registers a new hospital */
    public void registerHospital(Hospital h) {
        if(h==null) throw new IllegalArgumentException("Hospital cannot be null");
        if(hospitals.contains(h)) throw new IllegalStateException ("Hospital is already registered");
        hospitals.add(h);
    }
    
    /** Registers  a new ambulance */
    
    public void registerAmbulance(Ambulance a) 
    {
        if(a==null) throw new IllegalArgumentException ("Ambulance cannot be null");
        if(ambulances.contains(a)) throw new IllegalStateException("Ambulance already registered");
        ambulances.add(a);
    }

    void registerPatient(Patient amb1) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
