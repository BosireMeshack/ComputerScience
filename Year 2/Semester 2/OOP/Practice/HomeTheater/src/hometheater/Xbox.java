/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hometheater;

import hometheater.exceptions.NoAmpException;
import hometheater.exceptions.NoTVException;

/**
 *
 * @author mekigelashvili
 */
public class Xbox {

    // this is necessary for the association
    private Amp amp;
    private TV tv;
    
    // this is necessary for the association
    public void connectAmp(Amp amp) {
        this.amp = amp;
    }
    
    public void connectTV(TV tv) {
        this.tv = tv;
    }
    
    // this is not necessary for the association,
    // the field and the connect method are enough (and necessary)
    public void sendPicture() throws NoTVException {
        System.out.println("Picture is being sent to the tv");
        if (tv == null) {
            throw new NoTVException();
        }
        tv.receivePicture();
    }

    public void sendAudio() throws NoAmpException {
        System.out.println("Sound is being sent to the amp");
        if (amp == null) {
            throw new NoAmpException();
        }
        amp.receiveSound();
    }
}
