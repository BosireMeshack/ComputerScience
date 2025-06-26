/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hometheater;

import hometheater.exceptions.WrongNumberOfSpeakersException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mekigelashvili
 */
public class Amp {
    
    private List<Speaker> speakers;

    public Amp() {
        speakers = new ArrayList<>();
    }
    
    public void connectSpeaker(Speaker sp) throws WrongNumberOfSpeakersException {
        if (speakers.size() >= 6) {
            throw new WrongNumberOfSpeakersException();
        }
        speakers.add(sp);
    }
    
    public boolean disconnectSpeaker(Speaker sp) throws WrongNumberOfSpeakersException {
        if (speakers.size() <= 2) {
            throw new WrongNumberOfSpeakersException();
        }
        return speakers.remove(sp);
    }
    
    public void receiveSound(){
        System.out.println("Sound has been received by amp");
        sendSoundToSpeaker();
    }
    public void sendSoundToSpeaker(){
        for(Speaker sp  : speakers){
            sp.receiveSound();
        }
    }
}
