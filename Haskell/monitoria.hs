luis :: String->String
luis "luis" = "frango"

lista = [1,2,3,4] :: [Int]
lista2 = [5,6,7] :: [Int]

printXVezes :: Int->String->String
printXVezes 0 _ = ""

sumSquares :: Int->Int->Int
sumSquares x y = sqX + sqY
    where sqX = x*x
          sqY = y*y

fat :: Int-> Int
fat 0 = 1
fat n = n * fat (n-1)

par :: Int->Bool
par n = if mod n 2 == 0 then True else False

numero :: Int->Int
numero x = 5 + (if x > 0 then (-1)*x else x)

intP :: (Int,Int)
intP = (33,43)

type Name = String
type Age = Int
type Phone = Int
type Person = (Name,Age,Phone)

pessoa :: Person
pessoa = ("Luis",20,1111)

doubleList xs = [2*a|a<-xs]

isDigit :: Char -> Bool
isDigit ch = if(ch >= '0' && ch<='9') then True else False

digits :: String->String
digits st = [ch | ch<-st,isDigit ch]

quicksort :: (Ord t) => [t] -> [t]
quicksort [] = []
quicksort (p:xs) = quicksort[x|x<-xs,x<=p] ++ [p] ++ quicksort[x|x<-xs,x>p]


quicksort2 [] = []
quicksort2 (p:xs) = (quicksort2 lesser) ++ [p] ++ (quicksort2 greater)
    where
        lesser = filter (< p) xs
        greater = filter (>= p) xs


printList :: [Int] -> String
printList [] = ""
printList (h:t) = show h ++ printList t