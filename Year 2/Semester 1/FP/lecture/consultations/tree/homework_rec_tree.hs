module Main where

import Data.List (sort)

-- main :: IO ()

data Tree a = Node a (Tree a) (Tree a) | Leaf
    deriving (Show)

mapTree:: (a -> b)->Tree a -> Tree b
mapTree f Leaf = Leaf
mapTree f (Node x leftC rightC) = Node (f x) (mapTree f leftC) (mapTree f rightC)

-- main= print(mapTree chr tree)

data BST a = BSTNode a (BST a) (BST a)
            | BSTLeaf
            deriving (Show)
treet :: BST Int
treet = BSTNode 5 (BSTNode 5 (BSTNode 1 BSTLeaf BSTLeaf))


treeToList :: BST a -> [a]
treeToList BSTLeaf = []
treeToList BSTNode a l r = treeToList l ++ [a] ++ treeToList r


inorder:: Tree a -> [a]
inorder Leaf = []
inorder (Node n l r) = inroder l ++ [n] ++ inorder r


isBST :: BST Int -> Bool
isBST t = (treeToList t) == sort (treeToList t)

-- main = print $ isBST 


-- Test trees)
tree1 :: Tree Int
tree1 = Node 4 (Node 10 (Node 6 Leaf Leaf) (Node 11 Leaf Leaf)) 
              (Node 20 (Node 12 Leaf Leaf) Leaf)

tree2 :: Tree Int
tree2 = Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) 
              (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf))

tree3 :: Tree Int
tree3 = Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) 
               (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)))

tree4 :: Tree Int
tree4 = Node 7 (Node 11 tree1 tree2) (Node 5 tree3 tree2)

tree5 :: Tree Int
tree5 = Node 1 tree3 tree4


{-
    Task 0 :
    Function to create mirror image of a tree.

    Example:
          1                         1
        /   \     reverse        /    \
      2      3    ------->     3      2
     / \    / \               / \    / \ 
    4  5   6  Leaf           Leaf 6 5   4
    Flip all the left and right subtrees.
    
-}
-- reverseTree :: Tree a -> Tree a

-- main = print $  reverseTree (Node 1 (Node 2  (Node 4 Leaf Leaf)   (Node 5 Leaf Leaf))  (Node 3 (Node 6 Leaf Leaf)  Leaf))
-- Node 1 (Node 3 Leaf (Node 6 Leaf Leaf)) (Node 2 (Node 5 Leaf Leaf) (Node 4 Leaf Leaf))
-- main = print $ reverseTree tree2  -- Node 5 (Node 17 (Node 11 Leaf Leaf) (Node 31 Leaf (Node 14 Leaf (Node 12 Leaf Leaf)))) (Node 10 Leaf (Node 31 Leaf (Node 1 Leaf Leaf)))
-- main = print $ reverseTree tree1 -- Node 4 (Node 20 Leaf (Node 12 Leaf Leaf)) (Node 10 (Node 11 Leaf Leaf) (Node 6 Leaf Leaf))

{-
	Task 1 :
    
    Given a key determine in which level it is stored in the Tree Int.
	
	
		 07           <- Level 0
	   /   \          
	 02	    20        <- Level 1
	 /\	    / \ 
	01 04  10 30 	  <- Level 2 

	If the value is not in the tree then return -1

     Hint : Maybe we need to write a helper function that introduces a new parameter to store information about the current level during the recursion.

-}

-- getLevel :: Int -> Tree Int -> Int


-- main = do
--     -- Tree level tests
--     print $ getLevel 5 tree2  -- 0
--     print $ getLevel 10 tree1 -- 1
--     print $ getLevel 55 tree1 -- -1
--     print $ getLevel 31 tree2 -- 2

{- 
    Task 2: 
    Count nodes with exactly 3 grandchildren

    Ex.:  1
        /   \
      2      3
     / \    / \
    4 5   6  Leaf
    The first node (1) has exactly 3 grandchildrens(4,5,6), so it's a 'good' node.

    It's a similar case as task 4. Create list of tuples (node, left child, right child) for odd numbers' nodes. Since we want to get the information about the subtrees of current node.
    How do we know if a tree is only one leaf or has at least one node?
-}

-- countTripleParents :: Tree Int -> Int

-- main = do    
--     -- Triple parents tests
--     print $ countTripleParents tree1 -- 1
--     print $ countTripleParents tree2 -- 1
--     print $ countTripleParents tree3 -- 1
--     print $ countTripleParents tree4 -- 4
--     print $ countTripleParents tree5 -- 5

{- Task 3. 
    Count nodes at specific level 
    Example:

        Tree2
                5       --level 1 has 1 element  --  print $ nodeCountLevel tree2 1 --1
            10    17    --level 2 has 2 elements --  print $ nodeCountLevel tree2 2 --2
        31  L  31  11   --level 3 has 3 elements --  print $ nodeCountLevel tree2 3 --3
      1 L    14 L L L   --level 4 has 2 elements --  print $ nodeCountLevel tree2 4 --2
    L L     L L

-}
-- nodeCountLevel :: Tree a -> Int -> Int

-- main = do
--     print $ nodeCountLevel tree1 5  -- 0
--     print $ nodeCountLevel tree2 4  -- 2
--     print $ nodeCountLevel tree3 3  -- 3
--     print $ nodeCountLevel tree4 1  -- 1
--     print $ nodeCountLevel tree5 2  -- 2


-- Item type
data Item = Item {
    key :: String,
    value :: Int
} deriving (Show, Eq)

-- Sample Item tree
t1 :: Tree Item
t1 = Node (Item "a" 5) 
         (Node (Item "b" 2) 
              (Node (Item "x" 10) 
                   (Node (Item "h" 3) Leaf Leaf) 
                   Leaf)
              (Node (Item "y" 7) Leaf Leaf))
         (Node (Item "d" 8) 
              (Node (Item "e" 15) 
                   (Node (Item "g" 12) Leaf Leaf) 
                   Leaf)
              (Node (Item "f" 9) Leaf Leaf))

{-  
    Task a.
    Given a tree of Item. Find the key of the item that has the maximum value.
	All the key inside tree are unique.

                            Hints: How do we campare two items?
                                   Search for the item in the tree or in the list (turn a tree into a list first).
                                   Return the key of the item.
-}

-- searchMaxKey :: Tree Item -> String

-- main = do
    
--     putStrLn "Testing searchMaxKey:"
--     print $ searchMaxKey t1 --"e"
    
{-
    Task b:  
    Union of two item lists

    Union means taking all the items from both lists, if items has the same key, taking the larger value.
	The final result should be distinct in term of key and can be any order.

                                    Hints: How do we check if an item is in a list of items?
                                            When we find the item in both lists, we return the item with larger value.
-} 

-- Sample items for testing
i1 = Item "abc" 13
i2 = Item "def" 25
i3 = Item "ghi" 8
i4 = Item "jkl" 15
i5 = Item "mno" 20
it1 = Item "abc" 4
it2 = Item "def" 30
it3 = Item "pqr" 23
list1 = [i1,i2,i3,i4,i5]
list2 = [it1,it2,it3]


-- unionItems :: [Item] -> [Item] -> [Item]


-- main = do
--     putStrLn "\nTesting unionItems:"
--     print $ unionItems list1 list2

{-
    Task c.
	  
      1) Define a Person record which contains name and height two fields,
	    with type of String and Double respectively. 
      
      2) Write a function which takes a person
	    and a certain height, if the person is taller than 1.70, subtract their height by 1%


-}

-- Sample persons
-- john :: Person
-- john = Person {name = "John", tall = 1.78}

-- mike :: Person
-- mike = Person {name = "Mike", tall = 1.58}

-- lily :: Person
-- lily = Person {name = "Lily", tall = 1.85}

-- changeHeight :: Person -> Person


-- main = do
--     print $ changeHeight john  -- Person "John" 1.7622
--     print $ changeHeight mike  -- Person "Mike" 1.58
--     print $ changeHeight lily  -- Person "Lily" 1.8315000000000001