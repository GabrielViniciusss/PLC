fib :: Int -> [Integer]
fib n = fibs 0 1 n
  where
    fibs _ _ 0 = []
    fibs a b n = a : fibs b (a + b) (n-1)

solve :: String -> String
solve x = x ++ show(foldr (+) 0 [y|y<-fib(length x),mod y 2 == 0])

main = do 
    input <- getLine 
    let result = solve input
    print result