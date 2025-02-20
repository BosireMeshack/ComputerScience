{-# LANGUAGE ParallelListComp #-}
import Data.Time.Clock.TAI (taiClock)

-- 1. McCarthy function
-- McCarthy is a renowned computer science theorist who defined a 
-- recursive function called f91. It takes a positive integer N as input 
-- and returns a positive integer following these rules:
 
-- If N is less than or equal to 100, then f91(N) equals f91(f91(N + 11)).
-- If N is greater than or equal to 101, then f91(N) equals N - 10.
-- Write a program to compute McCarthy's function f91 value.
-- If the input number is less than 1, abort with "Stop".

f91 :: Int -> Int
f91 n
    | n <= 1 = error "Stop"
    | n<=100 = f91 (f91 (n + 11))
    | n>=101 = n - 10

-- main= print(f91 500) --490
-- main= print(f91 91) --91
-- main= print(f91 0) --Stop
-- main= print(f91 100) --91

-- 2. Count steps
-- Write a recursive function to count the minimum number of steps 
-- required to reduce a positive integer to 1.
-- Allowed steps are: subtract 1, divide by 2 (if divisible), 
-- or divide by 3 (if divisible).


countStepsToOne :: Int -> Int 
countStepsToOne 1 = 0
countStepsToOne n
        | even n = 1 + countStepsToOne (n `div` 2)
        | (n `mod` 3) == 0 = 1 + countStepsToOne (n `div` 3)
        | otherwise = 1 + countStepsToOne (n-1)

-- main = print(countStepsToOne 1)  -- 0
-- main = print(countStepsToOne 2)  -- 1
-- main = print(countStepsToOne 6)  -- 2
-- main = print(countStepsToOne 10) -- 4
-- main = print(countStepsToOne 27) -- 3
-- main = print(countStepsToOne 30) -- 5


-- - 3. Position (common)
-- Given a list and a number, find the number in the list.
-- If it is present, return its index. If not, return -1.
-- (you can assume that the number is present only once)


-- Tracking index
helperindex :: [Int] -> Int -> Int -> Int
helperindex [] n c = -1
helperindex (x:xs) n c
    | x == n = c 
    | otherwise = helperindex xs n (c+1)



position :: [Int] -> Int -> Int 
position ls num = helperindex ls num 0



-- 4. Split sums
-- Given an integer, split it into two integers and then sum them.
-- Return a list of sums.
-- 
-- Splitsum 1234 = [235, 46, 127]
--                 1|234  12|34  123|4  
--                 1+234  12+34  123+4  
 --learn by heart
 
toDigits :: Int -> [Int]
toDigits n  
    | n<10 = [n]
    | otherwise =  toDigits (n `div` 10) ++ [n`mod`10]

toInt :: [Int] -> Int
toInt [] = 0 
toInt ls = (head ls)*10^(length ls - 1) + toInt (tail ls)


helperSum :: [Int] -> Int -> Int -> [Int]
helperSum []  len ind = []
helperSum ls len ind 
    | ind <= len = [toInt(take ind ls) + toInt(drop ind ls)] ++ helperSum ls len (ind+1)
    | otherwise = []
 
splitsum :: Int -> [Int]
splitsum n = helperSum (toDigits n) (length (toDigits n) - 1) 1


-- main = print(splitsum 888)     -- [96,96]
-- main = print(splitsum 1234)    -- [235,46,127]
-- main = print(splitsum 0)       -- []
-- main = print(splitsum 123321)  -- [23322,3333,444,1254,12333]


-- 5. Apply
-- Write a function that takes a function and two lists 
-- and applies the function to all elements
-- of the lists and returns the new list with output.

apply :: (a -> a -> a) -> [a] -> [a] -> [a]
apply fx ls1 ls2 = zipWith fx ls1 ls2


-- Test functions
summ :: Int -> Int -> Int
summ x n = x + n

prodd :: Int -> Int -> Int
prodd x n = x * n

joinn :: String -> String -> String
joinn x y = x ++ y


-- main = print(apply summ [1,2,3,4,5] [4,5,6])       -- [5,7,9]
-- main = print(apply prodd [1,2,3] [4,5,6,7])        -- [4,10,18]
-- main = print(apply joinn ["Hello","Hi","Ciao","Szia"] ["World","John"]) -- ["HelloWorld","HiJohn"]


-- 6. Pairs
-- Given two lists of integers, list1 and list2, and a target number, 
-- find all unique pairs where one element is taken from list1 and 
-- the other from list2, such that their sum equals the target number. 
-- The pairs should be returned as a list of tuples, with each tuple 
-- consisting of one integer from list1 and one integer from list2

-- Given [1,2,3] and [4,5,6], and target number 7, pairs that add to 7 
-- are (1,6), (2,5), (3,4). 
-- Return them as a list so final output is [[(1,6),(2,5),(3,4)]

findPairSums :: [Int] -> [Int] -> Int -> [(Int, Int)]
findPairSums ls1 ls2 tgt = [(x,y) | x<-ls1, y<-ls2, x+y==tgt]

-- main = print(findPairSums [1,2,3] [4,5,6] 7)       -- [(1,6),(2,5),(3,4)]
-- main = print(findPairSums [6, -2, 3] [5, 2, 7] 5)  -- [(-2, 7),(3, 2)]
-- main = print(findPairSums [-4,5,6] [4,-6,-5] 0)    -- [(-4,4),(5,-5),(6,-6)]

-- 7. Update
-- Each tuple in a list indicates a key, value pair (key, value). 
-- Given a key and a value, if the new key already exists in the list, 
-- the value should be replaced, otherwise a new pair is added to the list. 

-- 'b' 6 [('a', 5), ('b', 18), ('c', 7)] --> the value of b must be updated to 6 
-- == [('a', 5), ('b', 6), ('c', 7)]
update :: Char -> Int -> [(Char, Int)] -> [(Char, Int)]
update char num [] = [(char,num)]
update char num (x:xs) 
    |fst x == char = [(fst x, num)] ++ update char num xs
    |otherwise = [x] ++ update char num xs


-- main = print(update 'b' 6 [('a', 5), ('b', 18), ('c', 7)]) -- [('a',5),('b',6),('c',7)]
-- main = print(update 'b' 6 [])               !!             -- [('b',6)]


-- 8. Append 
-- Write a function that takes a list of characters and creates 
-- a string by joining alternate characters together and 
-- then appending the two strings, assume lists to have 
-- even number of characters.

-- ['a','b','c','d'] becomes "ac" + "bd" -> "acbd"
-- ['d','o','m','i','n','o'] becomes "dmn" + "oio" -> "dmnoio"

faind :: [(Char, Int)]  -> String
faind [] = []
faind (x:xs) 
    | even (snd x) = [fst x] ++ faind xs 
    | otherwise = faind xs

faindo :: [(Char, Int)]  -> String
faindo [] = []
faindo (x:xs) 
    | odd (snd x) = [fst x] ++ faindo xs 
    | otherwise = faindo xs

fa :: [Char] -> String
fa ls =  g1 ++ g2
    where 
        y = zip ls [0..]
        g1 = [e | (e,i) <- zip ls [0..], even i]
        g2 = [e | (e,i) <- zip ls [0..], odd i]


-- main = print(fa ['a','b','c','d'])       -- "acbd"
-- main = print(fa ['d','o','m','i','n','o']) -- "dmnoio"

-- 9. Game
-- In a football game, players typically play for 90 minutes unless they 
-- are substituted out. We are given a list of tuples, where each tuple 
-- represents a player. Each player tuple consists of their name (a string), 
-- a Boolean value indicating whether the player was subbed off and the minute 
-- at which they were subbed off (an integer).

-- If the Boolean value is False, it means the player was not substituted off and
-- his playtime was 90 minutes, despite what is written at the third field of the tuple.
-- Given a list of tuples, calculate the total playtime for all the players.

-- [("Player1", False, 129), ("Player2", True, 60), ("Player3", False, -99), ("Player4", True, 75) ]
-- Returns : 90 + 60 + 90 + 75 = 315

third:: (a,b,c) -> c
third (_,_,x) = x

send :: (a,b,c) -> b
send (_,b,_) = b


playTime :: [(String, Bool, Int)] -> Int
playTime [] = 0
playTime (x:xs)
    | send x == True = (third x) + playTime xs
    | otherwise = 90 + playTime xs

-- main = print(playTime [])  -- 0
-- main = print(playTime [("a", False, -1),("b", False, 0),("c", False, 0),("d", False, 12)]) -- 360
-- main = print(playTime [("a", True, 85),("b", True, 5),("c", True, 23),("d", True, 12)])   -- 125
-- main = print(playTime [("Player1", False, 129), ("Player2", True, 60), ("Player3", False, -99), ("Player4", True, 75)]) -- 315

-- 10. Scramble
-- Define a function scramble that takes a list and puts all the 
-- elements at even positions before the elements at odd position. 
-- Positions are numbered starting at 0, so first element is at an even position. 

-- scramble [0..10] == [0,2,4,6,8,10,1,3,5,7,9] 

scramble :: [a] -> [a]
scramble list = evens ++ odds
    where
      evens = [e | (e,i) <- zip list [0..], even i]
      odds = [e | (e,i) <- zip list [0..], odd i]

-- main = print(scramble [0,1,2])              -- [0,2,1]
-- main = print(scramble [0..10])              -- [0,2,4,6,8,10,1,3,5,7,9]
-- main = print(scramble "Functional Programming") -- "FntoalPormigucining"

-- 11. Differences average
-- Given a list of integers, which is sorted in ascending order, 
-- implement a function which computes the average differences between 
-- two adjacent integers.

-- Input: [1, 4, 9]
-- Output: 4
-- The difference from 1 to 4 is 3, and from 4 to 9 is 5, thus the differences' average is (3 + 5)/2=4

-- Input: [3,7,12,13]
-- Output: 3.666
-- Explanation ((7-3)+(12-7)+(13-12))/3 = 3.6667

-- main = print(diffs [14, 16, 20, 34, 59, 71])

averageDifference :: [Int] -> Double
averageDifference ls = fromIntegral((last ls) - (head ls)) / (fromIntegral(length ls)-1)

-- main = print(averageDifference [14, 16, 20, 34, 59, 71]) -- 11.4
-- main = print(averageDifference [18, 22, 24, 40, 76, 82]) -- 12.8
-- main = print(averageDifference [32, 45, 47, 54, 64, 72]) -- 8.0
-- main = print(averageDifference [44, 56, 64, 67, 69, 84]) -- 8.0

-- 12. Triple tuples
-- Given a 2-dimensional list of integers, generate a list of 3-element tuples
-- (first, mid, last) for each sublist.
-- If the list has an even number of elements, use -1 as the mid element.
-- If the list is empty, use -1 for first, mid, and last.

startMidEnd :: [[Int]] -> [(Int, Int, Int)]
startMidEnd ls = map(\x -> toTripple x) ls
-- startMidEnd ls = zip3 (first ls) (mid ls) (end ls)

-- main = print(startMidEnd [[9,8,5,0],[9,8,5,3,4],[1,2,3]]) -- [(9,-1,0),(9,5,4),(1,2,3)]
-- main = print(startMidEnd [[2,3],[5],[]]) -- [(2,-1,3),(5,5,5),(-1,-1,-1)]
-- main = print(startMidEnd []) -- []
-- main = print(startMidEnd [[-1,-1,-1],[]]) -- [(-1,-1,-1),(-1,-1,-1)]


toTripple :: [Int] -> (Int, Int, Int)
toTripple [] = (-1,-1,-1)
toTripple ls
    | even (length ls) = (first ls, -1, end ls)
    | otherwise = (first ls, middle ls, end ls)
    where first ls = head ls
          middle ls = ls !! ((length ls) `div` 2)
          end ls = last ls



-- first :: [[Int]] -> [Int]
-- first [] = []
-- first (x:xs) 
--     | x == [] = [-1]
--     |otherwise = [head x] ++ first xs

-- mid :: [[Int]] -> [Int]
-- mid [] = []
-- mid (x:xs) 
--     | x == [] = [-1]
--     | even (length x) = [-1] ++ mid xs
--     | otherwise = [middle] ++ mid xs 
--     where middle = x !! (length x `div` 2)

-- end :: [[Int]] -> [Int]
-- end [] = []
-- end (x:xs) 
--     | x== [] = [-1]
--     | otherwise = [last x] ++ end xs



-- 13



-- main = print(toint (todigits 123))

--counting the number of occurrences of an element in a list

ls = [1,2,2,4,5,5,15]

occurences5 = length (filter (==5) ls)

-- main =  print(occurences5)


isPrime :: Int -> Bool 
isPrime num = length ([divi | divi <- [1..num], num `rem` divi == 0]) == 2

isgood :: Int -> Int -> Bool 
isgood pos num
    | even pos && even num = True 
    | odd pos && isPrime num = True
    | otherwise = False

isgoodlist :: [Int] -> Bool 
isgoodlist ls = and [isgood pos num | (num,pos) <- zip ls [0..]]

count_good_lists::[[Int]] -> Int
count_good_lists [] = 0
count_good_lists (x:xs)
    | isgoodlist x == True = 1 + count_good_lists xs
    | otherwise = count_good_lists xs
-- count_good_lists ls = length (filter (\x-> isgoodlist x) ls)

-- main = print (count_good_lists [[2,2,4,5], [2,3,3,5]]) -- 1
-- main = print (count_good_lists [[2,23,22], [2,29,22,5], [1,2,3]]) --  2
-- main = print (count_good_lists [[2,2,4,5], [2,2,6,7,8,11,12,17], [12,23,4]]) --  3
-- main = print (count_good_lists []) --  0

{-
    3- Increase by position - 10 points
    Given a list of real numbers, add the position of every number to the number.    
    Input:  [1.0,2.1,3.5,2.0]
    Output: [1.0,3.1,5.5,5.0] (the position of 1.0 is 0 -> 1.0 + 0 = 1.0  
                               the position of 2.1 is 1 -> 2.1 + 1 = 3.1 
                               the position of 3.5 is 2 -> 3.5 + 2 = 5.5
     -}

     
increaseByPosition :: [Double] -> [Double]
increaseByPosition ls = [i+e | (e,i) <- zip ls [0..]]


-- main = print (increaseByPosition [1.0, 2.1, 3.5, 2.0])         --  [1.0, 3.1, 5.5, 5.0]
-- main = print (increaseByPosition [55.12, 22.45, 2.10, 15.1, 20.20]) -- [55.12, 23.45, 4.1, 18.1, 24.2]
-- main = print (increaseByPosition [])  -- []


-- TASK 4 
{-
    4- Reverse integers - 10 points
    Given a list of integer numbers, reverse every number in the list.
    Reversing a number means to write its digits in the reversed order. 
    Input:  [1,234,5677,43,0]
    Output: [1,432,7765,34,0] Reverse of 1 is 1    
       Reverse of 234: the digits of 234 in reversed order are 4,3 and 2, 
       and by combining these digits we get the number 432
    Note: reverse of e.g. 230 is 32 NOT 032  

-}



toint :: [Int] -> Int 
toint [] = 0
toint (x:xs) = x * 10^((length (x:xs)) -1) + toint xs



todigits :: Int -> [Int] 
todigits x
    | x < 10 = [x]
    | otherwise= [x `mod` 10] ++ todigits (x `div` 10)

rev_nums :: [Int] -> [Int]
rev_nums [] = []
rev_nums (x:xs) = (toInt (todigits x)) :rev_nums xs

-- main = print (rev_nums [1,234,5677,43,0])            -- [1,432,7765,34,0]
-- main = print (rev_nums [1..5])                       -- [1,2,3,4,5]
-- main = print (rev_nums [222..240])                   -- [222,322,422,522,622,722,822,922,32,132,232,332,432,532,632,732,832,932,42]
-- main = print (rev_nums [])                           -- []

-- TASK 5 
{- 
    5- Passed students - 10 points
    Given a list of tuples and an integer number (let's call it x), where 
    the first element of the tuple represents a student's name and 
    the second element of the tuple represents the points of the student 
    that he/she got in a particular subject (its type is a list of real numbers).
    Return those students whose points have the following property:
    if the sum of the INTEGER parts of the points is greater than or equal 
    to the given number x.
    Input: [("Abdullah",[55.55,66.55,77.75,65.07,65.57]),("Mohammed",[27.55,20.55,10.75,30.07,20.57])] 320 
    Output: ["Abdullah"]
-}


passedStudents :: [(String, [Double])] -> Int -> [String]
passedStudents ls num = [name | (name,points) <- ls, sum (map(\x->floor x)points ) >= num]

-- main = print (passedStudents [("Abdullah", [55.55,66.55,77.75,65.07,65.57]),("Mohammed",[27.55,20.55,10.75,30.07,20.57])] 320) 
-- ["Abdullah"]

-- main = print (passedStudents [("Sara" , [5.55,44.55,55.75,30.07,90.57]),("Rayan",[56.55,66.55,7.75,77.07,77.57]),("Ali",[1.55,6.55,66.75,6.07,7.57]),("Maria",[54.55,60.55,66.75,20.07,74.57])] 200) 
-- ["Sara","Rayan","Maria"]
-- main = print (passedStudents [] 100) --  []

--  TASK 6 
{-
    6- Eliminate - 10 points
    Given a list of numbers eliminate the first number of 
    every two numbers in the list, until only one number is left.  
    Input: a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
           a = [2, 4, 6, 8]
           a = [4, 8]
           a = [8] 
-}


eliminateHelper :: [Int] -> [Int]
eliminateHelper [] = []
eliminateHelper [x] = []
eliminateHelper (x:y:xs) = [y] ++ eliminateHelper xs

eliminate :: [Int] -> [Int]
eliminate [] = []
eliminate [x] = [x]
elimante ls = eliminate (eliminateHelper ls)


-- main = print (eliminate [1..9]) -- [8]
-- main = print (eliminate [1, 2, 3, 4]) -- [4]
-- main = print (eliminate [0]) -- [0]
-- main = print (eliminate []) --  []


-- TASK 7 
{-
    7- Delete third - 10 points
    Delete every third element from a list.
-}


del3 :: [Int] -> [Int]
del3 [] = []
del3 [x] = [x]
del3 [x,y] = [x,y]
del3 (x:y:z:xs) = x:y: del3 xs

-- main = print (del3 [1..7])  -- [1,2,4,5,7]
-- main = print (del3 [1..20]) --[1,2,4,5,7,8,10,11,13,14,16,17,19,20]
-- main = print (del3 [1..5])  -- [1,2,4,5]
-- main = print (del3 [])      --[]


-- fib:: Int -> Int
-- fib 0 = 0
-- fib 1 = 1
-- fib n
--     | n<0 = error "Undefined"
--     | otherwise = fib(n-1) + fib (n-2)

-- fiblist:: Int -> [Int]
-- fiblist n 
--     |n==0 = [0]
--     |otherwise=fiblist (n-1) ++ [fib n]

-- finList :: [Int] -> [[Int]]
-- finList ls = map(\x-> fiblist x) ls

-- main = print (finList [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

-- main = print (finList [0, 45, 88, 87, 21])
-- main = print (finList []) -- []

fib :: Int -> Int
fib n
    | n < 0     = error "Undefined"
    | otherwise = fibs !! n
    where
        fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fiblist :: Int -> [Int]
fiblist n
    | n < 0     = error "Undefined"
    | otherwise = take (n + 1) fibs
    where
        fibs = 0 : 1 : zipWith (+) fibs (tail fibs)


finList :: [Int] -> [[Int]]
finList ls = map fiblist ls

main = print (finList [0, 45, 88, 87, 21])  -- Should now execute much faster



