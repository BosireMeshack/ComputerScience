
-- list of books that meet the condition below 

SELECT bi.*, title, publisher, price
FROM BOOK_LIBRARY.books b JOIN BOOK_LIBRARY.book_items bi
        ON b.book_id = bi.book_id
    WHERE title LIKE 'D%';
    
-- books that don't have matches in the book_items table

SELECT title, publisher, price
    FROM BOOK_LIBRARY.books
    WHERE book_id NOT IN
        (SELECT book_id
            FROM BOOK_LIBRARY.book_items);
            
            
-- are there books in the book_items table that are not in the books table/

SELECT *
    FROM BOOK_LIBRARY.book_items
    WHERE book_id NOT IN
        (SELECT book_id
            FROM BOOK_LIBRARY.books);
            
            
--outer join lists the unmatched rows of the joined tables
SELECT bi.*, title, publisher, price
FROM BOOK_LIBRARY.books b, BOOK_LIBRARY.book_items bi WHERE b.book_id = bi.book_id (+)
        AND title LIKE 'D%';
        
        
-- similar code using the left outer join key word

SELECT bi.*, title, publisher, price 
    FROM BOOK_LIBRARY.books b 
        LEFT OUTER JOIN BOOK_LIBRARY.book_items bi 
            ON b.book_id = bi.book_id
                WHERE title LIKE 'D%';
                
 SELECT book_item_id, book_id, theoretical_value, title, publisher, price FROM BOOK_LIBRARY.books LEFT JOIN BOOK_LIBRARY.book_items
        USING (book_id)
    WHERE title LIKE 'D%';               
    
SELECT *
    FROM BOOK_LIBRARY.customers c 
     LEFT JOIN BOOK_LIBRARY.borrowing bo
      ON c.library_card_number = bo.customer_id
      WHERE category = 'pensioner'; 
      
SELECT first_name, last_name, count(w.author_id) "no of books"
    FROM book_library.authors a LEFT JOIN book_library.writing w
        ON a.author_id = w.author_id
        WHERE sysdate - birth_date > 
        (SELECT AVG(sysdate - birth_date) FROM book_library.authors)
    GROUP BY w.author_id, first_name, last_name;
    
    
SELECT nvl(bi.book_item_id, 'no copies'), nvl(bi.theoretical_value, 0), b.title 
    FROM book_library.books b LEFT JOIN book_library.book_items bi
        ON b.book_id  = bi.book_id
            WHERE b.topic = 'Thriller';
        



                

