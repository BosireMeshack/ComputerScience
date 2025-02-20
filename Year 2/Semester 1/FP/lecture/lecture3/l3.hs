
-- Review of basic list functions

-- main = print([1,2,3,4,5]) -- 1,2,3,4,5
-- main = print(1:2:3:4:[])

-- main = print((1:(2:(3:(4:[])))))

head1 :: [a] -> a 
head1 n = head n

-- main = print(head1 [4,5,6,2])

l4 = 1:(2:(3:[]))

-- main = print(ne)

-- head
-- tail
-- elem
-- lastof
-- take
-- drop
-- reverse
-- or 
-- and 
-- not elem
-- init -- bool
-- length

o1 = or [True, False, True]


a1 = and [True, True, False]

el = 10 `elem` l4

ne = notElem 10 l4 

lastof [x] = x
lastof (x:y) = lastof y

-- main = print(lastof l4)

l5 = [1,2,3,4]
-- main = print(drop 2 l5) -- 3 4

-- main = print(take 2 l5) -- 1 2

reverse1 :: [Int] -> [Int]
reverse1 [] = []
reverse1(x : y) = reverse1 y ++ [x]

-- main = print(reverse l5)
i1 = init l5
-- main = print(i1) -- [1,2,3] - prints all expect the last

i2 = concat[[1,2,3,4] , [5,6,7,8]]

-- main = print(i2)

-- l1 = length i2


len [] = 0
len (_ : xs) = 1 + len xs

-- main = print(len "Gad")

-- List Logic Functions

-- notElem
-- Elem
-- or
-- and
-- null

 -- null

lo1 = null l4

-- main = print(lo1)

-- Repetitive style list functions

r1 = take 10 (repeat 10)

-- replicate - repeats a value x the number of times y

r2 = replicate 10 12

-- main = print(r1)


--cycle - repeats a values of a list infinitely forming a circle

c1 = take 50 (cycle [22, 23, 24])

-- main = print(c1)

-- Functions on Strings

-- lines -- splits a sentence into a list of words at the \n string terminating character

line7 =  lines "one\ntwo\n"

-- main = print(line7)


-- unlines  -- appends the \n to each word and then concatenates the word

line8 = unlines["My", "Name", "is", "Meshack"]
-- main = print(line8)


word1 = words "Come on, United Won!"

-- main = print(word1)

word2 = unwords word1 -- string to list

-- main = print(word2) -- words to string


-- Convert to strings

-- Show converts other data types to strings

bs :: Float
bs = 3.2453

as :: Integer 
as  = 5

fs :: Bool
fs = True

ss :: String
ss = "Morara"

-- main = print( show bs ++ " "++ show as ++ " "++ show fs ++ " " ++ show ss)

-- High order functions

-- map applies a function f to every element of a list

-- map f [x1, x2, x3, .., xn] = [f x1, f x2, f x3, .. , f xn]


fm :: Int -> Float
fm x = fromIntegral x / 2

-- main = print(map fm [2, 4, 6, 7])

-- lambda expressions
-- a function without a name \x -> x*2
-- \ symbolic way of writing a lambda letter

la = (\x -> x + 1) 5

la1 = (\x y -> x + y) 2 7

-- The above can be written in "pointless free style"
pl = map (+10) [1,2, 4, 5]
pl1 = map id [1, 2, 4, 6]
main = print(pl1)

