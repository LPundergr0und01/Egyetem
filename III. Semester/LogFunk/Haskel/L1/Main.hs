
--1
dupla :: [a] -> [a]
dupla [] = []
dupla (x:xs) = x:x: dupla xs


--2.
f :: Int -> Int
f 0 = 1
f 1 = 1
f n = f (n-1) + f (n-2)


--3.
fibo = 0 : 1 : zipWith (+) fibo (tail fibo)

--4
minim (x:xs) = foldl min x xs


--5.
ketmax (x1:x2:xs) = foldl nagyok (maxX, minX) xs
    where
        maxX = max x1 x2
        minX = min x1 x2
        nagyok (x1,x2) xn
            | xn > x1 = (xn,x1)
            | xn > x2 = (x1,xn)
            |otherwise= (x1,x2)

--6.
oszt::[a] -> ([a], [a])
oszt [] = ([],[])
oszt [x] = ([x],[])
oszt xs = o1 xs [] []

o1::[a] -> [a] -> [a] -> ([a],[a])
o1 [] k1 k2 = (k1,k2)
o1 [x] k1 k2 = (x:k1,k2)
o1 (x1:x2:xs) k1 k2 = o1 xs (x1:k1) (x2:k2)

--7.

osszevag::[Int] -> [Int] -> [Int]
osszevag [] [] = []
osszevag [] x = x
osszevag x [] = x
osszevag (x1:xs1) (x2:xs2)
    |x1 < x2 = x1:osszevag xs1 (x2:xs2)
    |x1 > x2 = x2:osszevag (x1:xs1) xs2
    |otherwise = x1:osszevag xs1 xs2

--8.
lkkt a b
    | a*b<0 = div (-(a*b)) (lnko a b )
    | otherwise = div (a*b) (lnko a b )

lnko:: Int -> Int -> Int
lnko a b
    | a > b = lnko (a-b) b
    | a < b = lnko a (b-a)
    | otherwise = a

--9.
fordit :: [a] -> [a]
fordit = foldl (flip (:)) []

palindrom :: Eq a => [a] -> Bool
palindrom xs = xs == fordit xs

--10.

tor :: ([(a,Int)],Int) -> [a]
tor ([],_) = []
tor ((x,n):xs,a)
    | (n `mod` a) == 0 = tor (xs,a)
    | otherwise = x : tor (xs,a)

torolk :: ([a],Int) -> [a]
torolk (xs,a) = tor (zip xs [1..],a)

--11.
innerKompakt :: Eq a => [(a,Int)] -> [(a,Int)]
innerKompakt [] = []
innerKompakt [x] = [x]
innerKompakt (x:y:xs)
    | fst x == fst y = innerKompakt ( (fst x , snd x + snd y) : xs )
    | fst x /= fst y = x : innerKompakt (y:xs)

kompakt :: Eq a => [a] -> [(a,Int)]
kompakt xs = innerKompakt (zip xs [1,1..])