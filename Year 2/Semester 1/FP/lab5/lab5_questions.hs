-- main :: IO ()

---- Recursion, List

-- 1. Multiply the digits of a number e.g. for 123 is 6.

prodDigits :: Int -> Int
prodDigits 1 = 1
prodDigits x 
    | x < 10 = x
    | otherwise = x `mod` 10 * prodDigits (x `div` 10)

-- main = print(prodDigits 503) -- 0
-- main = print(prodDigits 54213) -- 120


-- 2. Sum numbers from 12..N in a recursive function, where N is positive.

fn :: Int -> Int
fn 12 = 12
fn x
    | x < 12 = error "N can not be zero or negative or less then 11"
    | otherwise = x + fn (x-1)
-- main = print(fn (-10)) -- N can not be zero or negative or less then 11
-- main = print(fn 14)  -- 39


-- 3. Compute the sum 1+ 1*2 + 1*2*3+ 1*2*3*4+ 1*2*3*4*5+ ...+1*2*3*...*n 
-- where n is a positive number.

-- fact :: Int -> Int
-- fact 0 = 1
-- fact n = n * fact (n-1)


sump :: Int -> Int
sump 0 = 0
sump n = product[1..n] + sump (n-1)


-- main = print(sump 5) -- 153

----Higher order function


-- 4. Cut a list in 4 parts quarter, middle, third quarter. 
-- E.g. cut [1..10] -> [[1,2], [3,4,5], [6,7], [8,9,10]]

cut :: [Int] -> [[Int]]
cut x = [take quarter x, take (middle - quarter) (drop quarter x), take (tquarter - middle) (drop middle x), drop tquarter x]

    where quarter = (length x) `div` 4 
          middle = (length x)  `div` 2
          tquarter = 3 * ((length x) `div` 4)


-- main = print (cut [1..10]) -- [[1,2],[3,4,5],[6,7],[8,9,10]]
-- main = print(cut [1..11]) -- [[1,2],[3,4,5],[6,7,8],[9,10,11]]
-- main = print(cut []) --[[],[],[],[]]
-- main = print(cut [21]) --[[],[],[],[21]]
--main = print(cut [1..21]) -- [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20,21]]


-- 5. Extract the third element of a non-empty list. 

m2 :: [Int] -> Int
m2 [] = error "Your list is empty"
m2 x 
   | (length x) < 3 = error "length less than 3"
   | otherwise = x !! 2
-- main = print(m2 [1..5]) -- 3
-- main = print(m2 [1..4]) -- 3
-- main = print(m2 [1]) -- length less than 3 
-- main = print(m2 []) -- your list is empty


-- 6. Triple every element of a list

f1 :: [Int] -> [Int]
f1 list = map (\x -> x*3) list


-- main = print(f1 [1,5,3,1,6])  -- [3,15,9,3,18]


-- 7. Compute the square of positives and change the sign of negatives.

f2 :: [Int] -> [Int]
f2 [] = []
f2 (x :xs)
    |x < 0 = abs x : f2 xs 
    | otherwise = x^2 : f2 xs


-- main = print(f2 [1, 2, 0, -2, 3, -4]) -- [1,4,0,2,9,4]

---- Higher order functions

-- Earlier exemples rewritten with higher order functions: map, foldr, filter, takeWhile. 
-- Operations with lists: write functions for the followings


-- 1.Keep the head of every sublist (assume sublists are not empty).
-- e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [1, 3, 5]
heads :: [[Int]] -> [Int]
heads ls = map head ls


-- main = print(heads [[1, 2, 3], [3, 4], [5, 7, 8, 9]]) -- [1,3,5]

-- 2. Keep the tails of a list.
-- e.g. [[1, 2, 3], [3, 4], [5, 7, 8, 9]] -> [[2, 3], [4], [7, 8, 9]] 
tails :: [[Int]] -> [[Int]]
tails ls = map tail ls


-- main = print(tails [[1, 2, 3], [3, 4], [5, 7, 8, 9]]) -- [[2, 3], [4], [7, 8, 9]] 


-- 3. Add 100 to the numbers of a list.
--g :: Int -> Int


g :: Int -> Int  
g x = x + 100


add100 :: [Int] -> [Int]
add100 x = map g x


--add100' :: [Int] -> [Int]


-- main = print(add100 [1..8]) -- [101,102,103,104,105,106,107,108]
--main = print(add100' [1..8]) -- [101,102,103,104,105,106,107,108]


-- 4. Triple the elements of a list.
triples :: [Int] -> [Int]
triples x = map (*3) x


-- main = print(triples [1..5]) -- [3,6,9,12,15]

--main = print(triples2 [1..5]) -- [3,6,9,12,15]


-- 5. Check if the numbers of a list are odd.
isoddnrs :: [Int] -> [Bool]
isoddnrs x = map(\x -> x `mod` 2 ==1) x
 

isoddnrs2 :: [Int] -> [Bool]
isoddnrs2 x = map(\x -> odd x) x


-- main = print(isoddnrs [1..5]) -- [True,False,True,False,True]
-- main = print(isoddnrs2 [1..5]) -- [True,False,True,False,True]


-- 6. Check if the numbers of a list are multiple of 10.
ismul :: Int -> Bool 
ismul x 
    | x `mod` 10 == 0 = True 
    |otherwise = False


ismult10 :: [Int] -> [Bool]
ismult10 x = map ismul x


-- main = print(ismult10 [1..20])
--[False,False,False,False,False,False,False,False,False,True,False,False,False,False,False,False,False,False,False,True]


-- 7. Collect in a list the last digits of the numbers of a list.
lastdigits :: [Int] -> [Int]
lastdigits x = map(\x -> x `mod` 10) x


-- main = print(lastdigits [1..35])
-- [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5]


-- 8. Compute the cube of the numbers of a list.
cubes :: [Int] -> [Int]
cubes x = map(\x -> x^3)x


-- main = print(cubes [1..10]) -- [1,8,27,64,125,216,343,512,729,1000]
--main = print(cubes []) -- []

cb :: Int -> Int
cb x = x^3

cubes2 :: [Int] -> [Int]
cubes2 x = map cb x


-- main = print(cubes2 [1..10]) -- [1,8,27,64,125,216,343,512,729,1000]

--cubes3 :: [Int] -> [Int]


--main = print(cubes3 [1..10]) -- [1,8,27,64,125,216,343,512,729,1000]


-- do not confuse cubes of number with powers of 3 with !!!
po3 :: Int -> Int
po3 x = 3 ^ x
    
powersof3 :: [Int] -> [Int]
powersof3 x = map po3 x


-- main = print(powersof3 [1..10]) -- [3,9,27,81,243,729,2187,6561,19683,59049]


--powersof33 :: [Int] -> [Int]


--main = print(powersof33 [1..10]) --[3,9,27,81,243,729,2187,6561,19683,59049]


-- 9. Reverse every sublist of a list.

rev :: [Int] -> [Int]
rev [] = []
rev x = reverse x


revsub :: [[Int]] ->  [[Int]]
revsub [] = []
revsub x = map rev x


-- main = print(revsub [[1,2,3],[5,6],[],[7,8,9,10]]) -- [[3,2,1],[6,5],[],[10,9,8,7]]



-- 10. Keep the last elements of the sublists of a list in one list 
-- (assume the sublists are not empty).
-- E.g. [[1,2,3],[5,6],[1],[7,8,9,10]] -> [3,6,1,10]

lst:: [Int] -> Int 
lst x = last x

lasts :: [[Int]] -> [Int]
lasts x = map lst x 



-- main = print(lasts [[1,2,3],[5,6],[1],[7,8,9,10]]) -- [3,6,1,10]



-- 11. Delete the last element of each sublist of a list.
-- E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] -> [[1,2],[5],[],[7,8,9]]
lsdel :: [Int] -> [Int]
lsdel x = init x


lastdel :: [[Int]] -> [[Int]]
lastdel x = map lsdel x


-- main = print(lastdel [[1,2,3],[5,6],[7,8,9,10]]) -- [[1,2],[5],[7,8,9]]


-- 12. Instert 0 in front of every sublist of a list.
-- E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is 
-- [[0,1,2,3],[0,5,6],[0],[0,7,8,9,10]]

i0 :: [Int] -> [Int]
i0 x = [0] ++ x

ins0 :: [[Int]] -> [[Int]]
ins0 x = map i0 x


-- main = print(ins0 [[1,2,3],[5,6],[],[7,8,9,10]]) -- [[0,1,2,3],[0,5,6],[0],[0,7,8,9,10]]

i0' :: [Int] -> [Int]
i0' x = x ++ [0]

-- insert 0 at the end!!
ins0' :: [[Int]] -> [[Int]]
ins0' x =  map i0' x

-- main = print(ins0' [[1,2,3],[5,6],[],[7,8,9,10]]) -- [[1,2,3,0],[5,6,0],[0],[7,8,9,10,0]]


-- 13. Compute the squares of the elements of a list using map.
-- [1, 2, 3] -> [1, 4, 9]
--sq :: Int -> Int




sqrs :: [Int] -> [Int]
sqrs x = map (^2) x


-- main = print(sqrs [1..10]) -- [1,4,9,16,25,36,49,64,81,100]


-- 14. Same as 13. with lambda expression.
sqrs_lambda :: [Int] -> [Int]
sqrs_lambda x = map (\x -> x^2) x


-- main = print(sqrs_lambda [1..10]) -- [1,4,9,16,25,36,49,64,81,100]


-- review foldr
--main = print(foldr (+) 1 [4,5,6])  --(4 + (5 + (6 + 1))) 16


-- 15.  Add the numbers from 1..N (N positive and not 0) using foldr.
addn :: Int -> Int
addn n = foldr (+) 0 [1..n]


-- main = print(addn 5) -- 15
-- main = print(addn 0) -- 0
-- main = print(addn (-2))  -- 0
-- main = print(addn 10) --55


-- 16. Compute the product of the elements of a list using foldr.
prodf :: [Int] -> Int
prodf x = foldr (*) 1 x


--prodf2 :: [Int] -> Int


-- main = print(prodf [1,5,2,4]) -- 40
--main = print(prodf2 [1,5,2,4]) -- 40


-- 17. Compute 1*1 + 2*2 + ... + n*n  for n positive using map and foldr.
sqr ::Int -> [Int]
sqr a = map(\x -> x*x) [1..a]



sumsqr :: Int -> Int
sumsqr x = foldr (+) 0 (sqr x)


-- creates the [1..5] list
-- then maps x*x to every element from the list [1,4,9,16,25]
-- then sums up using foldr 55

-- main = print(sumsqr 5) -- 55
-- main = print(sumsqr 0) -- 0 -- the list is [1..0] which is empty, then foldr has as result 0
-- main = print(sumsqr (-4)) -- 0 -- same here


-- 18. Write a function for the square of every element of a list and sublists.
-- [[1,2],[3,4,5,6],[7,8]]  ->  [[1,4],[9,16,25,36],[49,64]]  
-- hint: map in map
fa :: [Int]-> [Int]
fa x = map(^2) x

-- main = print(fa [1..5]) --[1,4,9,16,25]

f4 :: [[Int]] -> [[Int]]
f4 [] = []
f4 (x:xs) = fa x : f4 xs


f4' :: [[Int]] -> [[Int]]
f4' x = map (map (^2)) x


-- main = print(f4 [[1,2],[3,4,5,6],[7,8]]) -- [[1,4],[9,16,25,36],[49,64]]
-- main = print(f4' [[1,2],[3,4,5,6],[7,8]]) -- [[1,4],[9,16,25,36],[49,64]]


-- 19. Replicate n>0 times the element of a list e.g. n=3 [3..6] ->
-- [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]
rep :: Int -> Int -> [Int]
rep a b = replicate a b
-- main = print( map(\x -> replicate 3 x) [3..6] )

-- main = print(rep 3 7) -- [7,7,7]

--rep1 :: Int -> Int -> [Int]


--main = print(rep1 3 7) -- [7,7,7] 

-- f5 :: Int -> [Int] -> [[Int]]
-- f5 a b = map(\x -> replicate a x) b


-- main = print(f5 3 [3..6]) -- [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]

--f51 :: Int -> [Int] -> [[Int]]


--main = print(f5 3 [3..6]) -- [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]

--f52 :: Int -> [Int] -> [[Int]]


--main = print(f51 3 [3..6]) -- [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]


-- review filter
-- 20. Compute the double of the positive elements of a list [1, 2, -2, 3, -4] -> [2, 4, 6]
-- hints: first filter it then use map 


f20 :: [Int] -> [Int]
f20 x = map(\x-> x*2) (filter (>0) x)

-- main = print(f20 [1, 2, (-2), 3, (-4)]) -- [2, 4, 6]

--f20' :: [Int] -> [Int]


--main = print(f20' [1, 2, (-2), 3, (-4)]) -- [2, 4, 6]


-- 21. Filter the elements smaller then n, e.g. n=3 [1,5,3,2,1,6,4,3,2,1] -> [1,2,1,2,1]
f7 :: Int -> [Int] -> [Int]
f7 a b = filter (<a) b

-- main = print(f7 3 [1,5,3,2,1,6,4,3,2,1])  -- [1,2,1,2,1]


-- 22. Using notempty, eliminate the empty lists from a list of lists. 
-- [[1,2,3],[],[3,4,5],[2,2],[],[],[]] -> [[1,2,3], [3,4,5], [2,2]]

notempty :: [Int] -> Bool
notempty x = not (x == [])

f8 :: [[Int]] -> [[Int]]
f8 x = filter notempty x


-- main = print(f8 [[1,2,3],[],[3,4,5],[2,2],[],[],[]]) -- [[1,2,3],[3,4,5],[2,2]]


-- 23. Compute the sum of the sublists using foldr [[1,2,3], [3,4,5], [2,2]] -> [6, 12, 4]
f9 :: [[Int]] -> [Int]
f9 [] = []
f9 (x:xs) = foldr (+) 0 x : f9 xs


-- main = print(f9 [[1,2,3], [3,4,5], [2,2]]) -- [6,12,4]


-- 24. Write a function that keeps the integers of a list up to the first 0 encounterred 
-- and then divides by 2 every element [1, 2, -2, 3, 0, -4] -> [0, 1, -1, 1]
-- hints: use takeWhile then map
f3 :: [Int] -> [Int]
f3 a = map (\x -> (x `div` 2)) t1

    where t1 = takeWhile (/=0) a


-- main = print(f3 [1, 2, (-2), 3, 0, (-4)]) -- [0, 1, -1, 1]


-- 25. Insert the sum of elements of the sublist as last element in every sublist of a list.
insLast :: [Int] -> [Int] 
insLast a = a ++ [sum(a)]


insSum :: [[Int]] -> [[Int]]
insSum x = map (\x -> insLast x) x


--insSum2 :: [[Int]] -> [[Int]]


-- main = print(insSum [[1,2], [3,4,5], [6,5,9,7], [], [8]]) -- [[1,2,3],[3,4,5,12],[6,5,9,7,27],[0],[8,8]]
--main = print(insSum2 [[1,2], [3,4,5], [6,5,9,7], [], [8]]) -- [[1,2,3],[3,4,5,12],[6,5,9,7,27],[0],[8,8]]


-- 26. Write a function that checks if each elements in the list appear even times.
-- E.g. checkEven [1,1,2,2,2,2,3,5,3,5] = True  
--checkAux :: [Int] -> Int -> Bool


-- checkEven :: [Int] -> Bool
-- checkEven x = map (\x -> even x) x



--main = print(checkEven [1,1,2,2,2,2,3,5,3,5]) -- True
--main = print(checkEven [1,1,2,2,1]) -- False
--main = print(checkEven []) -- True


-- 27. Insert x as second element in every sublist of a list.
-- if the sublist was empty then x will be the only element in the new sublist. 
-- [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10 -> [[1,10,2], [3,10,4,5], [6,10,5,9,7], [10], [8,10]]
insAux :: Int -> [Int]  -> [Int]
insAux x [] = [x]
insAux x n = [head n] ++ [x] ++ tail n

insertAtTwo :: [[Int]] -> Int -> [[Int]]
insertAtTwo a b = map (insAux b) a


-- main = print(insertAtTwo [[1,2], [3,4,5], [6,5,9,7], [], [8]] 10)
-- [[1,10,2],[3,10,4,5],[6,10,5,9,7],[10],[8,10]]


-- 28. Given a list of lists, for each list, extract the first, middle and last element.



extract3 :: [[Int]] -> [[Int]]
extract3 list = map helperMid list

helperMid :: [Int] -> [Int]
helperMid x = [head x] ++ [x !! (length x `div` 2)] ++ [last x]


-- main = print(extract3 [[1..9], [2..6], [3..11], [1..10]]) -- [[1,5,9],[2,4,6],[3,7,11],[1,6,10]]
--main = print(extract3 []) --[]
