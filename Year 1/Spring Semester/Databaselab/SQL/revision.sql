ALTER SESSION SET CURRENT_SCHEMA = BOOK_LIBRARY;

SELECT title FROM books;

SELECT isbn, price, title FROM books;

SELECT
 isbn, -- the ISBN number of the book
 price, -- the original price of the book
 title -- the title of the book
 FROM /* here we start a multiline comment,
 although it makes the code
unreadable */ books;

SELECT * FROM book_library.books;

SELECT sysdate FROM BOOK_LIBRARY.books;

SELECT sysdate FROM dual;

SELECT * FROM dual;


SELECT sysdate + 1, (2 + 5) * 3, 'apple' FROM dual;


SELECT to_char(sysdate, 'YYYY.MM.DD.') FROM dual;

SELECT to_char(sysdate, 'DS TS') FROM dual;

SELECT to_char(sysdate, 'MM') FROM dual;


// Round and Truncate

SELECT to_char(round(sysdate), 'DS TS') FROM dual; -- 1st hour of the following day 
SELECT to_char(trunc(sysdate), 'DS TS') from dual; -- 1st hour of the current date 

SELECT to_char(round(sysdate, 'MM'), 'DS TS') FROM dual; -- rounds up/down the date to the first date of the following month
SELECT to_char(trunc(sysdate, 'MM'), 'DS TS') FROM dual; -- rounds down the date to the first date of the current month
SELECT to_char(round(sysdate, 'YYYY'), 'DS TS') FROM dual; -- rounds down the date to the first date of the current year
SELECT to_char(trunc(sysdate, 'YYYY'), 'DS TS') FROM dual; -- rounds up the date


SELECT to_char(round(date'2024-04-15', 'MM'), 'DS TS') FROM dual;
SELECT to_char(trunc(date'2024-02-20', 'MM'), 'DS TS') FROM dual;

SELECT to_char(sysdate + 3.5, 'DS TS') FROM dual; -- Added 3.5 days
SELECT to_char(sysdate - 3, 'DS TS') FROM dual;  --Subtracts 3 days

SELECT to_char(round(sysdate - 15, 'MM'), 'DS TS') FROM dual; --rouds down


SELECT to_char(sysdate - 1 / 24, 'DS TS') FROM dual; --outputs 1 hour behind

// add_months

SELECT to_char(add_months(date'2024-01-31', -1), 'DS TS') FROM dual;

// to_date -- specifies the date more precisely
SELECT to_char(to_date('2023.12.31', 'YYYY.MM.DD'), 'DS TS') FROM dual; //specific set date
SELECT to_char(to_date('2022', 'YYYY'), 'DS TS') FROM dual; // First date of the year
SELECT to_char(to_date('05', 'MM'), 'DS TS') FROM dual; // First date of that month


// months_between
SELECT months_between(sysdate, date'2002-08-27') FROM dual;
SELECT months_between(sysdate, date'2002-08-27') / 12 FROM dual;
// extract

// extract using to_char function
// year
SELECT to_char(sysdate, 'YYYY') FROM dual;
// month
SELECT to_char(sysdate, 'MM') FROM dual;

//minutes
SELECT to_char(sysdate, 'MI') FROM dual;

// extract function
SELECT extract(year from sysdate) FROM dual;
SELECT extract(month from sysdate) FROM dual;

SELECT to_char(sysdate, 'MM') * 10 FROM dual;

SELECT extract(month from sysdate)*10 FROM dual;


// Numerical Operations
SELECT round(83652.6322), round(-83652.6322),
 trunc(83652.6322), trunc(-83652.6322),
 floor(83652.6322), floor(-83652.6322),
 ceil (83652.6322), ceil (-83652.6322)
 FROM dual;
 
 
 SELECT round(83652.6322, 2),
 round(83652.6322, 1),
 round(83652.6322, 0),
 round(83652.6322, -1),
 round(83652.6322, -2),
 round(83652.6322, -3),
 trunc(83652.6322, -3)
 FROM dual;
 
 
 
 // string operations
 
 // first name and last name of the patron
 SELECT first_name, last_name FROM BOOK_LIBRARY.customers;
 
 // string concatenation
 SELECT first_name || ' ' || last_name FROM BOOK_LIBRARY.customers;
 
 SELECT first_name || ' ' || last_name patron_name FROM book_library.customers;


// Identifiers need double quotes
SELECT first_name || ' ' || last_name "patron's name"
 FROM BOOK_LIBRARY.customers;
 
 
 
--length of strings
SELECT first_name || ' ' || last_name "patron's name",
 length(first_name || ' ' || last_name) "length of name"
 FROM BOOK_LIBRARY.customers;