/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package frequency;

/**
 * 
 * Author   : Gregorics Tibor
 * Date     : 2021.10.24.
 * Title    : Read from text file
 * 
 * @author Farizi Muhammad Al
 * Date     : 2025.02.10
 * Title    : Translation in Java
 * 
 * Lecturer : Pinter Balazs.
 */

/// <summary>
/// class of bags (multiplicative sets) which can contain the same element several times
/// </summary>
public class Bag {
    
    public class NegativeSizeException extends RuntimeException {}  // when the parameter of constructor is negative
    public class EmptyBagException extends RuntimeException {}  // when the method MostFrequented() is called on an empty bag
    public class IllegalElementException extends RuntimeException {} // when the insert method is called with the element which is not in the interval 0 .. max
    
    /**
     * representation of a bag
     */
    protected int[] vec;
    /**
     * the most frequented integer of the bag (list)
     */
    protected int max;
    
    /**
     * Create an empty bag
     * @param m the upper limit of the natural numbers in the bag
     */
    public Bag(int m){
        if (m < 0) throw new NegativeSizeException();
        vec = new int[m+1]; // all elements initialized to 0 by default
        // for (int i = 0; i <= m; ++i) vec[i]=0; 
        max = 0;        
        
        
    }
    
    //Task: 	erasing the bag
    //Input:    Bag this   -  the bag
    //Output:   Bag this   -  the bag
    //Activity: sets to zero the elements of vec and maintains the type invariant
    /**
     * Erase (empty) the bag.
     */
    public void erase(){
        for (int i = 0; i < vec.length; ++i) vec[i] = 0;
        max = 0;
    }
    
    //Task: 	putting an integer into the bag
    //Input:    Bag this   -  the bag
    //          int e      -  the integer being put in
    //Output:   Bag this   -  the bag
    //Activity: increases the occurrence frequency of 'e' in vec and maintains the type invariant
    /**
     * Insert an element into the bag.
     * @param e the element
     */
    public void insert(int e){
        if (e < 0 || e >= vec.length) throw new IllegalElementException();
        if (++vec[e] > vec[max]) max = e;
    }
    
    //Task: 	retrieves the most frequent integer of the bag
    //Input:    Bag this    -  the bag
    //Output:   int max     -  most frequent integer of the bag
    //Activity: gives vec[max] if vec[max]>0 (bag is not empty)
    /**
     * Retrieve the most frequent integer of the bag.
     * @return most frequent integer
     */
    public int mostFrequent() {
        if (vec[max] == 0) throw new EmptyBagException();
        return max;
    }
    
}
