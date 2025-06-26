/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import java.util.List;

public class SchoolTeacherBaseTest {
    
    private EducationalDistrict district;
    private School school1;
    private School school2;
    private Teacher teacher1;
    private Teacher teacher2;
    private Teacher teacher3;
    
    @Before
    public void setUp() {
        district = new EducationalDistrict();
        school1 = new School("Elementary School");
        school2 = new School("High School");
        
        teacher1 = new Teacher("Ms. Johnson", 8, 9, 7);
        teacher2 = new Teacher("Mr. Brown", 6, 8, 9);
        teacher3 = new Teacher("Ms. Davis", 9, 7, 8);
        
        teacher1.setTeachingStrategy(new LectureStrategy());
        teacher2.setTeachingStrategy(new InteractiveStrategy());
        teacher3.setTeachingStrategy(new ProjectStrategy());
        
        school1.addTeacher(teacher1);
        school1.addTeacher(teacher2);
        school2.addTeacher(teacher3);
        
        district.addSchool(school1);
        district.addSchool(school2);
    }
    
    @Test
    public void testLectureStrategy() {
        assertEquals(16, teacher1.getTeachingEffectiveness()); // 9 + 7
    }
    
    @Test
    public void testInteractiveStrategy() {
        assertEquals(12, teacher2.getTeachingEffectiveness()); // 2 * 6
    }
    
    @Test
    public void testProjectStrategy() {
        assertEquals(24, teacher3.getTeachingEffectiveness()); // 3 * 8
    }
    
    @Test
    public void testStrategyChange() {
        teacher1.setTeachingStrategy(new ProjectStrategy());
        assertEquals(21, teacher1.getTeachingEffectiveness()); // 3 * 7
        
        teacher2.setTeachingStrategy(new LectureStrategy());
        assertEquals(17, teacher2.getTeachingEffectiveness()); // 8 + 9
    }
    
    @Test
    public void testFindTeacherSchool() {
        School found = district.findTeacherSchool("Ms. Johnson");
        assertEquals(school1, found);
        
        found = district.findTeacherSchool("Ms. Davis");
        assertEquals(school2, found);
        
        found = district.findTeacherSchool("Unknown");
        assertNull(found);
    }
    
    @Test
    public void testFindMostEffectiveTeacher() {
        Teacher best = district.findMostEffectiveTeacher();
        assertEquals(teacher3, best);
        
        // Add an even more effective teacher
        Teacher superTeacher = new Teacher("Dr. Super", 10, 10, 10);
        superTeacher.setTeachingStrategy(new ProjectStrategy());
        school1.addTeacher(superTeacher);
        
        best = district.findMostEffectiveTeacher();
        assertEquals(superTeacher, best);
    }
    
    @Test
    public void testSchoolsWithMinTeachers() {
        List<School> result = district.getSchoolsWithMinTeachers(2);
        assertEquals(1, result.size());
        assertEquals(school1, result.get(0));
        
        result = district.getSchoolsWithMinTeachers(3);
        assertEquals(0, result.size());
        
        // Add more teachers
        Teacher t4 = new Teacher("Mr. Wilson", 5, 6, 7);
        t4.setTeachingStrategy(new LectureStrategy());
        Teacher t5 = new Teacher("Ms. Garcia", 7, 8, 6);
        t5.setTeachingStrategy(new InteractiveStrategy());
        
        school1.addTeacher(t4);
        school1.addTeacher(t5);
        
        result = district.getSchoolsWithMinTeachers(4);
        assertEquals(1, result.size());
        assertEquals(school1, result.get(0));
    }
    
    @Test
    public void testGetTeacherByName() {
        Teacher found = school1.getTeacherByName("Ms. Johnson");
        assertEquals(teacher1, found);
        
        found = school1.getTeacherByName("Unknown");
        assertNull(found);
    }
    
    @Test
    public void testTeacherCount() {
        assertEquals(2, school1.getTeacherCount());
        assertEquals(1, school2.getTeacherCount());
        
        Teacher newTeacher = new Teacher("Dr. New", 6, 7, 8);
        newTeacher.setTeachingStrategy(new LectureStrategy());
        school2.addTeacher(newTeacher);
        
        assertEquals(2, school2.getTeacherCount());
    }
    
    @Test
    public void testTeacherAddRemove() {
        assertEquals(2, school1.getTeachers().size());
        
        Teacher newTeacher = new Teacher("Dr. Temp", 5, 5, 5);
        newTeacher.setTeachingStrategy(new LectureStrategy());
        school1.addTeacher(newTeacher);
        assertEquals(3, school1.getTeachers().size());
        
        school1.removeTeacher(teacher1);
        assertEquals(2, school1.getTeachers().size());
        assertFalse(school1.getTeachers().contains(teacher1));
    }
    
    @Test
    public void testGetAllTeachers() {
        List<Teacher> allTeachers = district.getAllTeachers();
        assertEquals(3, allTeachers.size());
        assertTrue(allTeachers.contains(teacher1));
        assertTrue(allTeachers.contains(teacher2));
        assertTrue(allTeachers.contains(teacher3));
    }
    
    @Test
    public void testEmptySchoolEffectiveness() {
        School emptySchool = new School("Empty School");
        district.addSchool(emptySchool);
        
        assertEquals(0, emptySchool.getTeacherCount());
        assertNull(emptySchool.getTeacherByName("Anyone"));
    }
}
