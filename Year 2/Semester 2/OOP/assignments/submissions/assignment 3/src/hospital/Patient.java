/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hospital;

/**
 *
 * @author meshagwe
 */

/** Represents a patient in the system */
public class Patient {
    
    private String name;
    private int severityLevel;
    private boolean status;
    
    /** create a new patient*/
    public Patient(String name, int severityLevel) {
        this.name = name;
        this.severityLevel = severityLevel;
    }
    
     public void setStatus(boolean status)
    {
        this.status = status;
    }
    
    
    /** updates recovery progress and status */
    public String recoveryProgress(int sL) {
        this.severityLevel = sL;
        String statusText;
        if (getStatus()) {
            statusText = "Recovered";
        } else {
            statusText = "Critical";
        }
        
        return "Recovery updated: Severity Level " + sL + ", Status: "+ statusText;
    }
    
   
    public int getSeverityLevel() {
        return severityLevel;
    }
    
    public boolean getStatus()
    {
        return status;
    }
    
    public String getName() {
        return name;
    }
    
}

