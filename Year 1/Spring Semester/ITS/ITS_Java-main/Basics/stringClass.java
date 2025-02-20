package Basics;

public class stringClass {
    public static void main(String[] args) {
     
     // Create String objects   
     String str = "Lorem ipsum dolor sit amet, consectetur";
     String str2 = new String("Lorem ipsum dolor sit amet");

     // Concatenate strings
     str2 = str + " " + str2;
     str2 = str2.concat("Hello World'"); 
     
     //Accessing Characters
     char ch = str.charAt(3); //Retrieves the character at the specified index.
     int length = str.length(); // Returns the length of the string.
     System.out.println(ch);
     System.out.println(length);

     // Comparing Strings
     boolean equals = str.equals(str2);
     int compareTo = str.compareTo(str2);
     
     // Searching in Strings
     int index = str.indexOf("World");
     boolean contains = str.contains("Java");

     // Replacing strings
     String uppercase = str.toUpperCase();
     String lowercase = str.toLowerCase();
     String replaced = str.replace("Hello", "Hi");
     // Trim a string
     String trimmed = str.trim();
     // Formatting
     String formatted = String.format("%s: %d", "Age", 25);

    }
}
