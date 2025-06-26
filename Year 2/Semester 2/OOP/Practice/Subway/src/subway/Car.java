/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package subway;

import subway.exceptions.RiderAlreadyOnCarException;
import subway.exceptions.RiderNotOnCarException;
import subway.exceptions.CarFullException;
import subway.exceptions.CarDoesntBelongToTrainException;

/**
 *
 * @author mekigelashvili
 */
public class Car {

    public Train train;
    public int number;

    public Car() {
        this.train = null;
        this.number = 0;
    }

    public void getOn(Rider rider) throws CarDoesntBelongToTrainException, CarFullException, RiderAlreadyOnCarException {
        if (this.train == null) {
            throw new CarDoesntBelongToTrainException();
        }
        if (this.number == 135) {
            throw new CarFullException();
        }
        if (rider.car != null) {
            throw new RiderAlreadyOnCarException();
        }
        this.number = this.number + 1;
        rider.car = this;
    }

    public void getOff(Rider rider) throws RiderNotOnCarException {
        if (rider.car != this) {
            throw new RiderNotOnCarException();
        }
        number = number - 1;
        rider.car = null;
    }
}
