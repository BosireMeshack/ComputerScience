package OOPITS;

public class Tea {

    protected int teaID; //protected: it can be used in this class and any class inherit this class
    public String teaType; //public: can be used anywhere
    public String teaName;
    public double teaPrice;
    private double salePrice = teaPrice * .7; //private: only be used in this class

    Tea(int teaID, String teaType, String teaName, double teaPrice) {
        this.teaID = teaID;
        this.teaType = teaType;
        this.teaName = teaName;
        this.teaPrice = teaPrice;
        this.salePrice = teaPrice * .7;
    }

    Tea() {

    }

    public static void main(String[] args) {
        Tea t1 = new Tea(1,"Herbal","Mint Green",9.99);
        System.out.println(t1.teaName + t1.teaPrice);
    }

    }


