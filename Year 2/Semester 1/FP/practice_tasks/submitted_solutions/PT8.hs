-- Write a function which takes a tree
-- and returns the count of the deepest nodes in the tree.

data Tree a = Node a (Tree a) (Tree a) 
            | Leaf deriving (Show, Eq)

tree1 = Leaf
tree2 = Node 5 Leaf Leaf
tree3 = Node 5
            (Node 8 Leaf Leaf)
            (Node 3 Leaf Leaf)
tree4 = Node 10
            (Node 5
                (Node 3 Leaf Leaf)
                (Node 7 Leaf Leaf))
            (Node 15
                (Node 12 Leaf Leaf)
                Leaf)
tree5 = Node 10
            (Node 5
                    (Node 3 Leaf Leaf)
                    (Node 7
                        (Node 6 Leaf Leaf)
                        Leaf))
            (Node 15
                    (Node 12 Leaf Leaf)
                    (Node 18
                        Leaf
                        (Node 20 Leaf Leaf)))

{--
               10
             /    \
           5       15
         /  \     /  \
       3    7   12    18
      / \  / \  / \
     L  L 6 L L  L
          /\
         l  l 
     This tree has 3 deepest nodes: 3, 7, 12 => So the result is 3
--}

depthT :: Tree a -> Int
depthT Leaf = 0
depthT (Node _ le ri) = 1 + max (depthT le) (depthT ri)

countNodesAtDepthT :: Int -> Tree a -> Int
countNodesAtDepthT _ Leaf = 0
countNodesAtDepthT 0 (Node _ _ _) = 1
countNodesAtDepthT depth (Node a le ri) =  countNodesAtDepthT (depth-1) le +  countNodesAtDepthT (depth-1) ri



isLeaf :: Tree a -> Bool 
isLeaf Leaf = True 
isLeaf _ = False 

countDeepestNodes :: Tree a -> Int
countDeepestNodes tree = countNodesAtDepthT (depthT tree -1) tree
   

-- countDeepestNodes :: Tree a -> Int
-- countDeepestNodes Leaf = 0
-- countDeepestNodes (Node a l r)
--   | isLeaf l && isLeaf r = 1
--   | isLeaf l = 0 + countDeepestNodes r  
--   | isLeaf r = 0 + countDeepestNodes l 
--   | otherwise = 0

-- main = print $ countDeepestNodes tree1 -- 0
-- main = print $ countDeepestNodes tree2 -- 1
-- main = print $ countDeepestNodes tree3 -- 2
-- main = print $ countDeepestNodes tree4 -- 3
-- main = print $ countDeepestNodes tree5 -- 2
