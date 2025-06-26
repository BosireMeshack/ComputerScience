/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package frequency;

import org.junit.Test;
import org.junit.Assert;

/**
 *
 * @author zizi
 */
class TransparentBag extends Bag {
    public TransparentBag(int m) { super(m); }

    public int[] getVec() {
        return vec;
    }
}

public class BagTest {
    
    @Test
    public void TestPutIn_PutInNewElement()
    {
        Bag b = new Bag(2);
        b.insert(1);
        Assert.assertEquals(1, b.mostFrequent());
    }
    
    @Test
    public void testPutIn_ExistingElement() {
        TransparentBag bag = new TransparentBag(2);
        Assert.assertEquals(0, bag.getVec()[0]);  
        bag.insert(1);
        Assert.assertEquals(1, bag.getVec()[1]);
        bag.insert(2);
        Assert.assertEquals(1, bag.getVec()[2]);
        bag.insert(2);
        Assert.assertEquals(2, bag.getVec()[2]);    
    }
    
    
    @Test(expected = Bag.IllegalElementException.class)
    public void testPutIn_IllegalElement() {
        Bag bag = new Bag(2);
        bag.insert(3);
        // Assert.assertThrows(Bag.IllegalElementException.class, () -> bag.putIn(3));
    }

    @Test(expected = Bag.EmptyBagException.class)
    public void testMostFrequent_EmptyBag() {
        Bag bag = new Bag(2);
        bag.mostFrequent();
        // Assert.assertThrows(Bag.EmptyBagException.class, () -> bag.mostFrequent());
    }

    @Test(expected = Bag.NegativeSizeException.class)
    public void testBag_NegativeParam() {
        new Bag(-2);
        // Assert.assertThrows(Bag.NegativeSizeException.class, () -> new Bag(-2));
    }

}
