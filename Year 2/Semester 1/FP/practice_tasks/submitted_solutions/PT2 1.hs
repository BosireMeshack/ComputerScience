{- Progress Task -}

{- Your neptun code : IVF370 -}

{-
    Write a function minDigit that takes an integer `n` and returns the minimum digit in that number.
    You are guaranteed that `n` is a positive number.
    You can use the `min` function which returns the minimum of two numbers.
        e.g. min 3 4 -> 3
    
    For example:
        minDigit 123 -> 1, because 1 is the minimum digit in the number 123
        minDigit 2024 -> 0, because 0 is the minimum digit in the number 2024
        minDigit 97596 -> 5, because 5 is the minimum digit in the number 97596
        minDigit 0 -> 0, because 0 is the minimum digit in the number 0
-}





minDigit :: Int -> Int
minDigit 0 = 0
minDigit x 
        |x < 10 = x
        | a < x `mod` (x `div` 10) = a
        | otherwise = minDigit (x `div` 10)
     where a = x `mod` 10


{- Test Cases -}
-- main = print (minDigit 123)    -- 1
-- main = print (minDigit 2024)    -- 0
-- main = print (minDigit 97596)    -- 5
-- main = print (minDigit 0)    -- 0