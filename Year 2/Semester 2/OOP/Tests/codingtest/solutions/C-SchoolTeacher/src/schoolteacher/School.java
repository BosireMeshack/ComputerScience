/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author ivf370
 */
public class School {
    private String name;
    private List<Teacher> teachers;
    
    
    public School(String name)
    {
        this.name = name;
        teachers = new ArrayList<>();
    }
    
    public void addTeacher(Teacher teacher)
    {
        teachers.add(teacher);
    }
    
      public void removeTeacher(Teacher teacher)
    {
        teachers.remove(teacher);
    }
      
    public Teacher getTeacherByName(String name)
    {
        Teacher t = null;
        Boolean n = false;
        for(Teacher e: teachers)
        {
            if(e.getName().equals(name))
            {
                t = e;
                break;
            }
        }
        return t;
    }
    
    
    public int getTeacherCount(){
        return teachers.size();
    }
    
    public String getName()
    {
        return name;
    }
    
    public List<Teacher> getTeachers()
    {
        return teachers;
    }
}
