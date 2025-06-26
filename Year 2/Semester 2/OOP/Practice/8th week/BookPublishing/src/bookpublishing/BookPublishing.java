/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package bookpublishing;

import java.util.List;

/**
 *
 * @author famil
 */
public class BookPublishing {
    public static void main(String[] args) {
        // Create some Person objects
        Person author1Person = new Person("Author One", "123-45-6789", "TAX123");
        Person author2Person = new Person("Author Two", "987-65-4321", "TAX456");
        Person employeePerson = new Person("Employee One", "111-22-3333", "TAX789");

        // Create Authors
        Author author1 = new Author(author1Person);
        Author author2 = new Author(author2Person);

        // Create an Employee
        Employee employee = new Employee(employeePerson);

        // Create a Publisher
        Publisher publisher = new Publisher();

        // Create Books and associate with Authors and Publisher
        Book book1 = new Book(publisher, List.of(author1));
        Book book2 = new Book(publisher, List.of(author1, author2));
        Book book3 = new Book(publisher, List.of(author2));

        // Display number of books written by Author1
        System.out.println("Number of books written by Author One: " + author1.numOfBooks());

        // Display number of books written by Author1 for the publisher
        System.out.println("Number of books written by Author One for the publisher: " + author1.numOfBooks(publisher));

        // Display most frequently employed author by the publisher
        System.out.println("Most frequently employed author by the publisher: " + publisher.mostEmployed());
    }
}