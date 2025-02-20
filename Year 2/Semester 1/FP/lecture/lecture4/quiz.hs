f :: Int -> Int
f i | i == 0 = 1
    | i >= 0 = 2 * f (i-1)


main = print(f 3)