data Tree t = Nilt |Node t (Tree t) (Tree t)
            deriving (Read,Ord,Eq)

deph :: (Num t,Ord t) => Tree t -> t
deph Nilt = 0
deph (Node t left right) = 1 + max (deph left) (deph right)

maiorDiametro :: (Num t, Ord t) => Tree t -> t
maiorDiametro Nilt = 0
maiorDiametro (Node t left right) = max (deph left + deph right + 1) (max (maiorDiametro left) (maiorDiametro right))

