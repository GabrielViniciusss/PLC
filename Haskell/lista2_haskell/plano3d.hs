data Mov = Z Double | X Double | Y Double
                  deriving (Eq, Show, Read)

type Point3D = (Double, Double, Double)

type Object3D = [Point3D]

transladaObjeto :: Object3D -> [Mov] -> Object3D
transladaObjeto [] _= []
transladaObjeto x [] = x
transladaObjeto ((a,b,c):xs) ((X k):(Y ks):(Z ku):hs) = (a+k,b+ks,c+ku) : transladaObjeto xs ((X k):(Y ks):(Z ku):hs) 

rotacionaObjeto :: Double -> Double -> Double -> Object3D -> Maybe Object3D
rotacionaObjeto angX angY angZ ((a,b,c):xs) | angX == -1 || angY == -1 || angZ == -1 = Nothing
                                            | otherwise = Just (rotateX (toRad angX) (rotateY (toRad angY) (rotateZ (toRad angZ) ((a,b,c):xs))))

toRad :: Double -> Double
toRad x = 2*pi*x/360

rotateZ :: Double -> Object3D -> Object3D
rotateZ angZ [] = []
rotateZ angZ ((a,b,c):xs) = (a*(cos angZ) - b*(sin angZ),a*(sin angZ)+b*(cos angZ),c) : rotateZ angZ xs

rotateY :: Double -> Object3D -> Object3D
rotateY angY [] = []
rotateY angY ((a,b,c):xs) = (a*(cos angY) + c*(sin angY),b,c*(cos angY) - a*(sin angY)) : rotateY angY xs

rotateX :: Double -> Object3D -> Object3D
rotateX angX [] = []
rotateX angX ((a,b,c):xs) = (a,b*(cos angX)-c*(sin angX),c*(cos angX)+b*(sin angX)) : rotateX angX xs

main = do
       coord <- getLine
       mov <- getLine
       angX <- getLine
       angY <- getLine
       angZ <- getLine
       let transladado = transladaObjeto (read coord :: Object3D) (read mov :: [Mov])
       let rotacionado = rotacionaObjeto (read angX) (read angY) (read angZ) transladado
       print rotacionado