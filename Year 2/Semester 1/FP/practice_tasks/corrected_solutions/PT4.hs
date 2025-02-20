{-
Write a function makeNegative that takes two lists.
Makes all numbers of the first given list negative.
Then eliminate these values from the second list. 
0 stays 0.
-}

negated :: [Int] -> [Int]
negated [] = []
negated (x:xs) 
    | x > 0 = -(x) : negated xs
    | otherwise = x : negated xs
     
-- main = print(negated [1, -2, 4])



makeNegative :: [Int] -> [Int] -> [Int]
makeNegative lst1 lst2 = filter (`notElem` negated lst1) lst2


-- main :: IO ()
-- main = print (makeNegative [0] [0]) -- []
-- main = print (makeNegative [] []) -- []
-- main = print (makeNegative [1,2,3] [-1,3,2,-3,20,1])  -- [3,2,20,1]
-- main = print (makeNegative [1,-2,4,5,-3,-5] [1,2,3,-1,-2,3,-10,5,8,-6,-4,4]) -- [1,2,3,3,-10,5,8,-6,4]
-- main = print (makeNegative [1..5] [1..5]) -- [1,2,3,4,5]