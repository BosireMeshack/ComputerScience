
import Data.Char
import Data.List (sortBy)
import Data.Ord (comparing)
{-- WRITE 
NAME BOSIRE MESHACK NYAGWENCHA
AND 
NEPTUN CODE IVF370
HERE by this YOU DECLARE this FILE is 
YOUR OWN SOLUTION for functional 
programming midterm 2024 November 14. --}
-- MIDTERM Thursday VERSION B


{- 1 ===========================
Given a positive integer and a digit, write a function that removes all digits 
in the number that are smaller than the given digit.
Example: For the number 4572 and the digit 5, 
the resulting number should be 57, as all digits smaller than 5 are removed.
-}

toDigits :: Int -> [Int]
toDigits n 
    | n < 10 = [n]
    | otherwise = toDigits (n`div` 10) ++ [n`mod` 10]
-- main = print(toDigits 123)
toInt :: [Int] -> Int 
toInt [] = 0
toInt (x:xs) = x*10^(length (x:xs)-1) + toInt xs

chhelper :: [Int] -> Int -> [Int]
chhelper [] num = []
chhelper (x:xs) num
    | x < num = chhelper xs num 
    | otherwise = x:chhelper xs num

-- main = print(chhelper [1,2,3] 2)
 
changeNumber :: Int -> Int -> Int
changeNumber n m = toInt(chhelper (toDigits n) m )

-- main = print(changeNumber 45347 4) -- -4547
-- main  = print(changeNumber 4572 5) -- 57
-- main = print(changeNumber 523189 3) -- 5389


{- 2 ===========================
Write a function that takes a list and replaces
all the zeroes with their respective positions within that list.
Example: zeroes2Index [0, 10, 0, 0, 0] -> [0,10,2,3,4]
-}

-- ls = [x | x <- [1..10], even x]

-- switchzero:: 

zeroes2IndexAux :: Int -> [Int] -> [Int]
zeroes2IndexAux _ [] = []
zeroes2IndexAux i (x:xs)
    | x == 0 = i : zeroes2IndexAux (i+1) xs
    | otherwise = x : zeroes2IndexAux (i+1) xs



zeroes2Index :: [Int] -> [Int]
zeroes2Index ls = zeroes2IndexAux 0 ls


-- zeroes2Index ls = [i |(e,i) <- y, e==0 ]
--   where 
--         y = zip ls [0..]

-- main = print (zeroes2Index [0, 10, 0, 0, 0]) -- [0,10,2,3,4]
-- main = print (zeroes2Index [0, 1, 2, 5, 2, 6, 0]) -- [0,1,2,5,2,6,6]
-- main = print (zeroes2Index [0, 0, 0, 0, 0]) -- [0,1,2,3,4]
-- main = print (zeroes2Index [5, 0, 7, 0, 1, 2, 0, 3]) -- [5,1,7,3,1,2,6,3]


{- 3 ===========================
Write a function that takes a list of integers 
and groups consecutive duplicate elements together.
Example: 
groupConsecutive [1,2,2,3,3,3,4] -> [[1], [2, 2], [3, 3, 3], [4]]
-}



groupConsecutive :: [Int] -> [[Int]]
groupConsecutive [] = []
groupConsecutive (x:xs) = (x:takeWhile (==x) xs): groupConsecutive (dropWhile (==x) xs)

-- main = print(groupConsecutive [1, 2, 2, 3, 3, 3, 4])      -- [[1],[2,2],[3,3,3],[4]]
--main = print(groupConsecutive [5, 5, 5, 5])               -- [[5,5,5,5]]
--main = print(groupConsecutive [1, 2, 3, 4])               -- [[1],[2],[3],[4]]
--main = print(groupConsecutive [1, 1, 2, 2, 3, 4, 3, 4])   -- [[1,1],[2,2],[3,3],[4,4]]


{- 4 ===========================
Write a function that takes a list of tuples (Int, Int) and 
returns a list of tuples where each tuple contains the absolute
value of the difference of the two elements of the original tuple 
as the first element, and the original tuple as the second element.
Example:
tupleDifferences [(3, 5), (10, 2), (4, 4)] -> [(2, (3, 5)), (8, (10, 2)), (0, (4, 4))]
-}

tupleDifferences :: [(Int, Int)] -> [(Int, (Int, Int))]
tupleDifferences ls = [( abs (e-i), (e,i)) | (e,i) <- ls]

-- main = print(tupleDifferences [(3,5),(10,2),(4,4)]) 
-- [(2,(3,5)),(8,(10,2)),(0,(4,4))]
-- main = print(tupleDifferences [(2,4),(-10,2),(4,-4),(0,0)]) 
-- [(2,(2,4)),(12,(-10,2)),(8,(4,-4)),(0,(0,0))]
-- main = print(tupleDifferences [(3,5),(15,15),(-4,-9),(88,-99)]) 
-- [(2,(3,5)),(0,(15,15)),(5,(-4,-9)),(187,(88,-99))]


{- 5 ===========================
Write a function that takes a list of Integers, lst, 
and returns a list of Integers that is just like lst, except that each odd
element of lst is replaced by the square of that element.
-}

squareOdds :: [Integer] -> [Integer]
squareOdds [] = []
squareOdds (x:xs)
    | odd x = x^2 : squareOdds xs 
    | otherwise = x: squareOdds xs

-- main = print $ squareOdds [] -- []
-- main = print $ squareOdds [3] -- [9]
-- main = print $ squareOdds [4,3] -- [4,9]
-- main = print $ squareOdds [1,2,3,4,5,6] -- [1,2,9,4,25,6]
-- main = print $ squareOdds [3,22,3] -- [9,22,9]


{- 6 ===========================
Write a function that takes a function and a list,
and applies the function to each element along 
with its index in the list.
-}


mapWithIndex :: (Int -> a -> b) -> [a] -> [b]
mapWithIndex f ls1 = zipWith f [0..] ls1 
 where 
    w = zip ls1 [0..]
    y = [ snd x | x <- w]

-- main = print (mapWithIndex (\i x -> show i ++ ":" ++ x) ["a", "b", "c"]) 
-- ["0:a", "1:b", "2:c"]
-- main = print (mapWithIndex (\i x -> i + 1) [5, 10, 15])                  
-- [1, 2, 3]
-- main = print (mapWithIndex (\i x -> (i, x)) [True, False])              
-- [(0, True), (1, False)]
-- main = print (mapWithIndex (\i x -> x + i) [10, 20, 30])                 
-- [10, 21, 32]


{- 7 ===========================
Write a function, that takes a list of tuples where 
each tuple contains a name and an age.
The function returns a pair of lists: one containing 
all the names and another containing all the ages.
-}

extractNamesAndAges :: [(String, Int)] -> ([String], [Int])
extractNamesAndAges ls = unzip ls


-- main = print(extractNamesAndAges [("Alice", 30), ("Bob", 25), ("Charlie", 35)])
-- (["Alice", "Bob", "Charlie"], [30, 25, 35])
-- main = print(extractNamesAndAges [("John", 40), ("Doe", 28)])
-- (["John", "Doe"], [40, 28])
-- main = print(extractNamesAndAges []) -- ([], [])


{- 8 ===========================
Given a string s, your task is to return another string such that 
even-indexed and odd-indexed characters of s are grouped and 
the groups are space-separated. Even-indexed group comes as first, 
followed by a space, and then by the odd-indexed part.
Examples:
input:    "meirdmt" => "midt erm"
           |||||||      |||| |||
indices:   0123456      0246 135
-}
odds :: [(Char,Int)] -> [Char]
odds ls = [x | (x,i) <- ls, odd i]

evens :: [(Char,Int)] -> [Char]
evens ls = [x | (x,i) <- ls, even i]

sortMyString :: String -> String
sortMyString ls = (evens b) ++ " " ++ (odds b)
 where b = zip ls [0..]


-- main = print (sortMyString "01234567") -- "0246 1357"
-- main = print (sortMyString "caonrsrweecrt!") -- "correct answer!"
-- main = print (sortMyString "meirdmt") -- "midt erm"
-- main = print (sortMyString "FPurnocgtriaomnianlg") -- "Functional Programing"


{- 9 ===========================
Write a function that takes a list of strings and returns a single string.
Every vowel should be changed to "O" (uppercase o) and every consonant should be 
changed to "l" (lowercase L), special characters are unchanged,
a space should be added after every substring and a "." at the end.
Example: ["Hi", "how", "are", "you"] -- "lO lOl OlO lOO ."
-}
vowelss :: [Char]
vowelss ="AEIOUaeiou"

consonants:: [Char]
consonants="BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz"

lett :: String -> String  
lett [] = []
lett (x:xs)
    | elem x vowelss = "O" ++ lett xs 
    | elem x consonants = "l" ++ lett xs 
    | otherwise = [x] ++ lett xs

f5 :: [String] -> String
f5 [] = "."
f5 (x:xs) = lett x ++ " " ++ f5 xs

-- main = print(f5 ["Hi", "how", "are", "you"]) 
-- "lO lOl OlO lOO ."
-- main = print(f5 ["functional", "Programming", "is", "nice", "&", "very", "fun", "$$ :)"]) 
-- "lOlllOOlOl llOllOllOll Ol lOlO & lOll lOl $$ :) ."


{- 10 ===========================
Given a list of lists, keep only those sublists that 
have more positive numbers than negative numbers. 
If a sublist is empty, it should be removed. 
-}



keepMorePositives :: [[Int]] -> [[Int]]
keepMorePositives [] = []
keepMorePositives (x:xs)
    |null x = keepMorePositives xs
    |countPositives x > countNegatives x = x: keepMorePositives xs
    |otherwise = keepMorePositives xs
    where 
        countNegatives x = length (filter (<0) x)
        countPositives x = length (filter (>0) x)

-- main = print (keepMorePositives [[1, -2, 3], [-1, -3], [4, 5, -6], [], [0, 1, 2]]) 
-- [[1,-2,3],[4,5,-6],[0,1,2]]
-- main = print (keepMorePositives [[-1, 2, -3], [-4, -5], [0, -6, 7, -8]]) -- []
-- main = print (keepMorePositives [[1, 2, -1], [4, 5, 6], [3, -2, 1, 1]])
-- [[1,2,-1],[4,5,6],[3,-2,1,1]]
-- main = print (keepMorePositives [[0, 1, -1, 2], [3, 0, -4], [5, 5, -2, 0]])
-- [[0,1,-1,2],[5,5,-2,0]]
-- main = print (keepMorePositives [[], [], []]) -- []


{- 11 ===========================
You are waiting at a bus station. You have a list of bus information. 
Each bus is represented as a tuple with a String representing the destination 
and a tuple (Int, Int) representing the arrival time to the destination 
in 24-hour format (hours, minutes).
Write a function which takes a list of tuples with String and (Int, Int) 
and your destination and returns the earliest arrival time to your destination.
If the bus to your destination is not in the list, give the error 
message "No bus to the destination".
-}

filterbyDest:: [(String, (Int, Int))] -> String -> [(String, (Int, Int))] 
filterbyDest ls dest = filter (\(x,_) -> x == dest) ls

earliestTime :: [(String, (Int, Int))] -> (Int, Int)
earliestTime [x] = snd x
earliestTime (x:y:xs)
    |xh<yh = earliestTime (x:xs)
    |xh == yh && xm < ym = earliestTime (x:xs)
    | otherwise=earliestTime (y:xs)
    where (xh, xm) = snd x
          (yh, ym) = snd y  

earliestBus :: [(String, (Int, Int))] -> String -> (Int, Int)
earliestBus ls dest = earliestTime (filterbyDest ls dest)
    

-- main = print (earliestBus [("Keleti pályaudvar", (10, 30)), ("Deák Ferenc tér", (8, 15)), ("Deák Ferenc tér", (9, 30)), ("Deák Ferenc tér", (8, 45)), ("Kálvin tér", (11, 0))] "Deák Ferenc tér") 
-- (8,15)
-- main = print (earliestBus [("Keleti pályaudvar", (10, 30)), ("Deák Ferenc tér", (8, 15)), ("Keleti pályaudvar", (10, 0)), ("Deák Ferenc tér", (9, 30)), ("Kálvin tér", (11, 0)), ("Keleti pályaudvar", (11, 45))] "Keleti pályaudvar") 
-- (10,0)
-- main = print (earliestBus [("Keleti pályaudvar", (10, 30)), ("Deák Ferenc tér", (8, 15)), ("Deák Ferenc tér", (9, 30)), ("Kálvin tér", (11, 0))] "Kálvin tér") 
-- (11,0)
-- main = print (earliestBus [("Széll Kálmán tér", (6, 30)), ("Széll Kálmán tér", (6, 15)), ("Széll Kálmán tér", (7, 0)), ("Keleti pályaudvar", (8, 0))] "Széll Kálmán tér") 
-- (6,15)


{- 12 ===========================
Write a function that takes a list of integers representing students' 
exam scores. The function should perform the following tasks:
Filter out scores that are below 0 or above 100 (considered invalid).
Calculate the average of the valid scores.
Count how many students scored above the average.
Return a tuple containing the average score and the count 
of students who scored above the average.
-}

analyzeScores :: [Int] -> (Double, Int)
analyzeScores [] = (0,0)
analyzeScores ls = ((fromIntegral(sum validscores) / fromIntegral n), aboveaveage)
    where
        validscores=filter(\x -> x>=0 && x<=100) ls
        n = length validscores
        aboveaveage = length (filter(\x -> fromIntegral x > (fromIntegral(sum validscores) / fromIntegral n)) validscores)

-- main = print(analyzeScores [85, 92, 100, 67, -10, 120, 75]) -- (83.8, 3)
-- main = print(analyzeScores [-5, 150, 200]) -- (NaN, 0) -- NaN is an error value for non-numeric values
-- main = print(analyzeScores [50, 70, 90]) -- (70.0, 1)
-- main = print(analyzeScores []) -- (0.0, 0)




-- main = print (sortBy (comparing length) ["apple", "banana", "cherry", "date"])