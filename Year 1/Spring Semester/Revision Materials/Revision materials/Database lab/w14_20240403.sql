List the book_item_ids which were borrowed by a customer.
The list should contain the customer name and the borrowing date.
The list should be sorted by the borrowing date descending;

select book_item_id, cu.first_name||' '||cu.last_name cname, 
to_char(borrowing_date,'yyyy.mm.dd hh24:mi:ss')
from book_library.borrowing bo inner join 
book_library.customers cu 
on bo.customer_id=cu.library_card_number
order by borrowing_date desc;


List all books (id, title) which publisher is 'Pocket Books' and 
the names and ids of their authors if they exists
List should be sorted by book_id, title, and author name ;

select bo.book_id, title, au.author_id, first_name, last_name, publisher
from book_library.books bo left outer join
book_library.writing w on bo.book_id=w.book_id
left outer join book_library.authors au
on w.author_id=au.author_id
where publisher='Pocket Books'--publisher like 'Pocket Books%'
--where publisher='Touchstone'
order by bo.book_id, title, first_name, last_name;

How many books belong to each topic? Sort the list by the number of books desc;

select topic, count(*) nu
from book_library.books
group by topic
order by nu desc;

Which publisher has more than 2 books? Sort the the list by publisher name;
select publisher, count(book_id)
from book_library.books
group by publisher
having count(book_id)>2
order by publisher;

Which author (name) wrote more than 2 books? Sort the list by number of the books;

select au.author_id, first_name, last_name, count(w.book_id) nu
from book_library.authors au left outer join 
book_library.writing w on au.author_id=w.author_id
group by au.author_id, first_name, last_name
having count(w.book_id)>2
order by nu;

Which author (name) wrote less than 2 books? Sort the list by number of the books;

select au.author_id, first_name, last_name, count(w.book_id) nu
from book_library.authors au left outer join 
book_library.writing w on au.author_id=w.author_id
group by au.author_id, first_name, last_name
having count(w.book_id)<2
order by nu;

How many book_items belong to each book (title)? The list should be sorted by title desc;

select bo.book_id, title, count(bi.book_item_id)
from book_library.books bo left outer join
book_library.book_items bi on bo.book_id=bi.book_id
group by bo.book_id, title
order by title;

List the authors who did not write any books. The list should be sorted by name;

select *
from book_library.authors
where author_id not in (select author_id from book_library.writing)
order by first_name, last_name;

List the books which number_of_pages are more than 
the 80% of the average of the number_of_pages of all books. 
The list should be sorted by number_of_pages;

select *
from book_library.books
where number_of_pages>(select 0.8*avg(number_of_pages)
                        from book_library.books)
order by number_of_pages;

List the name of the authors whose name contains punctually two 'e' (lower of uppercase).
The list should be sorted by name;

select first_name, last_name
from book_library.authors
where lower(first_name||' '||last_name) like '%e%e%'
and lower(first_name||' '||last_name) not like '%e%e%e%'
order by first_name, last_name;

List the books which were published in the last 10 years. Sort the list by publishing date desc;
select book_id, title, to_char(publishing_date,'yyyy.mm.dd hh24:mi:ss')
from book_library.books
where months_between(sysdate, publishing_date)/12<10
order by publishing_date desc;

List the books which price is not given or which topic is not 'Science', 'Thriller' and 'History'
or the number_of_pages between 100 and 1000. List should be sorted by publisher, title;

select book_id, publisher, price, topic, number_of_pages, title
from book_library.books
where price is null or topic not in ('Science', 'Thriller','History')
or number_of_pages between 100 and 1000
order by publisher, title;

List the days of the week on which more than 3 books were published. The list should be 
sorted by the days of the week;

select to_char(publishing_date,'day'), count(*), to_char(publishing_date,'d')
from book_library.books
group by to_char(publishing_date,'day'), to_char(publishing_date,'d')
having count(*)>3
order by to_char(publishing_date,'d');




