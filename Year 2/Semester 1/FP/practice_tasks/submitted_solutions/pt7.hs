{-
IVF370

-}

-- Define two data types:
-- 1. Team with fields for name (String) and teamID (Int).
-- 2. Player with fields for name (String), score (Int), and team (Team).
-- Create examples:
-- - Team: Name "Red Warriors", ID 401
-- - Player: Name "Alice", Score 50, Team is Red Warriors.
-- Hint: Use `deriving (Show)` to make your records printable.
--
-- Write a function to transfer a player to a new team if their score exceeds a specific threshold.
-- The threshold and new team are passed as the 1st and 2nd arguments respectively.
 
data Team = Team {
    name:: String,
    teamID :: Int
} deriving (Show)

data Player = Player {
    pname:: String,
    score :: Int,
    team :: Team
} deriving (Show)

-- data Team = {name = "Red Warriors", teamID = 401}
-- data Player =
 
transferPlayers :: Int -> Team -> [Player] -> [Player]
transferPlayers goals t [] = []
transferPlayers goals t (x:xs)
    | score x > goals = x {team = t} : transferPlayers goals t xs
    | otherwise = x : transferPlayers goals t xs


 
-- main = print $ transferPlayers 50 (Team "Elite Warriors" 999) [Player "Alice" 60 (Team "Red Warriors" 401), Player "Bob" 40 (Team "Blue Knights" 402)] -- [Player {playerName = "Alice", playerScore = 60, playerTeam = Team {teamName = "Elite Warriors", teamID = 999}},Player {playerName = "Bob", playerScore = 40, playerTeam = Team {teamName = "Blue Knights", teamID = 402}}]
-- main = print $ transferPlayers 70 (Team "Champions" 888) [Player "Charlie" 75 (Team "Green Rangers" 403)] -- [Player {playerName = "Charlie", playerScore = 75, playerTeam = Team {teamName = "Champions", teamID = 888}}]
-- main = print $ transferPlayers 100 (Team "Legends" 777) [] -- []