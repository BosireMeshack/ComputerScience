package student;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Baghirov Maksud
 */
public class Student {
    private String name;
    private String neptun;
    private List<String> courses = new ArrayList<>();
    
    public Student(String name, String neptun) {
        this.name = name;
        this.neptun = neptun;
    }
    
    public String getName() {
     return this.name;   
    }
    
    public void setName(String name) {
        this.name = name;
    }    
    
    public String getNeptun() {
        return this.neptun;
    }
    
    public void setNeptun(String neptun) {
        this.neptun = neptun;
    }
    
    public List<String> getCourses(){
    return this.courses;
    }
    
    public void enroll(String course){
        courses.add(course);
    }
    
    public boolean drop(String course){
        return courses.remove(course);
    }
}
    
