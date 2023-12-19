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

doubleList :: [Int] -> [Int]
doubleList xs = [2*a | a<-xs]

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
zips :: [t]->[u]->[(t,u)] --parametrico (tipo dos elementos nao importam)
zips (a:as) (b:bs) = (a,b) : zip as bs
zips _ _ = []

rev :: [t] -> [t]
rev [] = []
rev (x:xs) = rev xs ++ [x]

length2 :: [t] -> Int
length2 [] = 0
length2 (a:as) = 1 + length2 as

rep2 :: Int->a->[a]
rep2 0 _ = []
rep2 n x = x : rep2 (n-1) x

-- polimorfismo de sobrecarga
-- mesmo nome de funçao, mas ela funciona com diversos tipos distintos
-- classe: coleçao de tipos para os quais uma funçao está definida
-- ex: Eq, Num, Ord
-- Instacia: int é instancia de Eq, assim como float,char,bool,[int] pois as operaçoes da classe Eq estao definidas para esse tipo 

--ex:

agrupar :: Eq t => [[t]] -> [(t,Int)] 
agrupar [] = []
agrupar ((h:t):s) = (h,check h (t:s)) : agrupar t

check :: Eq t => t -> [t]-> Int
check _ [] = 0
check a (x:xs) | x == a = 1 + check a xs
               | otherwise = check a xs

-- funçoes de alta ordem
applyBinOper :: (t -> t-> u)->t->t->u -- outra funçao como parametro
applyBinOper f x y = f x y
