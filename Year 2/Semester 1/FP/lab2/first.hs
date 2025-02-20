import Data.Char (isUpper, isLower, toUpper, toLower)

--main :: IO()
--main = print("Hello world")

-- Hello world!
greeting :: String -> String -> String -> String
greeting a b c = a ++ b ++ c

--main = print( greeting "hello" " " "world" ) -- "hello world"

-- 1. Define a function maxi with two arguments that delivers the maximum of the two.
maxi :: Int -> Int -> Int
maxi x y
    | x > y = x
    | otherwise = y

--main = print( maxi 34 56 ) -- 56

-- 2. Triple a number.
triple :: Int -> Int
triple x = 3 * x

-- main = print( triple 5 ) -- 15

-- 3. Check if a number is odd.
--isoddnr :: Int -> Bool
--isoddnr x = mod x 2 == 1
-- another solution
--isoddnr x = x `mod` 2 == 1

--main = print(isoddnr 5) -- True
--main = print(isoddnr 6) -- False

-- 4. Check if a number is the sum of two other given numbers in any order.
issum :: Int -> Int -> Int -> Bool
issum x y z = (x == y + z) || (y == x + z) || (z == x + y)

--main = print( issum 10 6 3 )  -- False
--main = print( issum 10 6 4 )  -- True

-- 5. Check if a number is multiple of 10. Fill in the missing operator instead of _
ismult10 :: Int -> Bool
ismult10 x = x `mod` 10 == 0
--ismult10 x = x _ 10 == 0

--main = print( ismult10 20 ) -- True
-- main = print( ismult10 201 ) -- False

-- 6. Write a function which returns true if a is divisible by b. 
divBy :: Int -> Int -> Bool
divBy a 0 = error "Division by 0" 
divBy a b = a `rem` b == 0

--main = print (divBy 10 2) -- True
--main = print (divBy 10 3) -- False
--main = print (divBy 10 0) -- "Dvision by 0"


-- 7. Write a function which returns true if a is divisible by b or vice versa. Fill in the blanks
--divAny :: Int -> Int -> Bool
-- divAny a b = a _ b == 0 _ b _ a == 0

-- 8. Given three integer numbers a, b and c, check if both a and b have the same remainder when divided by c.
sameRem :: Int -> Int -> Int -> Bool
sameRem a b c = (mod a c) == (mod b c)

-- main = print( sameRem 12 4 4) -- True
-- main = print( sameRem 12 4 3) -- False
-- main = print( sameRem 13 4 3) -- True

-- 9. Given two integers and a boolean value, check if the first integer is even, the second divisible by 13 and the boolean value is True.
-- Fill in the missing boolean operators.

--check :: Int -> Int -> Bool -> Bool
-- check a b c = (mod a 2 == 0) _ (mod b 13 == 0) _ c

-- main = print( check 4 26 True) -- True
-- main = print( check 5 26 True) -- False
-- main = print( check 5 23 True) -- False

-- 10. Compute the cube of a number.
cube :: Int -> Int
cube x = x^3

-- main = print( cube 4 )  -- 64
-- main = print( cube 8  ) -- 512

-- 11. Write a function that takes two arguments, say n and x, and computes their power,
-- in 2 versions - with recursion and without recursion.
power :: Int -> Int -> Int
power x n
    | n < 0 = error "negative number"
    | otherwise = x^n

-- main = print( power 2 5 ) -- 32

powerrec  :: Int -> Int -> Int
powerrec x n
    | n < 0 = error "no negative numbers"
    | n == 0 = 1
    | otherwise = x * powerrec x (n-1)

-- main = print( powerrec 2 0) --  1
--main = print( powerrec 2 4 ) -- 16

-- 12. Write GetLastPositive function
-- Returns the number decreased by the last digit if positive, otherwise returns -1.

getLastPositive :: Int -> Int
getLastPositive n
    | n < 0     = -1
    | otherwise = n - (n `mod` 10)

-- main = print( getLastPositive 5856)   -- 5850  
--main = print( getLastPositive 689255) -- 689250
-- main = print( getLastPositive 0)      -- 0
-- main = print( getLastPositive 8)      -- 0
-- main = print( getLastPositive (-8554)) -- -1

-- 13. Convert digit to string
-- Convert an integer from 0 to 5 into a word, otherwise return "Not less or equal to 5".

digitToString :: Int -> String
digitToString n
    | n == 0 = "Zero"
    | n == 1 = "One"
    | n == 2 = "Two"
    | n == 3 = "Three"
    | n == 4 = "Four"
    | n == 5 = "Five"
    | otherwise = "Not less or equal to 5"

--main = print( digitToString 4) -- "Four"
-- main = print( digitToString 8) -- "Not less or equal to 5"
-- main = print( digitToString (-1)) -- "Not less or equal to 5"

-- 14. Change case
-- If a character is lowercase, convert to uppercase, and vice versa.

ch :: Char -> Char
ch c
    | isLower c = toUpper c
    | isUpper c = toLower c
    | otherwise = c

-- main = print( ch 'c') -- 'C'

-- 15. Is it a perfect square?
-- Check if a number is a perfect square.

isPerfectSquare :: Int -> Bool
isPerfectSquare n = (floor sqrtN) ^ 2 == n
  where sqrtN = sqrt (fromIntegral n)

--main = print( isPerfectSquare 9) -- True
-- main = print( isPerfectSquare 10) -- False

-- 16. Average of 5 numbers
-- Compute the average of 5 numbers.

av5 :: Int -> Int -> Int -> Int -> Int -> Double
av5 a b c d e =  fromIntegral (a + b + c + d + e) / 5.0

--main = print( av5 1 2 3 4 5) -- 3.0
--main = print(av5 3 5 7 9 10) -- 6.8

-- 17. Are numbers sorted?
-- Check if 5 numbers are sorted in increasing order.

isSorted :: Int -> Int -> Int -> Int -> Int -> Bool
isSorted a b c d e = a <= b && b <= c && c <= d && d <= e

-- main = print(isSorted 1 1 1 1 1) -- True
-- main = print(isSorted 1 2 3 4 5) -- True
-- main = print(isSorted 4 3 2 1 0) -- False

-- 18. Odd-even operation
-- Return the product if both numbers are odd, sum if both are even, otherwise return 0.

oddEven :: Int -> Int -> Int
oddEven a b
    | odd a && odd b = a * b
    | even a && even b = a + b
    | otherwise = 0

-- main = print(oddEven 474 8983) -- 0
-- main = print(oddEven 6 6) -- 12
-- main = print(oddEven 7 7) -- 49

-- 19. Transform days into years, weeks, and days.
-- Convert the number of days into a string of years, weeks, and days.

transform :: Int -> String
transform days = show years ++ " year " ++ show weeks ++ " week " ++ show remainingDays ++ " days"
  where
    years = days `div` 365
    weeks = (days `mod` 365) `div` 7
    remainingDays = (days `mod` 365) `mod` 7

--main = print(transform 375) -- "1 year 1 week 3 days"
-- main = print(transform 365) -- "1 year 0 week 0 days"
-- main = print(transform 1050) -- "2 year 45 week 5 days"
-- main = print(transform 2500) -- "6 year 44 week 2 days"

-- 20. Write a function which calculates the sum of the digits of a number.

digitSum :: Int -> Int
digitSum 0 = 0
digitSum n = n `mod` 10 + digitSum (n `div` 10)

-- main = print(digitSum 1234) -- 10

-- 21. Compute the sum 1+ 2*2+ 3*3*3+ 4*4*4*4+ 5*5*5*5*5+ ...+n*n*n*...*n where n is a positive number.
sumpowers :: Int -> Int
sumpowers 0 = 0
sumpowers n = n^n + sumpowers(n-1)

-- 22. Sum of squares
-- Compute the sum of the squares of numbers from 1 to n.

squareSum :: Int -> Int
squareSum n 
    | n < 0 = 0
    | otherwise = n^2 + squareSum (n-1)

-- Examples
-- main = print(squareSum 5) -- 55
-- main = print(squareSum 0) -- 0
-- main = print(squareSum 100) -- 338350

-- 23. Given a positive integer, find the sum of the odd numbers up to that number starting from 1.
sumOdd :: Int -> Int
sumOdd n 
    | n <= 0 = error "has to be positive"
    | n == 1 = 1
    | (n > 0) && (mod n 2 == 0) = sumOdd (n - 1)
    | (n > 0) && (n `mod` 2 /= 0) = n + sumOdd (n - 2)

-- task: try solving it using in-built odd and even functions

-- sumOdd 5 // 9 
-- sumOdd 21 // 121
-- sumOdd 10 // 25 = 9+7+5+3+1
-- sumOdd -13 // n has to be positive

-- 24. Compute for a given positive n the sum of 2i*(2i+1), for i from 1 to n. E.g. for n=3 the sum is 68.
f :: Int -> Int
f 0 = 0
f i = 2*i*(2*i+1) + f(i-1)

--main = print( f 0 ) -- 0
--main = print( f 3 ) -- 68

--  25. Armstrong number
--  If sum of cubes of each digit of the number is equal to the number itself, then the number is called an Armstrong number.
--  153 = 1^3 + 5^3 + 3^3
--  Given a positive integer number, write a function to determine whether it is an Armstrong number or not.

toDigit :: Int -> Int
toDigit x 
    | x<10 = x^3
    | otherwise = toDigit(x `div` 10) + (x `rem` 10)^3 


armstrong :: Int -> Bool
armstrong x
    | x == toDigit x = True
    | otherwise = False

-- main = print( armstrong 153) -- True
-- main = print( armstrong 370) -- True
-- main = print( armstrong 0) -- True
-- main = print( armstrong 12) -- False
