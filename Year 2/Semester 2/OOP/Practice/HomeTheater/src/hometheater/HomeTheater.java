/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hometheater;

import hometheater.exceptions.WrongNumberOfSpeakersException;
import hometheater.exceptions.NoAmpException;
import hometheater.exceptions.NoTVException;
import java.util.ArrayList;

/**
 *
 * @author mekigelashvili
 */
public class HomeTheater {

    private ArrayList<Speaker> speakers = new ArrayList<>();
    private Amp amp = new Amp();
    private TV tv = new TV();
    private Xbox xbox = new Xbox();

    public HomeTheater() throws WrongNumberOfSpeakersException {
        for (int i = 0; i < 5; i++) {
            Speaker sp = new Speaker();
            this.speakers.add(sp);
            amp.connectSpeaker(sp);
        }
        xbox.connectAmp(amp);
        xbox.connectTV(tv);
    }

    public void connectTv(TV tv) {
        this.tv = tv;
        xbox.connectTV(tv);
    }

    public void connectXbox(Xbox xbox) {
        this.xbox = xbox;
        xbox.connectAmp(amp);
        xbox.connectTV(tv);
    }

    public void connectAmp(Amp amp) {
        this.amp = amp;
        xbox.connectAmp(amp);
    }

    public void connectSpeaker(Speaker speaker) throws WrongNumberOfSpeakersException {
        if (this.speakers.size() >= 6) {
            throw new WrongNumberOfSpeakersException();
        }
        this.speakers.add(speaker);
        amp.connectSpeaker(speaker);
    }
    
    public void useXbox() throws NoTVException, NoAmpException {
        xbox.sendPicture();
        xbox.sendAudio();
    }

}
