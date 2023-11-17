somarMultiplos :: [Int] -> Int -> [Int]
somarMultiplos [] _ = []
somarMultiplos (x:xs) k = (devolveSoma x k) : somarMultiplos xs k

devolveSoma :: Int -> Int -> Int
devolveSoma 0 k = 0
devolveSoma _ 0 = 0
devolveSoma x k | k>x = 0
                | mod x k == 0 = x + devolveSoma (x-1) k
                | otherwise = devolveSoma (x-1) k