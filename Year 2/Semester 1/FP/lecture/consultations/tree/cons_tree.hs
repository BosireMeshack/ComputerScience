
module Main where
    
import Data.List (sort)
import Data.Char (chr)

-- main :: IO ()

data Tree a = Node a (Tree a) (Tree a) | Leaf
    deriving (Show)

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

tree6:: Tree Int
tree6 = Node 6 (Node 5 Leaf Leaf) (Node 4 ((Node 3 (Node 1 Leaf Leaf) Leaf) (Node 2 Leaf Leaf)))


treen :: Tree Int 
treen = Node 66 (Node 72 (Node 70 Leaf Leaf) (Node 68 Leaf Leaf)) 
              (Node 65 (Node 77 Leaf Leaf) Leaf)

-- 0. maptree
mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f Leaf = Leaf
mapTree f (Node a l r) = Node (f a) (f l) (f r)

-- main = print $ mapTree chr treen


-- 1. tree to list function using inorder travelsal
-- inorder :: Tree a -> [a]


-- 2. list to binary search tree function for [Int]
toTree :: [Int] -> Tree Int
toTree [] = Leaf
toTree (x:xs) = insertT x (toTree xs)

insertT :: Int -> Tree Int -> Tree Int
insertT e Leaf = Node e Leaf Leaf
insertT e (Node x le ri)
  | e <= x = Node x (insertT e le) ri
  | e >  x = Node x le (insertT e ri)


-- listToTree :: [a] -> Tree a
-- listToTree [] = Leaf
-- listToTree (x:xs) = Node x (listToTree left) (listToTree right)
--  where
--    n = length xs
--    left = take (n `div` 2) xs
--    right = drop (n `div` 2) xs

-- 3. Binary Search Tree check
-- This definition is the same as the binary tree
data BST a = BSTNode a (BST a) (BST a) 
           | BSTLeaf
           deriving (Show)

-- https://www.geeksforgeeks.org/binary-search-tree-data-structure/
-- isBST :: BST Int -> Bool


-- Inorder 
-- treeToList :: BST a -> [a]

-- try other orders

-- bstn :: BST Int 
-- bstn = BSTNode 3 (BSTNode 2 (BSTNode 1 BSTLeaf BSTLeaf) BSTLeaf) (BSTNode 6 BSTLeaf BSTLeaf)

-- main = print $ isBST (bstn)
-- Sample BSTs for testing
bst1 :: BST Int
bst1 = BSTNode 1 BSTLeaf 
       (BSTNode 20 
           (BSTNode 3 
               (BSTNode 3 BSTLeaf BSTLeaf)
               (BSTNode 4 BSTLeaf 
                   (BSTNode 12 
                       (BSTNode 5 BSTLeaf BSTLeaf)
                       BSTLeaf)))
           (BSTNode 45 
               (BSTNode 34 
                   (BSTNode 22 BSTLeaf BSTLeaf)
                   BSTLeaf)
               (BSTNode 112 
                   (BSTNode 53 BSTLeaf BSTLeaf)
                   BSTLeaf)))

bst2 :: BST Int
bst2 = BSTNode 1 BSTLeaf 
       (BSTNode 20 
           (BSTNode 7 BSTLeaf 
               (BSTNode 12 
                   (BSTNode 12 
                       (BSTNode 9 BSTLeaf BSTLeaf)
                       BSTLeaf)
                   BSTLeaf))
           BSTLeaf)

bst4 :: BST Int
bst4 = BSTNode 1 BSTLeaf 
       (BSTNode 2 
           (BSTNode 7 BSTLeaf 
               (BSTNode 12 
                   (BSTNode 12 
                       (BSTNode 8 BSTLeaf BSTLeaf)
                       BSTLeaf)
                   BSTLeaf))
           BSTLeaf)

-- Test BST checking
-- testBST :: [Bool]
-- testBST = map isBST [bst1, bst2, bst4, BSTLeaf]  -- [True,True, False,True]

-- main = print $ testBST


{-
    Task 4 :
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


-- 5. Given a tree and an integer. Find all the nodes that are equal to the 
--    integer and give the sum of their direct children. (Leaf count as 0).

-- f8 :: Tree Int -> Int -> Int


-- main =  print $ f8 (Node 2 Leaf Leaf) 3  -- 0
-- main =  print $ f8 (Node 3 (Node 1 Leaf Leaf) (Node 1 Leaf Leaf)) 3  -- 2
-- main =  print $ f8 (Node 1 (Node 0 Leaf Leaf) (Node 2 Leaf Leaf)) 1  -- 2
-- main =  print $ f8 (Node 2 (Node 1 Leaf Leaf) (Node 2 (Node 3 Leaf Leaf) (Node 1 Leaf Leaf))) 2 -- 7
-- main =  print $ f8 (Node 2 (Node 1 Leaf Leaf) (Node 2 Leaf (Node 1 Leaf Leaf))) 2 -- 4
