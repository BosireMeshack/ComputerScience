


{-
Given a list of tuples of two Employees, decide which employee out of the two should be fired.
The way we decide which employee should be fired is the follwing:
1. If the employeeID is a prime number, we instantly fire that employee.
2. If not, we check which employee has more work hours out of the two, fire the one that has less than the other
3. If they have the same amount of work hours, we simply fire both

The way you should handle firing employees is the following:
Given two Employees, we want to fire Employee2 by replacing his employeeID with -1 
 (Employee1, Employee2) -> (employeeID Employee1, -1)
-}

data Employee = Employee {
    employeeID :: Int,
    workHours :: Int,
    programmer :: Bool
} deriving (Show)

lazyWorker = Employee {employeeID = 56, workHours = 38, programmer = False}
decentWorker = Employee {employeeID = 362, workHours = 50, programmer = True}
primeWorker = Employee {employeeID = 7, workHours = 80, programmer = False}
goodWorker = Employee {employeeID = 120, workHours = 50, programmer = True}

isPrime :: Int -> Bool
isPrime n = length [x | x <- [1..n], n `rem` x == 0] == 2

retainedEmp :: [(Employee, Employee)] -> [(Int, Int)]
retainedEmp [] = []
retainedEmp (x:xs)
    | workHours (fst x) < workHours (snd x)  = (-1, employeeID (snd x)) : retainedEmp xs
    | workHours (snd x) < workHours (fst x) = ( employeeID (fst x), -1) : retainedEmp xs
    | otherwise = (-1,-1):retainedEmp xs

firingMachine :: [(Employee, Employee)] -> [(Int, Int)]
firingMachine [] = []
firingMachine (x:xs)
    | isPrime (employeeID (fst x)) = (-1, employeeID (snd x)) : firingMachine xs
    | isPrime (employeeID (snd x)) = (employeeID (fst x),-1) : firingMachine xs
    | otherwise = retainedEmp (x:xs)
   

main = print (firingMachine [(lazyWorker, primeWorker), (decentWorker, goodWorker)]) --[(56,-1),(-1,-1)]

{-
2. 
Write a function which takes a list of points and another point.
Then return the closest point in the list to our given point, given that the point is visible.
Return the point in a triple tuple, with x and y being the first two elements, and the 
third one being the distance to the point.
-}

data Point = Point {     
    px       ::  Float
    , py       ::  Float
    , visible ::  Bool
} deriving Show

superPoint = Point {px = 5.6, py = 2.7, visible = True}
point1 = Point {px = 2.9, py = 12.4, visible = True}
point2 = Point {px = 2.3, py = -0.6, visible = True}
point3 = Point {px = 5.7, py = 2.2, visible = False}

distance :: Point -> Point -> Float
distance p1 p2 = ((px p1 - px p2)*(px p1 - px p2) + (py p1 - py p2)*(py p1 - py p2))**(0.5)
    

-- main = print $ distance point1 superPoint

findClosestP :: [Point] -> Point -> (Float, Float, Float)
findClosestP ls sp = head [(px x, py x, minDist)| x <- ls, distance x sp == minDist]
    where minDist = minimum  (map (\x -> distance x sp) visiblepoints)
          visiblepoints = filter (\x -> visible x==True) ls
-- ls1 = [point1, point2, point3]
-- mini = map (\x -> distance x superPoint) ls1     
-- main = print (mini)

-- main = print (findClosestP [point1, point2, point3] superPoint) --(2.9,12.4,10.068764)

{-
3. Create a record Person with the following fields:
ide::Int
school::String
scores::[Int]
subjects::[String]
role::String
-}
data Person = Person {
    ide::Int,
    school::String,
    scores::[Int],
    subjects::[String],
    role::String
}

{-
You are given an array of people, write a 
function that returns the list of (id,school,role) pair of people 
who are eligible for a scholarship. A person is eligible for
a scholarship if he/she is enrolled in at least 
3 subjects, and the average of his/her scores is at least 75.
-}



scholarships :: [Person] -> [(Int, String, String)]
scholarships people = [(ide person,school person, role person ) | person <- people, length (subjects person) >=3 &&  sum (scores person) `div` length (scores person) >=75]
    -- where no_sublest = length [subjects x | x <- person]
    --       averagescore = sum [ scores x | x <- person]



st1 :: Person
st1 = Person 232 "ELTE" [25, 76, 46] ["Math", "FP", "Programming"] "Student"

st2 :: Person
st2 = Person 921 "BME" [101, 101, 101] ["Teaching", "Teaching", "Teaching"] "Teacher"

st3 :: Person
st3 = Person 427 "BGE" [100, 97, 68] ["Leadership", "Finance 101", "Business"] "Student"


-- main = print (scholarships [st1, st2, st3]) --[(921,"BME","Teacher"),(427,"BGE","Student")]