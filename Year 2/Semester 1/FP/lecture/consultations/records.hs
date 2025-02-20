-- Define the data types Person and Book
-- Person has a name and an age
-- Book has a title, an author (Person), a year, and a category

data Person = Person {
    name :: String,
    age :: Int
} deriving (Show)

data Book = Book {
    title :: String,
    author :: Person,
    year :: Int,
    category :: String
} deriving (Show)

-- data Person = 
-- data Book = 

-- Part 1: Create Instances
-- authors
georgeOrwell :: Person
georgeOrwell = Person { name = "George Orwell", age = 46 }

jrrTolkien :: Person
jrrTolkien = Person { name = "J.R.R. Tolkien", age = 81 }

janeAusten :: Person
janeAusten = Person { name = "Jane Austen", age = 41 }

markTwain :: Person
markTwain = Person { name = "Mark Twain", age = 74 }

maryShelley :: Person
maryShelley = Person { name = "Mary Shelley", age = 53 }

-- books
book1984 :: Book
book1984 = Book { title = "1984", author = georgeOrwell, year = 1949, category = "Dystopian" }

bookAnimalFarm :: Book
bookAnimalFarm = Book { title = "Animal Farm", author = georgeOrwell, year = 1945, category = "Satire" }

bookHobbit :: Book
bookHobbit = Book { title = "The Hobbit", author = jrrTolkien, year = 1937, category = "Fantasy" }

bookLOTR :: Book
bookLOTR = Book { title = "The Lord of the Rings", author = jrrTolkien, year = 1954, category = "Fantasy" }

bookPride :: Book
bookPride = Book { title = "Pride and Prejudice", author = janeAusten, year = 1813, category = "Romance" }

bookHuckFinn :: Book
bookHuckFinn = Book { title = "Adventures of Huckleberry Finn", author = markTwain, year = 1884, category = "Adventure" }

bookFrankenstein :: Book
bookFrankenstein = Book { title = "Frankenstein", author = maryShelley, year = 1818, category = "Horror" }

-- list of books
books :: [Book]
books = [book1984, bookAnimalFarm, bookHobbit, bookLOTR, bookPride, bookHuckFinn, bookFrankenstein]

-- list of people
authorList :: [Person]
authorList = [georgeOrwell, jrrTolkien, janeAusten, markTwain, maryShelley]

-- Part 2: Write Functions

-- 1. Get the author's name
getAuthorName :: Book -> String
getAuthorName book = name (author book)

-- main = print $ getAuthorName book1984 --   "George Orwell"

-- 2. Check if the author is above a certain age
isAuthorAboveAge :: Book -> Int -> Bool
isAuthorAboveAge book years = age (author book) > years

-- main = print $ isAuthorAboveAge bookHobbit 50 --   True

-- -- 3. Filter books by category
booksByCategory :: [Book] -> String -> [String]
booksByCategory books catName = [ title book | book <- books, catName == category book]
-- booksByCategory books catName = filter (\book -> (category book) == catName) books

-- main = print $ booksByCategory books "Fantasy"
-- -- Output: ["The Hobbit","The Lord of the Rings"]

-- -- 4. If the category is "Fantasy" then change it to "Imaginary"
changeCategory :: Book -> Book
changeCategory book 
    | category book == "Fantasy" = book {category = "Imaginary"} 
    | otherwise = book

-- main = print $ changeCategory bookHobbit
-- -- Output: Book {title = "The Hobbit", author = Person {name = "J.R.R. Tolkien", age = 81}, year = 1937, category = "Imaginary"}

-- -- 5. Get the average age of the authors
averageAuthorAge :: [Person] -> Double
averageAuthorAge people =  sum [fromIntegral (age person) | person <- people] / fromIntegral (length people)

-- main = print $ averageAuthorAge authorList
-- -- Output: 59.0

-- -- 6. Get the average year of the books
averageBookYear :: [Book] -> Double
averageBookYear books = sum [ fromIntegral (year book) | book <- books] / fromIntegral (length books)

-- main = print $ averageBookYear books
-- Output: 1900.0


-- 7. Get the all the authors who have written a book in a given category
authorsByCategory:: [Book]-> String -> [String]
authorsByCategory books catName= [name (author book) | book <- books, category book == catName ]

-- main = print $ authorsByCategory books "Fantasy"
-- Output: ["J.R.R. Tolkien","J.R.R. Tolkien"]