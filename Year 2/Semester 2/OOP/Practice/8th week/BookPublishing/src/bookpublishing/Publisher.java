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
public class Publisher {
    private List<Book> publications;

    public Publisher() {
        this.publications = new ArrayList<>();
    }  
    
    public Publisher(List<Book> publications) {
        this();
        this.publications.addAll(publications);
    }
    
    public void addBook(Book book) {
        this.publications.add(book);
    }
    
    public void removeBook(Book book) {
        this.publications.remove(book);
    }

    public String mostEmployed() {
        int max = 0;
        Author maxAuthor = null;
        for (Book book : publications) {
            for (Author author : book.getAuthors()) {
                int count = author.numOfBooks(this);
                if (count > max) {
                    max = count;
                    maxAuthor = author;
                }
            }
        }
        return maxAuthor != null ? maxAuthor.getName() : "";
    }
}
