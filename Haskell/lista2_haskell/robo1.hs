data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
                deriving (Eq, Show, Read)

destination :: (Int,Int) -> [Command] -> (Int,Int)
destination (a,b) xs = toNorth (a,b) xs

toNorth :: (Int,Int) -> [Command] -> (Int,Int)
toNorth (a,b) [] = (a,b)
toNorth (a,b) (Forward x:xs) = toNorth (a,b+x) xs
toNorth (a,b) (Backward x:xs) = toNorth (a,b-x) xs
toNorth (a,b) (TurnLeft:xs) = toLeft1 (a,b) xs
toNorth (a,b) (TurnRight:xs) = toRight1 (a,b) xs

toSouth :: (Int,Int) -> [Command] -> (Int,Int)
toSouth (a,b) [] = (a,b)
toSouth (a,b) (Forward x:xs) = toSouth (a,b-x) xs
toSouth (a,b) (Backward x:xs) = toSouth (a,b+x) xs
toSouth (a,b) (TurnLeft:xs) = toLeft3 (a,b) xs
toSouth (a,b) (TurnRight:xs) = toRight1 (a,b) xs

toRight1 :: (Int,Int) -> [Command] -> (Int,Int)
toRight1 (a,b) [] = (a,b)
toRight1 (a,b) (Forward x:xs) = toRight1 (a+x,b) xs
toRight1 (a,b) (Backward x:xs) = toRight1 (a-x,b) xs
toRight1 (a,b) (TurnLeft:xs) = toNorth (a,b) xs
toRight1 (a,b) (TurnRight:xs) = toRight2 (a,b) xs

toRight2 :: (Int,Int) -> [Command] -> (Int,Int)
toRight2 (a,b) [] = (a,b)
toRight2 (a,b) (Forward x:xs) = toRight2 (a,b-x) xs
toRight2 (a,b) (Backward x:xs) = toRight2 (a,b+x) xs
toRight2 (a,b) (TurnLeft:xs) = toRight1 (a,b) xs
toRight2 (a,b) (TurnRight:xs) = toRight3 (a,b) xs

toRight3 :: (Int,Int) -> [Command] -> (Int,Int)
toRight3 (a,b) [] = (a,b)
toRight3 (a,b) (Forward x:xs) = toRight3 (a-x,b) xs
toRight3 (a,b) (Backward x:xs) = toRight3 (a+x,b) xs
toRight3 (a,b) (TurnLeft:xs) = toRight2 (a,b) xs
toRight3 (a,b) (TurnRight:xs) = toNorth (a,b) xs

toLeft1 :: (Int,Int) -> [Command] -> (Int,Int)
toLeft1 (a,b) [] = (a,b)
toLeft1 (a,b) (Forward x:xs) = toLeft1 (a-x,b) xs
toLeft1 (a,b) (Backward x:xs) = toLeft1 (a+x,b) xs
toLeft1 (a,b) (TurnLeft:xs) = toLeft2 (a,b) xs
toLeft1 (a,b) (TurnRight:xs) = toNorth (a,b) xs

toLeft2 :: (Int,Int) -> [Command] -> (Int,Int)
toLeft2 (a,b) [] = (a,b)
toLeft2 (a,b) (Forward x:xs) = toLeft2 (a,b-x) xs
toLeft2 (a,b) (Backward x:xs) = toLeft2 (a,b+x) xs
toLeft2 (a,b) (TurnLeft:xs) = toLeft3 (a,b) xs
toLeft2 (a,b) (TurnRight:xs) = toLeft1 (a,b) xs

toLeft3 :: (Int,Int) -> [Command] -> (Int,Int)
toLeft3 (a,b) [] = (a,b)
toLeft3 (a,b) (Forward x:xs) = toLeft3 (a+x,b) xs
toLeft3 (a,b) (Backward x:xs) = toLeft3 (a-x,b) xs
toLeft3 (a,b) (TurnLeft:xs) = toNorth (a,b) xs
toLeft3 (a,b) (TurnRight:xs) = toLeft2 (a,b) xs

main = do
    a <- getLine
    b <- getLine
    let result = destination (read a) (read b)
    print result