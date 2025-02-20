-- 1. Write lastDigit function which returns the last digit of the number if its positive 
-- and -1 if the number is negative

lastDigit :: Int -> Int
lastDigit n
    | n < 0 = -1
    | otherwise = n `mod` 10


-- main = print(lastDigit 5856) -- 6  
-- lastDigit 689255 -- 5
-- main = print(lastDigit 0) -- 0
-- main = print(lastDigit 8) -- 8
-- main = print(lastDigit (-8642)) -- -1

-- 2. Given a year, determine if the year is a leap year or not
-- A year is a leap year if it is divisible by 4 but not divisible by 100.
-- But a year can be a leap year if it is divisible by 400 (eventhough it is divisible by 100).

isLeapYear :: Int -> Bool
isLeapYear n 
    | (n `rem` 4 == 0) && (n `rem` 100 /= 0) || (n `rem` 400 == 0)  = True
    | otherwise = False
    



-- main = print(isLeapYear 1900) -- False
-- main = print(isLeapYear 1997) -- False
-- main = print(isLeapYear 1996) -- True
-- main = print(isLeapYear 2000) -- True

-- 3. Given a decimal number turn it into an octal number.
-- Octal number has eight as a base instead of 10 in decimal numbers.

toOctal :: Int -> Int
toOctal 0 = 0
toOctal n = toOctal (n `div` 8) * 10 + (n `mod` 8)

-- main = print(toOctal (-10)) -- 3754
-- toOctal 2024 -- 3750
-- toOctal 467383847 -- 3366733047
-- toOctal 0 -- 0
-- toOctal -10 -- "Negative number is not allowed" -- stack overflow



--4
--  Theres a football match in Budapest and you are the software engineer of the stadium.
--  Every ticket has a code and the code is a number.
--  some tickets are VIP tickets and some are normal tickets.
--  Make a program for the volunteers so that they can check if the ticket is VIP or not and assign 
--  seats accordingly.

--  the ticket code is a 6 digit number 
--  if the code is even and the sum of the digits is odd then the ticket is VIP else it is not

--  Make a function that takes a ticket code and returns "VIP" if the ticket is VIP and "Normal" if it is not.
--  example 
--   Input : 123456
--  123456 is even , the sum of the digits is 21 , 21 is odd so the ticket is VIP
--  so output : "VIP"

sumOfDigits:: Int -> Int 
sumOfDigits 0 = 0
sumOfDigits n  = sumOfDigits (n `div` 10) + (n `mod` 10)

-- main = print(sumOfDigits 123) -- 6
-- main = print(sumOfDigits 235) 


ticketType :: Int -> String
ticketType n
    | n `mod` 2 == 0 && (sumOfDigits n `mod` 2 /= 0)  = "VIP"
    | otherwise = "Normal"

-- main = print(ticketType 118822)
-- ticketType 123456 -- "VIP"
-- ticketType 224388 -- "VIP"
-- ticketType 118822 -- "Normal"


-- 5
--  Make a function that takes two numbers and counts the number of even digits in the number formed
--  by the sum of the two numbers
--  example : 
--   Input : 430 561
--   430 + 561 = 991  => 9 is a multiple of 3 , other 9 is also a multiple , 1 is not
--   so output : 2

-- Divisible by 3

db3 :: Int -> Int
db3 0 = 0
db3 n
   |n < 10 && (n `mod` 3 == 0) = 1
   |n < 10 = 0
   |n `mod` 10 == 0 = db3 (n `div` 10)
   |(n `mod` 10) `mod`  3 == 0 = 1 + db3 (n `div` 10)
   |otherwise = db3 (n `div` 10)

-- main = print(db3 992)



multipleOf3 :: Int -> Int -> Int
multipleOf3 a b = db3 (a + b)


-- main = print(multipleOf3 438 561) -- 3
-- multipleOf3 96999 0 -- 5
-- multipleOf3 430 561 -- 2


-- 	6. A positive integer named 'n' is given and if it is even, then divide by 2 (n/2), if it is odd, then 3n+1.
-- 	Repeat this process by recursion until the value reaches to 1.
-- 	Write a function that calculates how many steps went through ODD Number in this process for an integer number given.
-- 	For ex: 
-- 	the given integer is 6: 
-- 		as it is even, divide by 2 -> 
-- 		1. 6/2 = 3 		-> 1
-- 		2. (3*3)+1 = 10 -> 0
-- 		3. 10/2 = 5 	-> 1
-- 		4. (5*3)+1 = 16 -> 0
-- 		5. 16/2 = 8 	-> 0
-- 		6. 8/2 = 4 		-> 0
-- 		7. 4/2 = 2 		-> 0
-- 		8. 2/2 = 1 		-> 0
-- 		total 8 steps, but only 2 steps went through the odd number, so the function should return 2.	

collatzConjunctureOdd :: Int -> Int
collatzConjunctureOdd 1 = 0
collatzConjunctureOdd n 
    | n `mod` 2 == 0 = collatzConjunctureOdd (n `div` 2) + 0
    | otherwise = collatzConjunctureOdd(3*n + 1) + 1

-- main = print(collatzConjunctureOdd 97)
-- collatzConjunctureOdd 6		-- 2
-- collatzConjunctureOdd 27		-- 41
-- collatzConjunctureOdd 9		-- 6
-- collatzConjunctureOdd 97		-- 43


-- 7. Given an integer 'n' and calculate the sum of odd number of fibonacci series from F1..Fn.
-- 	For ex: 10 is given.
-- 	Then, the first 10 fibonacci numbers are  1  1  2  3  5  8  13  21  34  55
-- 	Sum of the odd numbers among them is: 1 + 1 + 3 + 5 + 13 + 21 + 55 = 99
-- 	Note: Fibonacci series here start from 1. (F1 = 1, F2 = 1, F3 = 2)

sumOddFibNumbers :: Int -> Int -> Int -> Int
sumOddFibNumbers a b 0 = 0
sumOddFibNumbers j k l
    | odd j = j + sumOddFibNumbers k (j + k) (l-1)
    | otherwise = sumOddFibNumbers k (j + k) (l-1)




fibonacciOddSeries :: Int -> Int
fibonacciOddSeries n = sumOddFibNumbers 1 1 n
 

-- main = print(fibonacciOddSeries 10)
-- fibonacciOddSeries 10		-- 99
-- fibonacciOddSeries 16		-- 1785
-- fibonacciOddSeries 0			-- 0
-- fibonacciOddSeries 20		-- 14328


-- 8. Given a positive integer and a string value belongsto {"Even","Odd"} and write a function that returns the sum of the odd digits if the given string is "Odd" and
-- 	returns the sum of even digits if the given string is "Even".
-- 	String equality can be checked with == operator. "Even" == "Even" is true and "Odd" == "Odd" is true.
-- 	For ex:
-- 	123046 "Even" -> 2, 4 and 6 are the only Even digits among them, so the result is 12
-- 	123046 "Odd" -> 1 and 3 are the only Odd digits among them, so the result is 4.

sumeven :: Int -> Int
sumeven 0 = 0
sumeven n 
    |even (n `mod` 10) = n `mod` 10 + sumeven (n `div` 10)
    |otherwise  = sumeven (n `div` 10)

sumodd :: Int -> Int
sumodd 0 = 0
sumodd n 
    |odd (n `mod` 10) = n `mod` 10 + sumodd (n `div` 10)
    |otherwise  = sumodd (n `div` 10)

digitSummation :: Int -> String -> Int
digitSummation n x 
    | x == "Even" = sumeven n 
    | otherwise = sumodd n

 
-- main = print (digitSummation 123046 "Odd")		-- 4
-- main = print(digitSummation 123046 "Even")	 
--  digitSummation 745209 "Even"	-- 6
--  digitSummation 745209 "Odd"		-- 21
--  digitSummation 353 "Odd"		-- 11
--  digitSummation 353 "Even"		-- 0