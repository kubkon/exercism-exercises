module Anagram (
  anagramsFor,
  ) where


import Data.Char (toLower)
import Data.List (sort)


anagramsFor :: String -> [String] -> [String]
anagramsFor str = foldr reduce []
    where reduce x acc
            | str == x = acc
            | isBijection (map toLower str) $ map toLower x = x:acc
            | otherwise = acc

isBijection :: Ord a => [a] -> [a] -> Bool
isBijection s1 s2 = sort s1 == sort s2
