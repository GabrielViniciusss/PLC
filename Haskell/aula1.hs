vendas :: Int->Int
vendas x | x == 0 = 30
         | x == 1 = 50
         | x == 2 = 80
         | x == 3 = 150
         | x == 4 = 200
         | x == 5 = 50
         | x == 6 = 150
         | x == 7 = 50

totalVendas :: Int->Int
totalVendas n | n == 0 = vendas 0
              | otherwise = totalVendas (n-1) + vendas n

maxi :: Int->Int->Int
maxi x y | x>y = x
         | otherwise = y

maxVendas :: Int -> Int
maxVendas n | n == 0 = vendas 0
            | otherwise = maxi (maxVendas(n-1)) (vendas n)


sumSquares :: Int->Int->Int
sumSquares x y = sqx + sqy
    where sqx = x*x
          sqy = y*y

myNot :: Bool->Bool
myNot True = False
myNot False = True


--Q1:

igualdade :: Int->Int->Int
igualdade x y | x==y = 1
              | otherwise = 0

vendasIguais :: Int->Int->Int 
vendasIguais s 0 | s == vendas 0 = 1
                 | otherwise = 0
vendasIguais s n | s == vendas n = 1 + vendasIguais s (n-1)
                 | otherwise = vendasIguais s (n-1)

vendasIguais2 :: Int->Int->Int 
vendasIguais2 s 0 = igualdade s (vendas 0)
vendasIguais2 s n = igualdade s (vendas n) + vendasIguais2 s (n-1)

--Q2:

testaPrimo:: Int->Int->Bool
testaPrimo x y  | y == 1 = True
                | x mod y == 0 = False
                | otherwise = testaPrimo x (y-1)
                
ehPrimo :: Int -> Bool
ehPrimo 1 = False
ehPrimo n = testaPrimo n (n-1)

main = do
    putStrLn "Doubo gay"

