import Data.List
main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result

logMes :: String -> String -> Double
logMes "" _ = 0
logMes y x = foldl (+) 0 (extractPrice (toString x) y)

extractPrice :: [String] -> String-> [Double]
extractPrice [] s = []
extractPrice (x:_:z:rest) s | isInfixOf s x = read z : extractPrice rest s 
                            | otherwise = extractPrice rest s

dropVirgula :: String -> String
dropVirgula [] = []
dropVirgula [';'] = []
dropVirgula (';':xs) = xs
dropVirgula (x:xs) = dropVirgula xs

toString :: String -> [String]
toString "" = []
toString (h:t) | h /= ';' = (h : toString' t) : toString (dropVirgula t)

toString' :: String -> String
toString' "" = ""
toString' (c:t) | c == ';' = ""
                | otherwise = c : toString' t