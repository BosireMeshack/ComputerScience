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
public class Book {

    private Publisher publisher;
    private List<Author> authors;

    public Book(Publisher publisher, List<Author> authors) {
        this.publisher = publisher;
        this.publisher.addBook(this);
        this.authors = new ArrayList<>();
        this.authors.addAll(authors);
        for (var author : authors) {
            author.addBook(this);
        }
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public List<Author> getAuthors() {
        return authors;
    }
}
