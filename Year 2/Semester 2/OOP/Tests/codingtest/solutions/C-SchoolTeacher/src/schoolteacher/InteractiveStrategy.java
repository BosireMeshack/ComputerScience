/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

/**
 *
 * @author ivf370
 */
public class InteractiveStrategy implements TeachingStrategy{
    private InteractiveStrategy instance;

    
    public InteractiveStrategy getInstance(){
        if(instance == null)
        {
            instance = new InteractiveStrategy();
        }
        return instance;
    }
    
    @Override
    public int calculateEffectiveness(Teacher teacher)
    {
        return 2*teacher.getPatience();
    }
}
