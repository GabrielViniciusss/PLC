main :: IO ()
main = do
    a <- getLine
    let result = minMaxCartao a
    print result

lista = [] :: [String]

minMaxCartao :: String -> (Double, Double)
minMaxCartao "" = (0,0)
minMaxCartao str = (minimum(extractPrice (toString str)), maximum(extractPrice (toString str)))

extractPrice :: [String] -> [Double]
extractPrice [] = []
extractPrice (_:_:z:rest) = read z : extractPrice rest

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