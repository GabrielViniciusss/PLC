import Data.List (sort, nub) 
import Data.Char (toLower)

counter :: String -> String -> Int
counter word sentence = length (filter (== word) (words(map toLower sentence)))  --words divide uma string em uma lista de strings, separadas por " "

uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences sentence1 sentence2 =
  sort $ nub $ filter checkWord allWords                                   --nub elimina elementos duplicados da lista
  where
    allWords = words(map toLower (sentence1 ++ " " ++ sentence2) )
    checkWord word =
      counter word sentence1 == 1 && counter word sentence2 == 0 ||
      counter word sentence1 == 0 && counter word sentence2 == 1

main :: IO ()
main = do
  sentence1 <- getLine
  sentence2 <- getLine
  let result = uncommonFromTwoSentences sentence1 sentence2
  print result