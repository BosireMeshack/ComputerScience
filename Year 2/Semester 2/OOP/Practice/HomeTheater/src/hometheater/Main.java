/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hometheater;

import hometheater.exceptions.WrongNumberOfSpeakersException;
import hometheater.exceptions.NoAmpException;
import hometheater.exceptions.NoTVException;

/**
 *
 * @author mekigelashvili
 */
public class Main {
    public static void main(String[] args) {
        try {
            // Create a HomeTheater system
            HomeTheater homeTheater = new HomeTheater();
            
            // Connect a new TV
            TV newTv = new TV();
            homeTheater.connectTv(newTv);
            
            // Connect a new Xbox
            Xbox newXbox = new Xbox();
            homeTheater.connectXbox(newXbox);
            
            // Add a new Speaker
            Speaker newSpeaker = new Speaker();
            homeTheater.connectSpeaker(newSpeaker);
            
            homeTheater.useXbox();
        } catch (WrongNumberOfSpeakersException ex) {
            System.out.println("The amp would be connected to too few or too many speakers!");
        } catch (NoTVException ex) {
            System.out.println("No TV is connected!");
        } catch (NoAmpException ex) {
            System.out.println("No amp is connected!");
        }        
    }
}
