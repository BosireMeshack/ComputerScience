db3 :: Int -> Int
db3 0 = 0
db3 n
   |n < 10 && (n `mod` 3 == 0) = 1
   |n < 10 = 0
   |n `mod` 10 == 0 = db3 (n `div` 10)
   |(n `mod` 10) `mod`  3 == 0 = 1 + db3 (n `div` 10)
   |otherwise = db3 (n `div` 10)

main = print(db3 992)

