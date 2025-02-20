
{-
Neptune code: IVF370

Implement the Show and the Eq instance for the following record:
-}

data Band = Band {bandName :: String, followers :: Int, members :: Int}

band1 = Band {bandName = "TV Girl", followers = 2000, members = 4}
band2 = Band {bandName = "Tame impala", followers = 4500, members = 1}
band3 = Band {bandName = "Mac DeMarco", followers = 4500, members = 1}
band4 = Band {bandName = "MF DOOM", followers = 1000, members = 1}

{-
A band is equal to another if they have the same amount of memebers and the same amount of follower
-}

instance Eq Band where
    ban1 == ban2 = members ban1 == members ban2 && followers ban1 == followers ban2

-- main = print $ band1 == band2
-- main = print $ band2 == band3

{-
Implement show for the band, show should print out the following:
 "Name: " + bandName + ", " + followers + ", " + members
-}

instance Show Band where
    show (Band n1 f1 m1) = "Name: " ++ n1 ++ ", Followers "  ++ show f1 ++ ", members " ++ show m1 

-- main = print $ show band1