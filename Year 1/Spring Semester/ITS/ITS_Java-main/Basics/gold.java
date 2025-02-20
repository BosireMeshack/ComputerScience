package Basics;

public class gold {
    public static void main(String[] args) {
        int totalQuantity = 58;
        int coupon = 0;

        if(totalQuantity >= 100){
            coupon = 25;
        }
        else if(totalQuantity >= 50){
            coupon = 10;
        }
        else{
            coupon = 3;
        }
        
    }
}
