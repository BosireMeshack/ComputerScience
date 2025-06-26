package schoolteacher;


public class SchoolTeacher {

    public static void main(String[] args) {
        EducationalDistrict district = new EducationalDistrict();

        School s1 = new School("Elementary School");
        Teacher t1 = new Teacher("Ms. Johnson", 8, 9, 7);
        t1.setTeachingStrategy(new LectureStrategy());
        s1.addTeacher(t1);

        School s2 = new School("High School");
        Teacher t2 = new Teacher("Mr. Brown", 6, 8, 9);
        t2.setTeachingStrategy(new ProjectStrategy());
        s2.addTeacher(t2);

        Teacher t3 = new Teacher("Ms. Davis", 7, 6, 8);
        t3.setTeachingStrategy(new InteractiveStrategy());
        Teacher t4 = new Teacher("Mr. Wilson", 9, 7, 6);
        t4.setTeachingStrategy(new LectureStrategy());
        Teacher t5 = new Teacher("Ms. Garcia", 5, 8, 7);
        t5.setTeachingStrategy(new ProjectStrategy());

        s1.addTeacher(t3);
        s1.addTeacher(t4);
        s1.addTeacher(t5);

        district.addSchool(s1);
        district.addSchool(s2);

        System.out.println("=== Base Exercise Results ===");
        School teacherSchool = district.findTeacherSchool("Ms. Johnson");
        System.out.println("Ms. Johnson is assigned to: " + teacherSchool.getName());

        Teacher mostEffective = district.findMostEffectiveTeacher();
        System.out.println("Most effective teacher: " + mostEffective.getName()
                + " with effectiveness " + mostEffective.getTeachingEffectiveness());

        System.out.println("Schools with at least 4 teachers:");
        for (School s : district.getSchoolsWithMinTeachers(4)) {
            System.out.println("- " + s.getName() + " (" + s.getTeacherCount() + " teachers)");
        }

//        System.out.println("\n=== Extension Results ===");
//        Projector projector = new Projector("Smart Projector", 2000, 5);
//        Whiteboard whiteboard = new Whiteboard("Interactive Board", 1000, 8);
//        Computer computer = new Computer("Laptop", 1500, 3);
//
//        s1.addResource(projector);
//        s1.addResource(whiteboard);
//        s2.addResource(computer);
//
//        System.out.println("Total annual resource budget for " + s1.getName() + ": $" + s1.getTotalAnnualResourceBudget());
//        System.out.println("Total annual resource budget for " + s2.getName() + ": $" + s2.getTotalAnnualResourceBudget());
    }

}
