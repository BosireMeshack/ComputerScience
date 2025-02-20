rl :: Int -> [Int]
rl x = replicate x x

fn:: [Int] -> [[Int]]
fn [] = []
fn (x:xs) = rl x : fn xs

fn1 = map rl l1

l1 = [2,4,5]

fn2 = (\x -> replicate x x) 4

-- main = print(fn2)

--filter

-- recursive mapping
l5 = [1..10]
-- filter1 :: (a -> Bool) -> [a] -> [b]
-- filter1 p [] = []
-- filter1 p (x : xs)
--     | p x = x : filter1 p xs
--     | otherwise = filter1 p xs

fl :: Int -> Bool
fl x = x `rem` 2 /= 0

-- main =  print (filter1 fl l5)

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 p [] = []
filter1 p (x : xs)
  | p x = x : filter1 p xs
  | otherwise = filter1 p xs

takeWhile1 :: (a -> Bool) -> [a] -> [a]
takeWhile1 p [] = []
takeWhile1 p (x : xs)
  | p x = x : takeWhile1 p xs
  | otherwise = []

dropWhile1 :: (a -> Bool) -> [a] -> [a]
dropWhile1 p [] = []
dropWhile1 p (x : xs)
    | p x = dropWhile1 p xs
    | otherwise = (x:xs)

-- main = print(dropWhile1 fl l5)

-- foldl

l4 = foldl (+) 0 [1, 2, 4]
-- main = print( l4 )

l6 = foldl (\total x -> total + x) 5 [10, 20, 30]

-- it will take your hardwork to make money
-- it will take discipline to keep it
-- it will take wisdom to multiply it.

main = print(l6)



