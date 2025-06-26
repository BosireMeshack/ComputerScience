/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hospital;

/**
 *
 * @author meshagwe
 */

/** Doctor representation */
public class Doctor {
    private String name;
    private int efficiencyLevel;
    private Hospital hospital = null;
    private boolean assigned;
    
 /** Doctor constructor */
public Doctor(String name, int efficiencyLevel) 
    {
    this.name = name;
    this.efficiencyLevel = efficiencyLevel;
    this.assigned = false;
    }

/** Treat patient */
public void treat(Patient p) {
    if(p==null) throw new IllegalArgumentException("Patient cannot be null");
    int newLevel = p.getSeverityLevel() - efficiencyLevel;
    int updatedLevel = Math.max(newLevel, 0);
    
    if(newLevel <= 0) {
        p.setStatus(true);
    } else {
        p.setStatus(false);
    }
   
    p.recoveryProgress(updatedLevel);
}



/** Check recovery status */
public String checkRecovery(Patient p)
{
    String result;
    if (p == null) throw new IllegalArgumentException("Patient cannot be null");
    if(p.getStatus())
    {
        result = "Patient has recovered";
    } else {
        result = "Patient still criticial";
    }
    return result;
}

/** Assigns the doctor to hospital and changes assigned to true */
public void assignHospital(Hospital h) {
        if (h == null) throw new IllegalArgumentException("Hospital cannot be null");

        this.hospital = h;
        this.assigned = true;
}

public Hospital getHospital() { return hospital; }
public boolean isAssigned() { return assigned; }
public String getName()
{
    return this.name;
}

public int getEfficiencyLevel()
{
    return efficiencyLevel;
}

}



