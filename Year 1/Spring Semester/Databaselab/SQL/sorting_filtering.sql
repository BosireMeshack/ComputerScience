--SORTING
-- sorting key words are order by

SELECT first_name || ' ' || last_name "patrons' full names", birth_date, 
round(months_between(sysdate, birth_date)/12) age, enrollment_date FROM BOOK_LIBRARY.customers
ORDER BY age;


/* List the patrons’ full names, dates of birth, ages (measured in years, rounded), and
enrollment dates, sorted descending by rounded age.*/

SELECT first_name || ' ' || last_name "patrons' full names", birth_date, 
round(months_between(sysdate, birth_date)/12) age, enrollment_date FROM BOOK_LIBRARY.customers
ORDER BY age DESC;

/* List the patrons’ full names, dates of birth, ages (measured in years, rounded), and
enrollment dates, sorted ascending by the patrons’ gender and then descending by their
first names.  */


SELECT first_name || ' ' || last_name "patrons' full names", birth_date, 
round(months_between(sysdate, birth_date)/12) age, enrollment_date, gender FROM BOOK_LIBRARY.customers
ORDER BY gender, first_name DESC;

/* List the patrons’ full names, dates of birth, ages (measured in years, rounded), and
enrollment dates, sorted ascending by the second letter of the names and then descending
by the first names. */

SELECT
 first_name || ' ' || last_name "patron's name",
 birth_date,
 round(months_between(sysdate, birth_date) / 12) age,
 enrollment_date
 FROM BOOK_LIBRARY.customers
 ORDER BY substr("patron's name", 2, 1), first_name DESC; --substr complex expression
 
 
 /* List the patrons’ full names, dates of birth, ages (measured in years, rounded), and
enrollment dates, sorted ascending by the rounded ages and then descending by the full
names.*/
 
SELECT first_name || ' ' || last_name "patrons' full names",
birth_date,
round(months_between(sysdate, birth_date)/12) age,
enrollment_date
FROM book_library.customers
ORDER BY age, "patrons' full names" DESC;

/* List the patrons’ full names, dates of birth, ages (measured in years, rounded), and
enrollment dates, sorted descending by the rounded ages and then ascending by the month
of enrollment dates. */


SELECT first_name || ' ' || last_name "patrons' full names",
birth_date,
round(months_between(sysdate, birth_date)/12) age,
enrollment_date
FROM book_library.customers
ORDER BY age DESC, extract(month from enrollment_date);

/* List the titles and topics of the books, sorted descending by topic and then ascending by
title (null values come first) */ 

SELECT title,
topic
FROM book_library.books
ORDER BY topic DESC, title;

/* Nulls go last */

SELECT title, topic
FROM book_library.books 
ORDER BY topic DESC NULLS LAST, title;



-- FILTERING
/* List the full name and rounded age (in years) of patrons whose last name begins with the
letter “T”, in descending order of the rounded age. */

SELECT 
    first_name || ' ' || last_name "patron's name", 
    round(months_between(sysdate, birth_date)/12) age 
    
    FROM book_library.customers
    WHERE substr(last_name, 1,1) = 'T'
    ORDER BY age DESC;
    
/* Using Like */

SELECT 
    first_name || ' ' || last_name "patron's name", 
    round(months_between(sysdate, birth_date)/12) age 
    
    FROM book_library.customers
    WHERE last_name LIKE 'T%'
    ORDER BY age DESC;
    
    /* */
    
SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE first_name || ' ' || last_name LIKE '_____s%'
 ORDER BY age DESC;

/* List the full name and rounded age (in years) of patrons whose full name has a lowercase
or uppercase “s” at the 6th position. Sort the result in descending order of the rounded
age. */

SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE first_name || ' ' || last_name LIKE '_____s%'
 OR first_name || ' ' || last_name LIKE '_____S%'
 ORDER BY age DESC;
 
 
 /*List the full name and rounded age (in years) of patrons whose full name starts or ends
with a lowercase or uppercase “s”. Sort the result in descending order of the rounded age. */

SELECT
 first_name || ' ' || last_name "patron's name",
 round(months_between(sysdate, birth_date) / 12) age
 FROM BOOK_LIBRARY.customers
 WHERE lower(first_name || ' ' || last_name) LIKE 's%'
 OR lower(first_name || ' ' || last_name) LIKE '%s'
 ORDER BY age DESC;
 

/*List the full name and rounded age (in years) of patrons whose full name contains no
lowercase or uppercase letter “s”. Sort the result in descending order of the rounded age. */

SELECT 

first_name || ' '|| last_name "patron's name", 
round(months_between(sysdate, birth_date)/12)  age
FROM BOOK_LIBRARY.customers 
WHERE lower(first_name || ' '|| last_name) NOT LIKE '%s%'
ORDER BY age DESC;


/* List the full name and rounded age (in years) of patrons whose full name contains exactly
two lowercase or uppercase letters “s”. Sort the result in descending order of the rounded
age. */

SELECT 

first_name || ' '|| last_name "patron's name", 
round(months_between(sysdate, birth_date)/12)  age
FROM BOOK_LIBRARY.customers 
WHERE regexp_count(lower(first_name || ' '|| last_name), 's') = 2
ORDER BY age DESC;

/* List topic names of exactly 7 characters */

SELECT topic FROM book_library.books

WHERE topic LIKE '_______';

--OR

SELECT DISTINCT topic FROM book_library.books

WHERE length(topic) = 7;

/* List topic names and page numbers rounded to hundreds, sorted */

SELECT DISTINCT topic, round(number_of_pages, 3) FROM
book_library.books 
WHERE topic  IS NOT NULL
ORDER BY topic DESC;

/*List the title and topic of books whose topic is either Science Fiction or Thriller. */

SELECT title , topic from book_library.books
WHERE topic = 'Science Fiction' OR topic = 'Thriller';

--OR
SELECT title, topic from book_library.books
WHERE topic IN ('Science Fiction', 'Thriller');


/*List the title and topic of books whose topic is neither Science Fiction nor Thriller. */


SELECT title, topic from book_library.books
WHERE topic NOT IN ('Science Fiction', 'Thriller');

/* List the title and topic of books with a known topic */

SELECT title, topic from book_library.books
WHERE NOT topic IS NULL;


select title, topic, number_of_pages, price, publishing_date
 FROM BOOK_LIBRARY.books
 WHERE publishing_date >= to_date('1990.01.01', 'yyyy.mm.dd')
 AND publishing_date <= to_date('2000.12.31', 'yyyy.mm.dd');
 
 
 SELECT title, topic, number_of_pages, price, publishing_date
 FROM BOOK_LIBRARY.books
 WHERE publishing_date >= DATE'1990-01-01'
 AND publishing_date < DATE'2001-01-01'
 OR price >= 1000 AND price <= 3000
 OR topic = 'Science Fiction' AND number_of_pages < 20
 ORDER BY topic DESC NULLS LAST, number_of_pages;
 
 SELECT title, topic, number_of_pages, price, publishing_date FROM book_library.books
 WHERE extract(year from publishing_date) BETWEEN 1990 AND 2000 
 OR price BETWEEN 1000 AND 3000
 OR topic = 'Science Fiction' AND number_of_pages <20
 ORDER BY topic DESC NULLS LAST, number_of_pages;
 
 /* title and price of books whose price is not between 1000 and 3000 */ 
 
 SELECT title, price FROM book_library.books
 WHERE price NOT BETWEEN 1000 AND 3000
 ORDER BY price;
 
 
 --substr
 
 SELECT first_name || ' ' || last_name "patron's name",
 substr(first_name || ' ' || last_name, 4, 3)
 FROM BOOK_LIBRARY.customers;
SELECT first_name || ' ' || last_name "patron's name",
 substr(first_name || ' ' || last_name, -4, 3)
 FROM BOOK_LIBRARY.customers;
SELECT first_name || ' ' || last_name "patron's name",
 substr(first_name || ' ' || last_name, 4)
 FROM BOOK_LIBRARY.customers;
SELECT first_name || ' ' || last_name "patron's name",
 substr(first_name || ' ' || last_name, -4)
 FROM BOOK_LIBRARY.customers;
 
 
 