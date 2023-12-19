main = do
    a <- getLine
    b <- getLine
    let result = decEnigma a (read b)
    print result

checkChar :: Char -> [(Char, Char)] -> Char
checkChar c [] = ' '
checkChar c (h:t)
  | c == fst h = snd h
  | otherwise = checkChar c t

decEnigma :: String -> [(Char, Char)] -> String
decEnigma "" k = ""
decEnigma (h:t) k = (checkChar h k):(decEnigma t k)