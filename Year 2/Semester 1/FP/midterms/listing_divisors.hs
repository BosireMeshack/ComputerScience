
-- HOMEWORK 1
-- 1. Find the difference between the product and the sum of two values.

diff :: Int -> Int -> Int
diff x y = x*y-(x+y)

-- main=print(diff 3 5) -- 7

-- 2. Change the sign of a value and compute the cube of it.

cub :: Int -> Int
cub x = (-(x))^3

-- main = print(cub 4) -- -64
-- main= print(cub (-4)) --64

samerem :: Int->Int->Int->Bool
samerem a b c = a `mod` c == b `mod` c

-- main = print(samerem 20 15 10)

check :: Int -> Int -> Bool -> Bool
check a b c = even a && rem b 13 ==0 && c == True

-- main = print(check 4 2 True)

checkSum :: Int -> Int -> Int -> Bool
checkSum a b c = a+b == c|| b+c ==a || b+c == a

-- main = print(checkSum 3 3 5)

power :: Int -> Int
power x = x^5

-- main = print(power 5)

--HOMEWORK 2

-- 1. Write lastDigit function which returns the last digit of the number if its positive 
-- and -1 if the number is negative

lastd :: Int -> Int
lastd x 
    | x > 0 = x `mod` 10
    | x == 0 = 0
    | otherwise = -1 

-- main = print(lastd (-3))
-- main = print(lastd 0)

isLeapYear :: Int -> Bool 
isLeapYear x
    | x `mod` 100 /=0 && x`mod` 4 == 0 = True
    | otherwise = False

-- main = print(isLeapYear 2024)

-- 3. Given a decimal number turn it into an octal number.
-- Octal number has eight as a base instead of 10 in decimal numbers.

octalaux:: Int -> Int
octalaux 0 = 0
octalaux x = octalaux(x `div` 8) * 10 + x `mod` 8


octal :: Int -> Int
octal x 
    | x < 0 = error "Input must be positive"
    | otherwise = octalaux x


-- main = print(octal (-100)) -- error
-- main = print(octal 100) -- 144

-- -  Theres a football match in Budapest and you are the software engineer of the stadium.
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

sumofdigits :: Int -> Int 
sumofdigits 0 = 0
sumofdigits x = x `mod` 10 + sumofdigits (x `div` 10) 

-- main = print(sumofdigits 123456)

isVip :: Int -> String
isVip x 
    | even x && odd (sumofdigits x) = "VIP"
    | otherwise = "Normal"

-- main = print(isVip 12345) -- Normal

--  Make a function that takes two numbers and counts the number of even digits in the number formed
--  by the sum of the two numbers
--  example : 
--   Input : 430 561
--   430 + 561 = 991  => 9 is a multiple of 3 , other 9 is also a multiple , 1 is not
--   so output : 2

count :: Int -> Int
count 0 = 0
count y 
    |(y `mod` 10) `mod` 3 ==0 = 1 + count (y `div` 10)
    |otherwise = count ( y `div` 10)

countofm3:: Int -> Int -> Int
countofm3 x y = count (x + y)

-- main = print(countofm3 8 0)
-- main = print(countofm3 430 561) -- 2
-- main = print(countofm3 96999 0) -- 5
-- main = print(countofm3 438 561) -- 3

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

oddquotients :: Int -> Int
oddquotients 1 = 0
oddquotients x 
    | odd x = oddquotients (3*x + 1) + 1
    |otherwise = oddquotients ( x `div` 2) + 0

-- main = print(oddquotients 97)

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

fibonacci:: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n 
    | n < 0 = error "Negative inputs are invalid"
    | otherwise = fibonacci(n-1) + fibonacci (n-2)


oddfib :: Int -> Int
oddfib 0 = 0
oddfib n
    | odd (fibonacci n) = (fibonacci n) + oddfib (n-1)
    | otherwise = oddfib (n-1)

-- main = print(oddfib 16)


-- 8. Given a positive integer and a string value belongsto {"Even","Odd"} and write a function that returns the sum of the odd digits if the given string is "Odd" and
-- 	returns the sum of even digits if the given string is "Even".
-- 	String equality can be checked with == operator. "Even" == "Even" is true and "Odd" == "Odd" is true.
-- 	For ex:
-- 	123046 "Even" -> 2, 4 and 6 are the only Even digits among them, so the result is 12
-- 	123046 "Odd" -> 1 and 3 are the only Odd digits among them, so the result is 4.

sumeven :: Int -> Int
sumeven 0 = 0
sumeven x 
    | even (x `mod` 10) = x `mod` 10 + sumeven (x `div` 10)
    | otherwise = sumeven (x `div` 10)

sumodd :: Int -> Int
sumodd 0 = 0
sumodd x 
    | odd (x `mod` 10) = x `mod` 10 + sumodd (x `div` 10)
    | otherwise = sumodd (x `div` 10)



oddoreven :: Int -> String -> Int
oddoreven x y 
    | y == "Even" = sumeven x
    | y == "Odd" = sumodd x
    | otherwise = error "Invalid option"

-- main = print(oddoreven 123046 "Odd")

-- Divisors

div100 :: Int -> [Int]
div100 n = [y | y <- [1..100], n `mod` y == 0]

-- main = print(div100 100)


