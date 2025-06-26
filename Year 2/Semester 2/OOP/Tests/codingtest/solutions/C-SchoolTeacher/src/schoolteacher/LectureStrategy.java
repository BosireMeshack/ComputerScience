/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

/**
 *
 * @author ivf370
 */
public class LectureStrategy implements TeachingStrategy{
    private LectureStrategy instance;

    
    public LectureStrategy getInstance(){
        if(instance == null)
        {
            instance = new LectureStrategy();
        }
        return instance;
    }
    
    @Override
    public int calculateEffectiveness(Teacher teacher)
    {
        return teacher.getKnowledge() + teacher.getCharisma();
    }
    
}
