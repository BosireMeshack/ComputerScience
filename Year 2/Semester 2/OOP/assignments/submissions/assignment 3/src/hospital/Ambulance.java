/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hospital;

/**
 *
 * @author meshagwe
 */
/** Representation of Ambulance */
public class Ambulance {
    private String id;
    private String status;
    private Hospital destinationHospital;
    
    /** Constructor */
    public Ambulance(String id)
    {
        this.id = id;
        this.status = "available";
    }
    
    /** Get ambulance status */
    public String getStatus()
    {
        return status;
    }
    
    /** change ambulance status */
    
    public void changeStatus(String newStatus) 
    {
        if(newStatus == null || newStatus.isEmpty()) throw new IllegalArgumentException("Invalid Status");
        this.status = newStatus;
    }
    
    /** Sets destination hospital */
    public void setDestinationHospital(Hospital h)
    {
        if(h == null) throw new IllegalArgumentException("Destination hospital has not been set");
        this.destinationHospital = h;
    }
    
    public String getId()
    {
        return id;
    }
    
    public Hospital getDestination()
    {
        return destinationHospital;
    }
}
