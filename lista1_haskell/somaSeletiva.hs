import Data.Char

main = do
  a <- getLine
  let result = sumNumbers a
  print result

sumNumbers :: [Char] -> Int
sumNumbers "" = 0
sumNumbers (h:t) | (h >= '0' && h<='9') = digitToInt h + sumNumbers t
                 | otherwise = sumNumbers t