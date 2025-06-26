/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package hospital;

/**
 *
 * @author meshagwe
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
    try {
        // Hospitals
        Hospital h1 = new Hospital("City_Medical_Center ", 2);
        Hospital h2 = new Hospital("General_Hospital ", 3);
        
        
        // Doctors
        Doctor d1 = new Doctor("Dr_Smith ", 5);
        Doctor d2 = new Doctor("Dr_Adam ", 3);
        Doctor d3 = new Doctor("Dr Farizi", 8);
        
   
        // Ambulances
        Ambulance amb1 =  new Ambulance("A1");
        Ambulance amb2 = new Ambulance("A2");
        Ambulance amb3 = new Ambulance("A3");
        Ambulance amb4 = new Ambulance("A4");
        
        Patient p1 = new Patient("John", 7);
        Patient p2 = new Patient("Alice", 4);
        Patient p3 = new Patient("Bob", 9);
        Patient p4 = new Patient("Eve", 6);
        Patient p5 = new Patient("Charlie", 3);
        
        
        
        h1.registerDoctor(d1);
        h1.registerPatient(p1);
        h2.registerDoctor(d2);
        h2.registerPatient(p2);
        
        
        d1.treat(p1);
        d1.assignHospital(h2);
        System.out.println(d1.getHospital());
        System.out.println(d1.isAssigned());
        System.out.println(d1.getName());
        System.out.println(p1.getStatus());
        System.out.println("Recovery Status: "+ d1.checkRecovery(p1));
        

        System.out.println(p1.recoveryProgress(0));
        
        amb1.setDestinationHospital(h1);
        amb1.changeStatus("en route");
        System.out.println(amb1.getStatus());
        
        amb2.setDestinationHospital(h2);
        amb2.changeStatus("Thika road");
        
        System.out.println(amb2.getStatus());
        Hospital[] hospitals = {h1, h2};
        Ambulance[] ambulances = {amb1, amb2};
//        
        EAS system = new EAS(hospitals, ambulances) ;
        System.out.println("System initialized with hospital; " + h1.getName());
        System.out.println("System initialized with hospital; " + h2.getName());
        System.out.println("System initialized with ambulance of ID:" + amb2.getId());
        System.out.println("System initialized with ambulance of ID:" + amb1.getId());

        // Negative test cases
//        try {
//            h1.registerDoctor(d1); // Already registered
//        } catch (IllegalStateException e)
//        {
//            System.out.println("Exception error: " + e.getMessage());
//        }
        
//         try {
//                system.registerHospital(h1); // Already registered
//          } catch (IllegalStateException e) {
//                System.out.println("Expected error: " + e.getMessage());
//          }

//          try {
//                system.registerAmbulance(amb1); // Already registered
//            } catch (IllegalStateException e) {
//                System.out.println("Expected error: " + e.getMessage());
//            }

//          try {
//                h2.registerPatient(p2); // Already registered
//            } catch (IllegalStateException e) {
//                System.out.println("Expected error: " + e.getMessage());
//            }
          
    } catch (IllegalArgumentException e) {
            System.out.println("Error" + e.getMessage());
    } 
    
    
}}
