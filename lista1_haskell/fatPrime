main = do
      a <- getLine
      let result = fatPrime (read a :: Int)
      print result
      
fatPrime :: Int -> [(Int, Int)]   -- fat 100 = find 100 2 [] => find 100 2 [] => find 50 2 (update 2 []) => [(2,1)] => find 50 2 [(2,1)] => find 25 2 up[(2,1)] => (update 2 [(2,1)]) =>
fatPrime 1 = []                   -- find 25 2 [(2,2)] => find 25 3 [(2,2)] => find 25 5 [(2,2)] => find 5 5 up[(2,2)] => up 5 ((2,2) : []) => (2,2) : [] : (5,1) => [(2,2),(5,1)]
                                  -- find 5 5 [(2,2),(5,1)] => find 1 5 up 5 [(2,2),(5,1)] => HAHAHAHHAHAHA X = 2 vai dar diferente e criar (5,1)
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