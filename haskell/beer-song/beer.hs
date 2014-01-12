module Beer (
  sing,
  verse 
) where


import Data.Char (toUpper)


sing :: Int -> Int -> String
sing from to = concat $ map (\x -> verse x ++ "\n") [from,from-1..to]

verse :: Int -> String
verse n =  capitalize (numOfBottles n) ++ " of beer on the wall, " ++ numOfBottles n ++ " of beer.\n" ++ takeAction n ++ ", " ++ numOfBottles (n-1) ++ " of beer on the wall.\n"
  where takeAction n
          | n == 0 = "Go to the store and buy some more"
          | n == 1 = "Take it down and pass it around"
          | otherwise = "Take one down and pass it around"
        numOfBottles n
          | n == 0 = "no more " ++ pluralizedBottle
          | n < 0 = show (100+n) ++ " " ++ pluralizedBottle
          | otherwise = show n ++ " " ++ pluralizedBottle
          where pluralizedBottle = pluralize "bottle" n

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = toUpper x : xs

pluralize :: String -> Int -> String
pluralize str n
  | n == 1 = str
  | otherwise = str ++ "s"
