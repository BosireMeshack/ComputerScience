/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package student;

/**
 *
 * @author Baghirov Maksud
 */
public class Main {
    public static void main(String[] args) {
        Student student = new Student("Maksud", "xb058t");
        
        student.enroll("Software Technology");
        student.enroll("FOTOC1");
        student.enroll("Russian language 1");
        
        System.out.println("Initial courses: " + student.getCourses());
        
        //Working test case - true
        boolean status = student.drop("Russian language 1");
        System.out.println("Subject 'Russian Language 1' dropped status: " + status);
        
        //We havent enrolled to subject MATH - FALSE
        status = student.drop("MATH");
        System.out.println("Subject 'MATH' dropped status: " + status);
        System.out.println("Final courses: " + student.getCourses());
    }
    
}
