main = do
       lista <- getLine
       print $ maquinaSomar (read lista :: [Int])

lista = [] :: [Int]

maquinaSomar :: [Int] -> [Int]
maquinaSomar [] = []
maquinaSomar (h:t) | h == 0 && check t = lista
                   | h == 0 = lista ++ maquinaSomar t
                   | otherwise = lista ++ [somador (h:t)] ++ maquinaSomar (function (h:t))

somador :: [Int] -> Int
somador [] = 0
somador (0:_) = 0
somador (x:xs) = x + somador xs          

check :: [Int] -> Bool
check [] = False 
check (h:t) | h == 0 = True
            | otherwise = False

function :: [Int] -> [Int]
function [] = []
function (x:xs) | x == 0 && check xs = (x:xs)
                | x == 0 = xs
                | otherwise = function xs