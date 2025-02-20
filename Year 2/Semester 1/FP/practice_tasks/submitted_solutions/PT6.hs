{- IVF370
Find All Pairs from two lists such that:
- The first element is from the first list and the second element is from the second list.
- The first element is less than the second element.
- the two numbers are coprime. (i.e., their greatest common divisor is 1)
- The sum of the two numbers is a prime number.
-}
f :: [Int] -> [Int] -> [(Int, Int)]
f ls1 ls2 = [(x,y) | x <- ls1, y <- ls2, x<y && gcd x y == 1 && isPrime (x+y)]

isPrime :: Int -> Bool
isPrime n = length [x | x <- [1..n], n `mod` x == 0 ] == 2

-- Test case
-- main = print $ f [10,5,3,2,4] [1,3,4,100,2] -- [(3,4),(3,100),(2,3)]
-- main = print $ f [1..10] [1..10] -- [(1,2),(1,4),(1,6),(1,10),(2,3),(2,5),(2,9),(3,4),(3,8),(3,10),(4,7),(4,9),(5,6),(5,8),(6,7),(7,10),(8,9),(9,10)]
-- main = print $ f [1,2,3,4,5] [6,7,8,9,10] --[(1,6),(1,10),(2,9),(3,8),(3,10),(4,7),(4,9),(5,6),(5,8)]