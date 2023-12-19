import Data.Char (ord, chr)

answer :: Int  -- variavel imutavel
answer = 42

yes :: Bool
yes = (answer > 71)

square :: Int -> Int
square x = x*x

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n==m) && (m==p)

maxi :: Int->Int->Int
maxi n m | n>=m = n
         | otherwise = m

myNot :: Bool -> Bool
myNot True = False
myNot False = True

myOr :: Bool -> Bool -> Bool
myOr True x = True
myOr False x = x

myAnd :: Bool -> Bool -> Bool
myAnd False x = False
myAnd True x = x

vendas :: Int->Int
vendas n = mod n 17

totalVendas :: Int->Int
totalVendas n | n == 0 = 0
              | n>0 = vendas n + totalVendas (n-1)
              | otherwise = 0

-- maiscula: tipos e construtores (tuplas,listas,tipos algebricos)
-- minuscula: funçoes, variaveis,parametros
-- f n + 1 = f(n) + 1 ; f (n+1) = f(n+1)
-- maxi 2 4 = 2 `maxi` 4

sumSquares :: Int->Int->Int
sumSquares x y = sq x + sq y
    where sq z = z*z

xor :: Bool->Bool->Bool
xor x y = (x||y) && not (x && y)

ehDigito :: Char->Bool
ehDigito ch = ('0' <= ch) && (ch<='9')

main :: IO()
main = do putStr ("peixe" ++ "\n" ++ "gato" ++ "\n")
-- ' ' , "" , " " ; " " é uma string com 1 caractere ' ' 

--ceiling, floor, round :: Float -> Int
-- fromIntegral :: Int -> Float
-- read :: String -> ? (float ou int)
-- show :: ? -> String (recebe algum tipo e devolve ele em string)

lista :: [Int]
lista = [1,2,3,4]
lista2 :: [[Int]]
lista2 = [[1,2],[3,7,7,1,2],[2,4,6]]
-- [] é uma lista vazia
-- type string = [char]
-- /= (diferente)
-- a ordem dos elementos importa na lista1
-- operador construtor de lista = (:) [5] = 5:[]
-- funções boas: head, tail, length, (++)

sumList :: [Int] -> Int
sumList as | as == [] = 0
           | otherwise = (head as) + sumList (tail as)

maiorLista :: [Int] -> Int
maiorLista [] = minBound
maiorLista [x] = x
maiorLista (x:xs) | x> maiorLista xs = x
                  | otherwise = maiorLista xs

digits :: String->String
digits [] = []
digits (head:tail) | (head >='0') && (head <= '9') = head : (digits tail) --48<=x<=57
                    | otherwise = digits tail

firstDigit :: String->Char
firstDigit st = case (digits st) of
                    []  -> 'k'
                    (a:as) -> a

-- if(cond) then do x else y
isEven :: Int -> [Char]
isEven x = if mod x 2 == 0 then "Yeah" else "Not even"

travelToWork :: String -> IO()
travelToWork weather = do
    if weather == "sunny"
        then putStrLn "Walking to work"
    else if weather == "loucura"
        then putStrLn "teste"
    else putStrLn "jajajaj"

--tuplas
intP :: (Int,Int)
intP = (33,43)

addPair :: (Int,Int) -> Int
addPair (x,y) = x+y

shift :: ((Int,Int),Int) ->(Int,(Int,Int))
shift ((x,y),k) = (x,(k,y))

type Name = String
type Age = Int
type Phone = Int
type Person = (Name,Age,Phone)

name :: Person -> Name
name (n,a,p) = n

-- equaçao de segundo grau
oneRoot :: Float -> Float ->Float -> Float -- Delta = 0
oneRoot a b c = -b/(2.0*a)

twoRoots :: Float->Float->Float->(Float,Float)
twoRoots a b c = (d-e,d+e)
    where d = -b/(2.0*a)
          e = sqrt(b*b - 4.0*a*c) / (2.0*a)

roots :: Float -> Float-> Float -> (Int,Float,Float)
roots a b c | sqrt(b*b - 4*a*c) == 0 = (1,oneRoot a b c,-1)
            | sqrt(b*b - 4*a*c) > 0 = (2,r1,r2)
            | otherwise = (0,-1,-1)
            where (r1,r2) = twoRoots a b c

-- compreensoes de listas
-- [expressao qualquer que usa (ou nao) variavel | variavel <- lista , cond]

doubleList :: Num t => [t] -> [t]
doubleList xs = [2 * a | a <- xs]

mod73 :: [Int] -> [Int]
mod73 xs = [x | x<-[1..100] ,mod x 7 ==0 || mod x 3 == 0]

type Biel = String
type Livro = String
type BancoDados = [(Biel,Livro)]

baseExemplo :: BancoDados
baseExemplo = [("sergio","biel louco") ,("doubo","duna"),("android","gay"),("Luis","frangao"),("Laga","loucura"),("Laga","gay")]

livros :: BancoDados -> Biel -> [Livro]
livros x n = [l | (p,l)<- x , p == n ]

emprestimos :: BancoDados->Livro->[Biel]
emprestimos bd l = [pp | (pp,ll)<-bd , ll==l]

emprestado :: BancoDados ->Livro -> Bool
emprestado bd l | length(emprestimos bd l) > 0 = True
                | otherwise = False

qtdEmprestimos :: BancoDados -> Biel -> Int
qtdEmprestimos bd p = length (livros bd p)

emprestar :: BancoDados -> Biel -> Livro -> BancoDados
emprestar [] p l = [(p,l)]
emprestar ((p,l):as) pessoa livro
    | p == pessoa && l == livro = ((p,l):as)
    | otherwise = (p,l):emprestar as pessoa livro

--polimorfismo

capitalize :: Char -> Char             --monomorfica
capitalize ch = chr (ord ch + offset)
    where offset = ord 'A' - ord 'a'

zips :: [t]->[u]->[(t,u)] --parametrico (tipo dos elementos nao importam)
zips (a:as) (b:bs) = (a,b) : zip as bs
zips _ _ = []

rev :: [t] -> [t]
rev [] = []
rev (x:xs) = rev xs ++ [x]

length2 :: [t] -> Int
length2 [] = 0
length2 (a:as) = 1 + length2 as

rep2 :: (Eq t,Num t) => t->u->[u]
rep2 0 _ = []
rep2 n x = x : rep2 (n-1) x

quicksort :: (Ord t) => [t] -> [t]
quicksort [] = []
quicksort (p:xs) = quicksort[x|x<-xs,x<=p] ++ [p] ++ quicksort[x|x<-xs,x>p]

allEqual2 :: Eq t=> t-> t->t->Bool
allEqual2 n m p = (n==m) && (m==p)

member2 :: Eq t => [t] -> t -> Bool
member2 [] _= False
member2 (a:as) x| x==a = True
                | otherwise = member2 as x


--show :: Show t=> t->String
--read :: Read t=> String->t

-- polimorfismo de sobrecarga
-- mesmo nome de funçao, mas ela funciona com diversos tipos distintos
-- classe: coleçao de tipos para os quais uma funçao está definida
-- ex: Eq(comparaveis), Num(Int,double,float) , Ord (Ordenaveis) , Show (transformaveis em string)
-- Instacia: Int é instancia de Eq, assim como float,char,bool,[int] pois as operaçoes da classe Eq estao definidas para esse tipo
            

--funçoes de alta ordem
applyBinOper :: (t -> t-> u)->t->t->u -- outra funçao como parametro
applyBinOper f x y = f x y

myMap :: (t->u) -> [t] -> [u]
myMap f [] = []
myMap f (a:as) = f a : myMap f as

-- map percorre a lista fazendo operaçoes um a um com os elementos e devolve lista
-- fold percorre a lista acumulando operaçoes elementos um a um e devolve um elemento no final

fold2 :: (t->t->t) -> [t] ->t
fold2 f [a] = a
fold2 f (a:as) = f a (fold2 f as)

--foldr
concat :: [[t]] -> [t]
concat xs = foldr (++) [] xs --caso base [] foldr::(f) ->casobase

--filter
filter2 :: (t->Bool) -> [t] -> [t]
filter2 p [] = []
filter2 p (a:as) | p a = a : filter2 p as
                | otherwise = filter2 p as

evens xs = filter2 isEven2 xs
    where isEven2 n = mod n 2 == 0

--tipos algebricos

data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente

data Shape = Circle Float | Rectangle Float Float
example1 :: Shape
example1 = Circle 4.9

example2 :: Shape
example2 = Rectangle 4.2 2.0

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False
