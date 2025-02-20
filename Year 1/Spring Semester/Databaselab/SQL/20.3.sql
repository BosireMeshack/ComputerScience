SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE lower(first_name || ' ' || last_name) LIKE 's%'
 AND lower(first_name || ' ' || last_name) LIKE '%s'
 ORDER BY age DESC;
 
 SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE lower(first_name || ' ' || last_name) LIKE 's%s'
 ORDER BY age DESC;
 
 SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE  upper(first_name || ' ' || last_name) NOT LIKE '%s%'
 ORDER BY age DESC;
 
 SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE lower(first_name || ' ' || last_name) LIKE '%s%s%'
 ORDER BY age DESC;
 
 SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE lower(first_name || ' ' || last_name) LIKE '%s%s%'
 AND lower(first_name || ' ' || last_name) NOT LIKE '%s%s%s%'
 ORDER BY age DESC;
 
 
 SELECT topic
 FROM BOOK_LIBRARY.books
 WHERE topic LIKE '_______';
 
 //Distinct
 
 SELECT DISTINCT topic
 FROM BOOK_LIBRARY.books
 WHERE length(topic) = 7;
 
 
 SELECT DISTINCT topic
 FROM BOOK_LIBRARY.books
 WHERE length(topic) = 7;
 
 SELECT UNIQUE topic
 FROM BOOK_LIBRARY.books
 WHERE length(topic) = 7;
 
 SELECT DISTINCT topic, round(number_of_pages, -2)
 FROM BOOK_LIBRARY.books
 ORDER BY 1, 2;
 
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE topic = 'Science Fiction' AND topic = 'Thriller';
 
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE topic = 'Science Fiction' OR topic = 'Thriller';
 
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE topic IN ('Science Fiction', 'Thriller');
 
//FILTER BY NOT IN
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE NOT (topic = 'Science Fiction' OR topic = 'Thriller');
 
 
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE topic <> 'Science Fiction' AND topic <> 'Thriller';
 
 
 SELECT title, topic
 FROM BOOK_LIBRARY.books
 WHERE NOT topic IN ('Science Fiction', 'Thriller');
 
 //NULL Values
 
 SELECT * FROM Book_library.books WHERE topic IS NULL
  ;
  
  SELECT title, topic, number_of_pages, price, publishing_date
 FROM BOOK_LIBRARY.books
 WHERE publishing_date >= to_date('1990.01.01', 'yyyy.mm.dd') -- wrong!
 AND publishing_date <= to_date('2001.12.31', 'yyyy.mm.dd')
 OR price >= 1000 AND price <= 3000
 OR topic = 'Science Fiction' AND number_of_pages < 20
 ORDER BY topic DESC, number_of_pages;
 
 
 