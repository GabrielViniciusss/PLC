data Command = Forward Int | Backward Int | TurnLeft | TurnRight
            deriving(Eq,Show,Read)

data Direction = North | South | West | East
             deriving(Eq,Read,Show)

faces :: Direction -> [Command] -> Direction 
faces direction [] = direction
faces direction (Forward z:xs) = faces direction xs
faces direction (Backward z:xs) = faces direction xs

faces direction (TurnLeft:xs) | direction == North = faces West xs
                            | direction == South = faces East xs
                            | direction == West = faces South xs
                            | direction == East = faces North xs
                            

faces direction (TurnRight:xs) | direction == North = faces East xs
                            | direction == South = faces West xs
                            | direction == West = faces North xs
                            | direction == East = faces South xs
                            
main = do
       a <- getLine
       b <- getLine
       let result = faces (read a) (read b)
       print result
