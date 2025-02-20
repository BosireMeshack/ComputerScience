f [] = []
f (x:xs) = f as ++ [x] ++ f bs
   where 
      as = [a | a <- xs, a <= x]
      bs =  [b | b <- xs, b > x]

