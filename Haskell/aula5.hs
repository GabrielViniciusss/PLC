-- criando tipos de dados enumerados
data Temp = Frio | Quente
    deriving(Show)
data Estacao = Outono | Primavera | Verao | Inverno
    deriving (Show)

clima :: Estacao -> Temp
clima Inverno = Frio
clima _ = Quente


type Nome = String
type Idade = Int
data Pessoa = Pessoa Nome Idade
    deriving (Show)

showPerson :: Pessoa -> String
showPerson (Pessoa n a) = n ++ " -- " ++ show a


data Shape = Circle Float
           | Rectangle Float Float
    deriving(Show)

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound (Rectangle _ _) = False

area :: Shape -> Float
area (Circle r) = pi * r * r
area (Rectangle l1 l2) = l1*l2
