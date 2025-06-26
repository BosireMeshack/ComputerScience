/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookpublishing;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author famil
 */
public class Person {
    private String name;
    private String taj;
    private String tax;
    private List<Occupation> occupations;

    public Person(String name, String taj, String tax) {
        this.name = name;
        this.taj = taj;
        this.tax = tax;
        this.occupations = new ArrayList<>();
    }
    
    public void addOccupation(Occupation occ) {
        this.occupations.add(occ);
    }
    
    public boolean removeOccupation(Occupation occ) {
        return this.occupations.remove(occ);
    }

    public String getName() {
        return name;
    }

    public String getTaj() {
        return taj;
    }

    public String getTax() {
        return tax;
    }
}