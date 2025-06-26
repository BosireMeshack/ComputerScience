/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookpublishing;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author famil
 */
public class Author extends Occupation {
    private final List<Book> books;

    public Author(Person person) {
        super(person);
        this.books = new ArrayList<>();
    }    
    
    public Author(Person person, List<Book> books) {
        this(person);
        this.books.addAll(books);
    }
    
    public void addBook(Book book) {
        this.books.add(book);
    }
    
    public void removeBook(Book book) {
        this.books.remove(book);
    }

    public int numOfBooks() {
        return books.size();
    }

    public int numOfBooks(Publisher publisher) {
        int count = 0;
        for (Book book : books) {
            if (book.getPublisher() == publisher) {
                count++;
            }
        }
        return count;
    }

    public String getName() {
        return super.getPerson().getName();
    }
}