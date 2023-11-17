import Data.Char

main = do
    s <- getLine
    let result = btoi (reverse s)
    print result
    
btoi :: String -> Int
btoi "" = 0
btoi (h:t) = digitToInt h + 2 * btoi t