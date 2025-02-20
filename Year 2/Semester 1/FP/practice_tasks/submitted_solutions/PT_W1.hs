{- Progress Task 1 -}

{- Your neptun code : IVF370        -}

{- 
    Create a function divModCheck that takes two integers and returns a 
    result based on the following conditions:
    If the first number is divisible by the second, return their division (a div b).
    If the second number is divisible by the first, return their division (b div a).
    If neither number is divisible by the other, return their sum.
    If either number is zero, return "Invalid input".
    The output should be a string. 
    -}
-- main :: IO ()
divModCheck :: Int -> Int -> String
divModCheck a b 
    |a == 0 || b == 0 = "Invalid Sum"
    | a `rem` b == 0 = show (a `div` b)
    | b `rem` a == 0 = show (b `div` a)
    | otherwise = show(a + b)


-- main = print (divModCheck 8 4)     -- "2"   (a divisible by b)
-- main = print (divModCheck 5 125)    -- "25"  (b divisible by a)
-- main = print (divModCheck 7 3)     -- "10"  (neither divisible, sum)
-- main = print (divModCheck 0 7)     -- "Invalid input" (a is zero)
-- main = print (divModCheck 8 0)     -- "Invalid input" (b is zero)