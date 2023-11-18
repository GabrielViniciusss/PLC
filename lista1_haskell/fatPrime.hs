main = do
      a <- getLine
      let result = fatPrime (read a :: Int)
      print result
      
fatPrime :: Int -> [(Int, Int)]   
fatPrime 1 = []                   
fatPrime n = findFactors n 2 []

findFactors :: Int -> Int -> [(Int, Int)] -> [(Int, Int)]
findFactors 1 _ result = result
findFactors n k result =
    if mod n k == 0 then findFactors (factoring n k) k (updateResult k result)
    else findFactors n (k + 1) result

factoring :: Int -> Int -> Int
factoring n k = div n k

updateResult :: Int -> [(Int, Int)] -> [(Int, Int)]
updateResult k [] = [(k, 1)]
updateResult k ((x, count):rest) | k == x = (x, count+1):rest
                                 | k /= x = (x,count) : updateResult k rest
