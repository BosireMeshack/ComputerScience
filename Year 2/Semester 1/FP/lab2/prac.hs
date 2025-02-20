-- Factorial of non-negative numbers
fac:: Int -> Int 
fac n 
   | n < 0 = error "Number must be positve"
   | n == 0 = 1
--    | n == 1 = 1
   | otherwise = n * fac(n - 1)

-- main = print(fac 5) -- 120
-- main = print(fac (-1)) -- "Number must be positive"

-- fib :: Int -> Int 
-- fib n
--     | n < 0 = error "Number must be non-negative"
--     | n == 0 = 0
--     | n == 1 = 1
--     | otherwise = fib(n - 1) + fib(n - 2)

-- main = print(fib 6) -- 8


-- Palindrome

-- isPalindrome :: String -> Bool 
-- isPalindrome str = str == reverse str 

-- main = print(isPalindrome "madam") -- True
-- main = print(isPalindrome "rare") --False

-- GCD using the Euclidean Algorithm

mygcd :: Int -> Int -> Int
mygcd a b
    | b == 0 = a
    | otherwise = mygcd b (a`mod` b)


-- mygcd a b = mygcd b (a `mod` b)

main = print(mygcd 12 20)
