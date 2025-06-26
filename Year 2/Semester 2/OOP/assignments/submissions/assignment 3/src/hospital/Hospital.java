/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hospital;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author meshagwe
 */
public class Hospital {
    private String name;
    private int capacity;
    private List<Patient> patients = new ArrayList<>();
    private List<Doctor> doctors = new ArrayList<>();
    private String registrationStatus =  "null";
    
    /** Constructor */
    public Hospital (String name, int capacity)
    {
        this.name = name;
        this.capacity = capacity;
    }
    
    /** registers a patient */
    public void registerPatient(Patient p)
    {
        if(p==null) throw new IllegalArgumentException("Patient needs to be set");
        if (patients.contains(p)) throw new IllegalStateException ("Patient already registered");
        if(patients.size() > capacity) throw new IllegalStateException ("Hospital at full capacity");
        patients.add(p);
        
    }
    
    /** register a doctor */
    
    public void registerDoctor(Doctor d)
    {
        if(d==null) throw new IllegalArgumentException("Doctor cannot be null");
        if(doctors.contains(d)) throw new IllegalStateException ("Doctor already registered");
        if(d.isAssigned()) throw new IllegalStateException ("Doctor already assigned to a hospital");
        doctors.add(d);
        d.assignHospital(this);
    }
    
    /** Instruct all doctors to treat assigned patients */
    public void instructDoctor()
    {
        for(Doctor d: doctors)
        {
            for (Patient p : patients)
            {
                d.treat(p);
            }
        }
    }
    
    public String getName() 
    {
        return name;
    }
}
