/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package subway;

import subway.exceptions.RiderAlreadyOnCarException;
import subway.exceptions.RiderNotOnCarException;
import subway.exceptions.NonEmptyCarException;
import subway.exceptions.DuplicateCarException;
import subway.exceptions.CarAlreadyBelongsToTrainException;
import subway.exceptions.InvalidTrainSizeException;
import subway.exceptions.CarFullException;
import subway.exceptions.CarDoesntBelongToTrainException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mekigelashvili
 */
public class Main {

    public static void main(String[] args) {
        // Create some cars
        Car car1 = new Car();
        Car car2 = new Car();
        Car car3 = new Car();
        Car car4 = new Car();

        // Create a list of cars and add them to a train
        ArrayList<Car> carList = new ArrayList<>();
        carList.add(car1);
        carList.add(car2);
        carList.add(car3);
        //carList.add(car4);

        try {
            Train train = new Train(carList);

            // Create a rider
            Rider rider = new Rider();

            // Rider gets on the first car
            car1.getOn(rider);
            System.out.println("Rider got on car 1. Car 1 passenger count: " + car1.number);

            // Rider gets off the first car
            car1.getOff(rider);
            System.out.println("Rider got off car 1. Car 1 passenger count: " + car1.number);

            // add a new car to the train
            Car car5 = new Car();
            train.add(car5);
            System.out.println("Added car 5 to the train. Total cars in train: " + train.cars.size());

            // remove a car from the train
            train.remove(car5);
            System.out.println("Removed car 5 from the train. Total cars in train: " + train.cars.size());

           
        } 
        catch (InvalidTrainSizeException ex) 
        {
            System.out.println("Invalid train size. "
            );
        } 
        catch (CarAlreadyBelongsToTrainException ex) 
        {
            System.out.println("The car already belongs to a train, so it cannot be attached to two trains at once.");
        } 
        catch (DuplicateCarException ex) 
        {
            System.out.println("A duplicate of a car was trying to be part of a new train.");
        } 
        catch (CarDoesntBelongToTrainException ex) 
        {
            System.out.println("The car doesn't belong to a train.");
        } 
        catch (CarFullException ex) 
        {
            System.out.println("The car is already full");
        } 
        catch (RiderAlreadyOnCarException ex)
        {
            System.out.println("The rider is already on the car.");
        } 
        catch (RiderNotOnCarException ex) 
        {
            System.out.println("The rider who wanted to get off the car is not in it.");
        }
        catch (NonEmptyCarException ex) 
        {
            System.out.println("The car still has riders.");
        }
    }
}
