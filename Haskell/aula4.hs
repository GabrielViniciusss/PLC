import Data.Char
compare2 :: Char -> Char -> Char
compare2 x y = if (ord x) > (ord y) then x else y

--Composiçao de funçoes 
g :: Int->Int
g x = x + 1

f :: Int->Int -- f.g = f(g(x))
f y = y * 10

h :: Int->Int
h = (f.g)

(+++) :: (u->v) -> (t->u) -> (t->v)
(+++) f g x = f(g x)

inverte :: (t->u->v) -> (u->t->v)
inverte f x y = f y x

primList :: [Int] -> [Int]
primList k = [x | x <- (map ehPrimo k), x/= 0]

testaPrimo:: Int->Int->Bool
testaPrimo x y  | fromIntegral y > sqrt (fromIntegral x) = True
                | x `mod` y == 0 = False
                | otherwise = testaPrimo x (y+2)
                
ehPrimo :: Int -> Int
ehPrimo 1 = 0
ehPrimo 2 = 2
ehPrimo n | mod n 2 == 0 = 0
          | otherwise = if (testaPrimo n 3) == True then n else 0

dropZero :: [Int] -> [Int]
dropZero [] = []
dropZero [0] = []
dropZero (0:xs) = xs
dropZero (x:xs) = dropZero xs

hahaha :: [Int] -> [Int]
hahaha [] = []
hahaha [0] = []
hahaha (0:t) = hahaha t
hahaha (h:t) = (h : (hahahaha t)) ++ (hahaha (dropZero t))
             
hahahaha :: [Int] -> [Int]
hahahaha [] = []
hahahaha (c:t) | c == 0 = []
               | otherwise = c : hahahaha t

toInt :: Float -> Int
toInt x = round x