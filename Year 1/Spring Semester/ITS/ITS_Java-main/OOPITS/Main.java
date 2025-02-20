package OOPITS;
public class Main {
    public static void main(String[] args) {
        Product prod1 = new Product(1, "Tea", "Green Tea", 8.99);
        System.out.println(prod1.productName);

        Product prod2 = new Product(2, "Coffee", "House Blend");
        System.out.println(prod2.productName + prod2.price);

        Product prod3 = new Product();
        System.out.println(prod3.productName);

        GourmetCoffee gc1 = new GourmetCoffee(4, "Coffee", "Chocolate Donut",9.99, "Chocolate");
        System.out.println(gc1.flavor);
    }
}

class Product { //class starts with capital letter
    int productId;
    String type;
    String productName;
    double price;

    //Constructor, this is a method(with the same name as the class) to create an object
    Product(int productIdValue, String typeValue, String productNameValue, double priceValue) {
        productId = productIdValue;
        type = typeValue;
        productName = productNameValue;
        price = priceValue;
    }

    Product(int productIdValue, String typeValue, String productNameValue) {
        productId = productIdValue;
        type = typeValue;
        productName = productNameValue;
        price = 9.99;
    }

    Product(){
        this(3,"Coffee","Decaf",9.99); //make this object have these 4 values
    }

}

class GourmetCoffee extends Product { //inherits all the properties of the Product class
    String flavor;

    //Constructor
    GourmetCoffee(int productIdValue, String typeValue, String productNameValue, double priceValue, String flavorValue) {
        productId = productIdValue;
        type = typeValue;
        productName = productNameValue;
        price = priceValue;
        flavor = flavorValue;
    }
}
