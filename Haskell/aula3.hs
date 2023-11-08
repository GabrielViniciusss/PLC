lista = [1,2,3,4] :: [Int]
lista2 = [(5,True),(7,True)] :: [(Int,Bool)]
lista3 = [[4,2],[3,7,7,1],[],[9]] :: [[Int]]
lista4 = "bom" :: [Char]
lista5 = [2,4..9] :: [Int]
lista6 = [-1..3] :: [Int]
lista7 = ['a'..'d'] :: [Char]
lista8 = "bielo5co23" :: [Char]
--lista9 = [9,3],[4,5],[7,8],[9,10]] :: [[Int]]

sumList :: [Int]->Int
sumList [] = 0
sumList (head:tail) = head + sumList tail

--Q1
double :: [Int] -> [Int]
double [] = []
double (head:tail) = (2 * head) : (double tail)

--Q2
member :: [Int] -> Int -> Bool
member [] x = False
member (head:tail) x | x == head = True
                     | otherwise = member tail x 

--Q3
digits :: String->String
digits [] = []  
digits (head:tail) | (head >='0') && (head <= '9') = head : (digits tail) --48<=x<=57
                   | otherwise = digits tail

--Q4
sumPairs :: [(Int,Int)] -> [Int]
sumPairs [] = [] 
sumPairs ((x1,y1):tail) = x1+y1 : sumPairs tail 

sumPairs2 :: [(Int,Int)] -> [Int]
sumPairs2 [] = [] 
sumPairs2 (head:tail) = (fst head + snd head) : sumPairs tail
