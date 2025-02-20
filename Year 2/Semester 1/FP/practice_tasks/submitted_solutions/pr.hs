


d2 :: [[Int]] -> [[Int]]
d2 (xs) = map (filter (\x -> x `mod` 2 == 0)) xs

-- main = print(d2 [[1,2,3], [4,5,6]])

d3 :: [Int] -> [Int]
d3 xs = filter (\x -> x `mod` 2 == 0) xs

main = print(d3 [1,2,3] )