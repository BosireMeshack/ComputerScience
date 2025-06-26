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
public class EducationalDistrict {
    private List<School> schools;
    
    
    public EducationalDistrict()
    {
        this.schools = new ArrayList<>();
    }
    
    public void addSchool(School school)
    {
        schools.add(school);
    }
    
    public School findTeacherSchool(String teacherName)
    {
        Teacher teacher = null;
        for(School e: schools)
        {
           teacher = e.getTeacherByName(teacherName);
           if(teacher!=null)
        {
            return e;
        }
        }
        return null;
        
    }
    
    public Teacher findMostEffectiveTeacher()
    {
        int maxEffectiveness =-1;
        Teacher bestTeacher = null;
        for(School s: schools)
        {
            int effectiveness;
            for(Teacher t: s.getTeachers() )
            {
                effectiveness = t.getTeachingEffectiveness();
                if(effectiveness > maxEffectiveness)
                {
                    maxEffectiveness = effectiveness;
                    bestTeacher = t;
                }
            }
        }
        return bestTeacher;
    }
    
    public List<School> getSchoolsWithMinTeachers(int minCount)
    {
        List<School> result = new ArrayList<>();
        
        for(School s: schools)
        {
           if(s.getTeacherCount()>=minCount)
           {
               result.add(s);
           }
        }
        return result;
    }
    
    public List<Teacher> getAllTeachers()
    {
        List<Teacher> allTeachers = new ArrayList<>();
        
        for(School s: schools)
        {
          allTeachers.addAll(s.getTeachers());
        }
        return allTeachers;
    }
}
