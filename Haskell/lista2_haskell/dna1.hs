data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

dnaAux :: Tree Int -> String
dnaAux Nilt = ""
dnaAux (Node a al ar) =  dnaAux al ++ [converting a] ++ dnaAux ar

toList :: String -> String -> Int -> [String]
toList "" "" n = []
toList "" a n = [a]
toList (a:as) b n | mod n 8 == 7 = (b++[a]) : toList as "" 0
                  | otherwise = toList as (b++[a]) (n+1)

converting :: Int -> Char
converting x | mod x 5 == 0 = 'E'
             | mod x 5 == 1 = 'M'
             | mod x 5 == 2 = 'A'
             | mod x 5 == 3 = 'C'
             | otherwise = 'S'

dna1 :: Tree Int -> [String]
dna1 t = toList (dnaAux t) "" 0

main = do
bin <- getLine
let result = dna1 (read bin::Tree Int)
print result