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
