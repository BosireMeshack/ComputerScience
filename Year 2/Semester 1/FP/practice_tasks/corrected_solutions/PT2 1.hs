minDigit :: Int -> Int
minDigit 0 = 0
minDigit x 
    | x < 10 = x
    | otherwise = min (x `mod` 10) (minDigit (x`div`10))

main = print(minDigit 224)