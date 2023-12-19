data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Eq, Ord, Read)

preOrder :: (Num t,Ord t,Eq t) => Tree t -> [t]
preOrder Nilt = []
preOrder (Node x left right) = [x] ++ preOrder left ++ preOrder right

isBST :: (Num t,Ord t,Eq t)  => Tree t -> Bool
isBST Nilt = True
isBST (Node root Nilt Nilt) = True
isBST (Node root left Nilt) =  root > foldr (max) 0 (preOrder left) && isBST left
isBST (Node root Nilt right) = root < foldr (min) 100000 (preOrder right) && isBST right
isBST (Node root left right) = root > foldr (max) 0 (preOrder left) && root < foldr (min) 10000 (preOrder right) && isBST left && isBST right


main = do
       s <- getLine
       let result = isBST (read s::Tree Int)
       print result