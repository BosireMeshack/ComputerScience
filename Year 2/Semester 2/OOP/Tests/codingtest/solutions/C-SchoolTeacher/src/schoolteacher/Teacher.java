/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schoolteacher;

/**
 *
 * @author ivf370
 */
public class Teacher {
    private String name;
    private int patience;
    private int knowledge;
    private int charisma;
    private TeachingStrategy teachingStrategy;
    
    public Teacher(String name, int patience, int knowledge, int charisma)
    {
        this.name = name;
        this.patience = patience;
        this.knowledge = knowledge;
        this.charisma = charisma;
        this.teachingStrategy = null;
    }
    
    public void setTeachingStrategy(TeachingStrategy strategy)
    {
        if(strategy!=null)
        {
            this.teachingStrategy = strategy;
        }
        
    }
    
    public int getTeachingEffectiveness() {
        return teachingStrategy.calculateEffectiveness(this);
    }
    
    public String getName()
    {
        return name;
    }
    
    public int getPatience()
    {
        return patience;
    }
    
    public int getKnowledge()
    {
        return knowledge;
    }
    
    public int getCharisma()
    {
        return charisma;
    }
}