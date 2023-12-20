data Ops = SUM | MUL | SUB
           deriving (Read,Eq)

data IntTree = Nilt Int | Node Ops IntTree IntTree
               deriving (Read)

preOrder :: IntTree -> Int
preOrder (Node ops (Nilt a) (Nilt b)) 
    | ops == SUM = a + b
    | ops == MUL = a * b
    | ops == SUB = a - b

preOrder (Node ops (Nilt a) op2)
    | ops == SUM = a + preOrder op2
    | ops == MUL = a * preOrder op2
    | ops == SUB = a - preOrder op2

preOrder (Node ops op1 (Nilt a))
    | ops == SUM = preOrder op1 + a
    | ops == MUL = a * preOrder op1
    | ops == SUB = preOrder op1 - a

preOrder (Node ops op1 op2)
    | ops == SUM = preOrder op1 + preOrder op2
    | ops == MUL = preOrder op1 * preOrder op2
    | ops == SUB = preOrder op1 - preOrder op2
 
evalTree :: IntTree -> Int
evalTree = preOrder

main = do
    s <- getLine
    let result = evalTree (read s)
    print result