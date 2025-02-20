
absolute :: Int -> Int
absolute x = if(x<0) then (-x) else x

main = print(absolute 10)

-- signof :: Int -> Int
-- signof x

-- recursion
-- factorial
-- power

--lists
-- list - sequence of elements of the same type
--lists are represented as linked lists

-- singleton list with one element [false], [[1, 2, 3, 4]]
-- [1, 2, 3, 4] is equivalent to 1:2:3:[]

f :: [Int]
f = [1,2,3,4,5]
--main = print f

-- f :: [a]
-- f = []

-- main = print(f::[Int]) -- []

-- Dot-dot generator
-- main = print [1.. -10]  

-- main = print [1,3 .. 15]


-- Basic functions Learn them !!
-- main = print(head [1, 2, 3, 4, 5])
-- main = print(tail [1, 2, 3, 4, 5])
-- main = print(drop 2 [1, 2, 3, 4, 5])

-- concatenating 
-- main = print([1, 2, 3] ++ [6, 7])

 -- collecting !! take
 -- walking over  - drop

 -- reverse keep the head and glue the following head before it
 -- functions run on recursive cases
 
