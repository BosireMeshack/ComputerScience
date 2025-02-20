-- 2. Ackermann function
-- Implement the Ackermann function, which is a classic example of
-- a function that grows extremely quickly.
-- It is defined recursively as:
-- A(m, n) = 
-- - n + 1                  if m = 0
-- - A(m - 1, 1)            if m > 0 and n = 0
-- - A(m - 1, A(m, n - 1))  if m > 0 and n > 0

acker:: Int -> Int -> Int
acker 0 n = n + 1
acker m n
    | m > 0 && n == 0 = acker (m-1) 1
    | m > 0 && n > 0 = acker (m-1) (acker m (n-1))

-- main = print(ackermann 0 0) -- 1
-- main = print(ackermann 1 1) -- 3
-- main = print(acker 1 2) -- 4
-- main = print(ackermann 3 3) -- 61

-- 3. Sum
-- Write a function that takes a list of integers and returns the 
-- sum of numbers between the first negative and the first zero 
-- (including the first negative). If there's no 0 after first 
-- negative, sum until the end of the list.
-- Eg. [1,2,3,-3,4,5,6,0,-6,0,5,-7]
-- numbers between first negative and first zero -3,4,5,6 
-- their sum is 12


f3 :: [Int] -> Int
f3 w =  sum(takeWhile (/=0) (dropWhile (>=0) w))

-- main = print (f3 [1,2,3,-3,4,5,6,0,-6,0,5,-7]) -- 12
-- main = print (f3 [1,4,5]) -- 0
-- main = print (f3 [5,5,-2,4,5]) -- 7
-- main = print (f3 [1,1,1,-1,1,2,3,4,5,0,-1,10,0]) -- 14

-- divisors
d1 :: Int -> [Int]
d1 n = [ x | x <- [1..n], n `rem` x == 0]

-- main = print(d1 100)

-- isprime
p1 :: Int -> Bool 
p1 n = length [x | x <- [1..n], n `rem` x == 0] == 2

-- main =  print(p1 13) -- True


-- 4. Extract
-- Write a function that extracts a sublist from a list. The first number is the
-- starting index, and the second one is the length of the sublist.

sublist :: Int -> Int -> [Int] -> [Int]
sublist s l ls = [elem | (ind, elem) <- y , ind >= s && ind < (s + l)]
    where
         y = zip [0..] ls

-- main = print(sublist 2 3 [1..7])                   -- [3,4,5]
-- main = print(sublist 0 1 [1..7])                   -- [1]
-- main = print(sublist 0 0 [1..7])                   -- []
-- main = print(sublist 0 7 [1..7])                   -- [1,2,3,4,5,6,7]
-- main = print(sublist 10 5 [1..100])                -- [11,12,13,14,15]
-- main = print(sublist 4 3 [5,8,32,7,2,6,9,12,52,3]) -- [2,6,9]
-- main = print(sublist 2 5 [5,8,32,7,2,6,9,12,52,3]) -- [32,7,2,6,9]

-- 5. Triple tuple
-- Write a function that takes a list of triple tuples (Int,Char,[Int]) 
-- and creates a single tuple with ([Int],[Char],[[Int]]).

ft3 :: [(Int,Char,[Int])] -> ([Int],[Char],[[Int]])
ft3 ls = unzip3 ls 

-- 6. Good lists
-- You are given a list of lists of integers. First, remove all those sublists whose
-- maximum absolute value is an Odd number. Afterwards, transform all remaining sublists 
-- which have more than 3 numbers to "good" and those who don't to "bad".

-- Input: [[-8,5,3],[92,33,-95],[64,86]]
-- Step 1: Remove lists where the maximum absolute value is odd
-- [-8,5,3] => we keep this, because the maximum absolute value is 8. 8 is even
-- [92,33,-95] => we do not keep this, because maximum absolute value is -95. -95 is odd
-- [64,86] => we keep this, because maximum absolute value is 86. 86 is even
-- Step 2: Transform the lists that are kept to "good" or "bad"
-- [-8,5,3] => "Good", because it has more than 2 elements
-- [64,68] => "Bad", because it does not have more than 2 elements

absls :: [Int] -> [Int]
absls [] = []
absls (x:xs) = abs x : absls xs 


removemaxodd :: [[Int]] -> [[Int]]
removemaxodd [] = []
removemaxodd (x:xs) 
  | even (maximum (absls x)) = x : removemaxodd xs
  | otherwise = removemaxodd xs


len3a :: [Int] -> String
len3a  ls
    | length ls >= 3 = "good"
    | otherwise = "bad"



-- fl = (map (\x -> ismaxodd x) [[-8,5,3],[92,33,-95],[64,86]])

-- main = print(fl)

processLists :: [[Int]] -> [String]
processLists ls = map (\x -> len3a x) (removemaxodd ls)



-- main = print(processLists [[-8,5,3],[92,33,-95],[64,86]]) -- ["good","bad"]
-- main = print(processLists [[1,1,1,1],[98,-99,72],[100]])  -- ["bad"]
-- main = print(processLists [[100,100],[2,2],[-90,-90,-90]]) -- ["bad","bad","good"]
-- main = print(processLists [[-3,5,-71],[3],[5]])   -- []

-- 7. Special sorted strings
-- Create a function that takes two lists of tuples of the same length, 
-- each containing a string and a special character. 
-- Compare tuples at the same position in both lists and 
-- keep the one with the smaller character.
 
-- Comparing ("Good", 'c') and ("Happy", 'z') would retain ("Good", 'c') because 'c' < 'z'. 
-- Then, only keep the strings with characters greater than 
-- the special character, resulting in a list of strings.

smaller :: (String, Char) -> (String, Char) -> (String, Char)
smaller ls ls1
    | snd ls < snd ls1 = ls
    | otherwise = ls1

-- main = print (smaller ("Friday",'h') ("Luck",'g'))



-- specialsort :: [(String, Char)] -> [(String, Char)] -> Char -> [String]

-- main = print(specialsort [("hhhhh",'c')] [("hahahahaha",'h')] 'c') -- []
-- main = print(specialsort [("Good ",'c'),("Happy",'z')] [("Friday",'h'),("Luck",'g')] 'a') -- ["Good ","Luck"]
-- main = print(specialsort [("May ",'i'),("Happy ",'z'),("must ",'z'),("Happy",'i'),("end",'b')] 
--                [("Friday",'l'),("you ",'k'),("be ",'x'),("Happier",'p'),("and",'a')] 'h')
-- -- ["May ","you ","be ","Happy"]
