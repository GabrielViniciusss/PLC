unzip' :: [(a, b)] -> ([a], [b])
unzip' l = foldr unzip2 ([],[]) l
  where 
    unzip2 (x, y) (xs', ys') = (x:xs', y:ys')

unzip'2 :: [(a, b)] -> ([a], [b])
unzip'2 = foldr (\(x, y) (xs, ys) -> (x:xs, y:ys)) ([], [])