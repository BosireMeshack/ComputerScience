/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookpublishing;

/**
 *
 * @author famil
 */
// abstract means that this call cannot be modified by itself, it can only be extended and modified by the child classes
public abstract class Occupation {
    private Person person;

    public Occupation(Person person) {
        this.person = person;
        person.addOccupation(this);
    }

    protected Person getPerson() {
        return person;
    }
}
