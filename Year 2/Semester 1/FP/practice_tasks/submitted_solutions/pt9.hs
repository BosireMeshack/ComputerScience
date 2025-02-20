{-
Neptune: IVF370
Implement an isPrime function
-}


isPrime :: Int -> Bool
isPrime n = length [ x | x <- [1..n], n `mod` x == 0] == 2


-- main = print (isPrime 7) --True
--main = print (isPrime 11) --True
-- main = print (isPrime 1) --False
-- main = print (isPrime 4) --False 