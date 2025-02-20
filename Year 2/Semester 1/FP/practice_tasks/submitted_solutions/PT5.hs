
-- IVF370
-- Write a function which takes a list of lists of Integers and for each sublist, filter out the non-divisors of the first element of the sublist. The sublist is empty, return an empty list.
-- You must use the higher-order functions.




filterDivisors :: [[Int]] -> [[Int]]
filterDivisors = map filterByHead  


filterByHead :: [Int] -> [Int]
filterByHead [] = []  
filterByHead (h:xs) = filter (\x -> x `mod` h /= 0) (h:xs) 



-- main = print (filterDivisors [[15, 3, 5, 2], [4, 2, 3], [5, 1, 2, 3], [6, 2, 3]]) -- [[3,5],[2],[1],[2,3]]
-- main = print (filterDivisors [[]]) -- [[]]