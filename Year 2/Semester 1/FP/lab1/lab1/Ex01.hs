-- module Ex01 where
{-
    When you want to test your function:
        1. open your terminal (right click the folder name in the left bar, then click "open in integrated terminal")
        2. run the compiler
            2.1 the first way to run you test :
                uncomment the "main" line under the function then 
                input "runghc <filename>" to the terminal, for example : "runghc Ex01_.hs"
            2.2 the second way is using ghci
                input ":l <filename>" to load your file
                then test any functions you want to try. like f 2, or main
                2.2.1
                    GHCi Reminder:
                    - :l <file> - loads the file into GHCi
                    - :r - reloads loaded files
                    - :bro <module> - short for browse, displays the contents of a module
                    - :t <expression> - tells the type of an expression
                    - :i <name> - displays the information of a fv/type/etc (binding strength, where it is defined, etc.)
                    - :set <flag> - turns on a flag (eg -Wincomplete-patterns)
                    - :q - exit
-}

-- Double an integer
f :: Int -> Int
f x = x * 2

-- Testing the function with different inputs
-- main = print (f3 84)        -- 84
-- main = print (f 100)       -- 200

-- Triple an integer
f3 :: Int -> Int
f3 x = x*3

-- main = print (f3 5)        -- 15

-- Half a real number
gr :: Double -> Double
gr x = x / 2.0

-- main = print (gr 5.0)      -- 2.5

-- Function to add two integers
add2 :: Int -> Int -> Int
add2 a b = a + b

-- main = print (add2 4 5)    -- 9
-- main = print (add2 5 66666666) -- 66666671

-- Sum 3 int and multiply by 2.
add3andmul2 :: Int -> Int -> Int -> Int
add3andmul2 x y z = x + y + z

-- main = print (add3andmul2 1 2 3) -- 12


-- Negate a Boolean
b :: Bool -> Bool
b x = not x

-- main = print(b False)

-- b True  -- False
-- b False -- True

-- Negate the negation of a Boolean
b2 :: Bool -> Bool
b2 x = not(not x)

-- main = print (b2 True)      -- True
-- main = print (b2 False)     -- False

-- Concatenation of three strings
st3 :: String -> String -> String -> String
st3 a b c = a ++ b ++ c
-- main = print (st3 "Hello" " World!" " from FP class") -- "Hello World! from FP class"


-- Function that returns the same character
cid :: Char -> Char
cid x = x
-- main = print (cid 'a')    -- 'a'

-- Logical AND (&&)
logicalAnd :: Bool -> Bool -> Bool
logicalAnd x y = x && y
-- main = print (logicalAnd False True)  -- Output: False

-- Logical OR (||) 

logicalOr :: Bool -> Bool -> Bool
logicalOr x y = x || y

-- main = print (logicalOr True False) -- True

----------------------------------------------------------------------

-- Ming climbs from height k1 to height m1, then x more meters. Calculate the total distance he covered.
m1 :: Int
m1 = 8848
k2 :: Int
k2 = 8611

dist :: Int -> Int
dist x = (m1 - k2) + x
-- main = print (dist 30)

-- Write a function that squares its argument.
sq :: Int -> Int
sq x = x * x 

-- main = print (sq 8)       -- 64
-- main = print (sq 0)       -- 0


-- Write a function to compute a to the power of 3 plus b to the power of 3 plus c multiplied by d.
expression :: Int -> Int -> Int -> Int -> Int
expression a b c d = a ^ 3 + b ^ 3 + (c * d)

-- main = print (expression 1 2 3 4) -- 21
-- main = print (expression (-1) (-2) (-3) (-4)) -- 3

{- 
    Granpa went shopping with 20000 Ft.
    He bought m milks each 300, c croissants 400 each, and f flower for 2000.
    How much money left after shopping? 
-}

granpa :: Int -> Int -> Int -> Int -> Int
granpa original m c f = original - ((m * 300) + (c * 400) + (f * 2000))
-- main = print (granpa 20000 5 10 1) -- 12500
-- main = print (granpa 20000 10 5 2) -- 11000

{- 
Basic Types
                Bool    False | True
                Char    '~','c', ...
                Integer 123456, ...
                Float/Double  0.0000001, ...
                String "Hello World!"

    ps: About number, see: http://lambda.inf.elte.hu/Syntax_en.xml#exercise
-}