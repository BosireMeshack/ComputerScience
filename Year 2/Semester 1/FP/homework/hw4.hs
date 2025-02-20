{-
HOMEWORK 1
Given two lists, check whether they have the same length, 
if length is different get teh sam elngth by dropping from the longer list. 
Afterwards, raise the elements in the first list to the power of the second one.
When a list is empty, then resulted list is empty too.

Example: hw1 [1,4,3,2] [1,2,3,2] --> [1^1,4^2,3^3,2^2] --> [1,16,27,4]

Because both lists are of the same length, we are going through both and 
raising the first lists elements to the corresponding element of the second list.
-}
hwaux :: [Int] -> [Int] -> [Int]
hwaux [] [] = []
hwaux (x: xs) (y:ys) = x^y : hwaux xs ys




hw1 :: [Int] -> [Int] -> [Int]
hw1 [] [] = []
hw1 x [] = []
hw1 [] x = []
hw1 a b 
    | lena > lenb  = hwaux (take lenb a) b
    | otherwise = hwaux a (take lena b) 
    where lena = length a 
          lenb = length b


-- main = print (hw1 [] []) --[]
-- main = print (hw1 [] [1,3,4]) --[]
-- main = print (hw1 [1,4,3,2] [1,2,3,2]) --[1,16,27,4]
-- main = print (hw1 [2,3,1] [2,3,5,1]) --[8,243,1]
-- main = print (hw1 [3,1,4] [2,1]) --[1,4]


{-
HOMEWORK 2
Given a list, create a new list of lists where each element is replicated as many times as its value
and in as many sublists as its value.
ex. [1,2,3] -> [[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
-}

hw2aux :: Int -> Int -> [[Int]]
hw2aux x b
    | b > 0 = replicate x x : hw2aux x (b-1)
    | otherwise = []


-- main = print (hw2aux 2 2)


hw2 :: [Int] -> [[Int]]
hw2 [] = []
hw2 (x:xs) = hw2aux x x ++ hw2 xs


-- main = print (hw2 [1,2,3]) --[[1],[2,2],[2,2],[3,3,3],[3,3,3],[3,3,3]]
-- main = print (hw2 [1,1,1,1]) --[[1],[1],[1],[1]]
-- main = print (hw2 []) --[]
-- main = print (hw2 [1,4,2,2]) --[[1],[4,4,4,4],[4,4,4,4],[4,4,4,4],[4,4,4,4],[2,2],[2,2],[2,2],[2,2]]


{-
HOMEWORK 3
Modify the sublists whose sum of numbers is even to be odd. Do this by attaching 1 to them
at the beginning of the list. If it is [] sublist, stays as it is.
ex. [[1,2,2],     [1,2,3],     [5,4,7]]     -> [[1,2,2], [1,1,2,3], [1,5,4,7]]
sum   5 odd   6 even-gets 1  16 even-gets 1 
-}

hw3aux :: [Int] -> [Int]
hw3aux [] = []
hw3aux b 
    | even (sum b) = [1] ++ b 
    | otherwise  = b


hw3 :: [[Int]] -> [[Int]]
hw3 [] = []
hw3 (x:xs) = hw3aux x : hw3 xs

-- main = print (hw3 [[1,2,2], [1,2,3], [5,4,7]]) --[[1,2,2],[1,1,2,3],[1,5,4,7]]
-- main = print (hw3 [[], [5,3,7,2], [2]]) --[[],[5,3,7,2],[1,2]]
--main = print (hw3 [[5,3,1,7,3], [1,3,8,2], [], [2], []]) --[[5,3,1,7,3],[1,1,3,8,2],[],[1,2],[]]
--main = print (hw3 []) --[]


{-
HOMEWORK 4
Write a function recursiveListSubtraction that takes two lists of integers as input:
a source list and a list of elements to subtract. 

Example:
hw4 [1, 2, 3, 4, 5] [2, 4] -- [1, 3, 5]

The function iterates through the source list [1, 2, 3, 4, 5] and 
deletes the elements [2, 4]. It includes elements that are not 
in the second list, resulting in [1, 3, 5].
I.e. creates the difference of the two lists.
-}

hw4 :: [Int] -> [Int] -> [Int]
hw4 [] [] = []
hw4 [] x = []
hw4 x [] = x
hw4 (x:xs) (y:ys)
    | elem x (y:ys) = hw4 xs (y:ys)
    | otherwise = x : hw4 xs (y:ys)
-- main = print (hw4 [] []) --[]
-- main = print (hw4 [1,2,3,4,5] []) --[1,2,3,4,5]
-- main = print (hw4 [1,7,9,3,4] [1,4,9]) --[7,3]
-- main = print (hw4 [] [1,6,7,4,2])  --[]


{-
HOMEWORK 5
Write your own remove duplicates function, which removes all 
the duplicates from a list and then
replicate each number the amount of times it appears.
ex. hw5 [1,1,2,1,3,2,3] -> [1,2,3] -> [1,2,2,3,3,3]
-}

-- hw5aux :: Int -> [Int]
-- hw5aux 0 = []
-- hw5aux b 
--     | a > 0 = replicate b [b] : hw5aux (a-1)
--     | otherwise = hw5aux b
--     where a = b

-- main = print(hw5aux 2)

removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (x:xs)
    | x `elem` xs = removeDuplicates xs
    | otherwise = x : removeDuplicates xs

countOfOccurences :: Int -> [Int] -> Int
countOfOccurences _ [] = 0
countOfOccurences x (y:xs)
    | x == y = 1 + countOfOccurences x xs
    | otherwise = countOfOccurences x xs
 

hw5 :: [Int] -> [Int]
hw5 [] = []
hw5 xs = concatMap (\x -> replicate x x) (removeDuplicates xs)
    


-- main = print (hw5 [1,1,2,1,3,2,3]) --[1,2,2,3,3,3]
-- main = print (hw5 []) --[]
-- main = print (hw5 [1,2,3,4,1,3]) --[2,2,4,4,4,4,1,3,3,3]
-- main = print (hw5 [1,1,1,1,1,1]) --[1]


{-
HOMEWORK 6
Write your own take and reverse function without using any built in functions, 
then demonstrate them on a list.
Apply your take function first and then your reverse function.
-}

--hw6 :: [Int] -> Int -> [Int]

--main = print (hw6 [] 2) --[]
--main = print (hw6 [1,2,1,3,2,1] 3) --[1,2,1]
--main = print (hw6 [1..5] 2) --[2,1]
--main = print (hw6 [5,6,7,8,5] 0) --[]

take1 :: [Int] -> Int -> [Int]
take1 [] 0 = []
take1 [] b = []
take1 (x:xs) b
    |b > 0 = x : take1 xs (b-1) 
    | otherwise = []

-- main = print(take1 [1,2,3,4] 3)

reverse1 :: [Int] -> Int -> [Int]
reverse1 [] c = []
reverse1 (x:xs) c 
    | c > 0 = reverse1 xs (c-1) ++ [x]
    | otherwise = []

main = print(reverse1 [5,6,7,8,5] 0 )
