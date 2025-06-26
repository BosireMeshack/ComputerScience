/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package cakeshop;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author famil
 */
public class CakeShopTest {
    private CakeShop shop;
    private Cake chocolateCake;
    private Cake vanillaCake;
    private Cake strawberryCake;

    @Before
    public void setUp() {
        shop = new CakeShop();
        chocolateCake = new Cake("Chocolate Cake", "Brown", 1.5, 20.0);
        vanillaCake = new Cake("Vanilla Cake", "White", 1.2, 18.0);
        strawberryCake = new Cake("Strawberry Cake", "Pink", 1.3, 22.0);
        
        shop.registerCake(chocolateCake);
        shop.registerCake(vanillaCake);
        shop.registerCake(strawberryCake);
    }

    @Test
    public void testRegisterCake() {
        Cake newCake = new Cake("Blueberry Cake", "Blue", 1.4, 25.0);
        shop.registerCake(newCake);
        assertEquals(newCake, shop.findFirstCakeWithColor("Blue"));
    }

    @Test
    public void testSellCake() {
        assertTrue(shop.sellCake(vanillaCake));
        assertFalse(shop.sellCake(vanillaCake));
    }

    @Test
    public void testFindFirstCakeWithColor() {
        assertEquals(strawberryCake, shop.findFirstCakeWithColor("Pink"));
        assertNull(shop.findFirstCakeWithColor("Blue"));
    }

    @Test
    public void testFindLargestCake() {
        assertEquals(chocolateCake, shop.findLargestCake());
    }

    @Test
    public void testFindCheapestCake() {
        assertEquals(vanillaCake, shop.findCheapestCake());
    }

    @Test
    public void testCountCake() {
        assertEquals(1, shop.countCake("Brown"));
        assertEquals(0, shop.countCake("Blue"));
    }

    @Test
    public void testCalculateTotalWorth() {
        assertEquals(60.0, shop.calculateTotalWorth(), 0.01);
        shop.sellCake(vanillaCake);
        assertEquals(42.0, shop.calculateTotalWorth(), 0.01);
    }

    @Test
    public void testTotalSoldCakes() {
        assertEquals(0, shop.totalSoldCakes());
        shop.sellCake(vanillaCake);
        assertEquals(1, shop.totalSoldCakes());
    }
}