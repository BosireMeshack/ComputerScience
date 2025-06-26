/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

/**
 *
 * @author ivf370
 */
public class ProjectStrategy implements TeachingStrategy{
    private ProjectStrategy instance;

    
    public ProjectStrategy getInstance(){
        if(instance == null)
        {
            instance = new ProjectStrategy();
        }
        return instance;
    }
    
    @Override
    public int calculateEffectiveness(Teacher teacher)
    {
        return 3*teacher.getCharisma();
    }
}
