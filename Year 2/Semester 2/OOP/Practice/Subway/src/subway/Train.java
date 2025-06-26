/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package subway;

import subway.exceptions.NonEmptyCarException;
import subway.exceptions.DuplicateCarException;
import subway.exceptions.CarAlreadyBelongsToTrainException;
import subway.exceptions.InvalidTrainSizeException;
import java.util.ArrayList;

/**
 *
 * @author mekigelashvili
 */
public class Train {

    public ArrayList<Car> cars;

    public Train(ArrayList<Car> cs) throws InvalidTrainSizeException, CarAlreadyBelongsToTrainException, DuplicateCarException {
        cars = new ArrayList<>();
        if (cs.size() < 4 || cs.size() > 6) {
       
            throw new InvalidTrainSizeException();
        }
        for (Car c : cs) {
            if (c.train != null) {
                throw new CarAlreadyBelongsToTrainException();
            }
            if (cars.contains(c)) {
                throw new DuplicateCarException();
            }
            cars.add(c);
            c.train = this;
        }
//        for (Car c : cars) {
//            c.train = this;
//        }
    }

    public void add(Car c) throws InvalidTrainSizeException, CarAlreadyBelongsToTrainException, DuplicateCarException {
        if (cars.size() >= 6 ) {
            throw new InvalidTrainSizeException();
        }
        if (c.train != null) {
            throw new CarAlreadyBelongsToTrainException();
        }
        if (cars.contains(c)) {
            throw new DuplicateCarException();
        }
        cars.add(c);
        c.train = this;
    }

    public void remove(Car c) throws InvalidTrainSizeException, NonEmptyCarException {
        if (cars.size() <= 4) {
            throw new InvalidTrainSizeException();
        }
        if (c.number > 0) {
            throw new NonEmptyCarException();
        }
        cars.remove(c);
        c.train = null;
    }
}
