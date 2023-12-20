import Data.Char

rlencode0 :: [Int] -> [Int]
rlencode0 [] = []
rlencode0 (x:xs)
    | x /= 0 = x : rlencode0 xs
    | x == 0 = x : (1 + counter xs) : rlencode0 (dropWhile (==0) xs) --takeWhile

counter :: [Int]->Int
counter [] = 0;
counter (x:xs)
    | x == 0 = 1 + counter xs
    | x /= 0 = counter []

rldecode0 :: [Int] -> [Int]
rldecode0 [] =[]
rldecode0 (x:xs:t)
    | x /= 0 = x : rldecode0 (xs:t)
    | x == 0 = x : (replicate (xs-1) x) ++ rldecode0 t
rldecode0(x:[]) = [x]


rlencodeLetras :: String -> String
rlencodeLetras [] = []
rlencodeLetras [x] = [x]
rlencodeLetras (x:xs)
    |x == head xs = x : show (length (takeWhile (==x) xs) + 1) ++ rlencodeLetras (dropWhile (==x) xs)
    |otherwise = x : rlencodeLetras xs

rldecodeLetras :: String -> String
rldecodeLetras [] = []
rldecodeLetras [x] = [x]
rldecodeLetras (x:xs:t)
    |isDigit xs = x : replicate (digitToInt xs - 1) x ++ rldecodeLetras t
    |otherwise = x: rldecodeLetras (xs:t)

