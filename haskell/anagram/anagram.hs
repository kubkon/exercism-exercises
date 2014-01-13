module Anagram (
  anagramsFor,
  ) where


import Data.Char (toLower)
import Data.Function (on)
import Data.List (sort)


anagramsFor :: String -> [String] -> [String]
anagramsFor str = filter reduce
  where toLowerCase = map toLower
        str' = toLowerCase str
        reduce x = str' /= x' && isBijection str' x'
          where x' = toLowerCase x

isBijection :: Ord a => [a] -> [a] -> Bool
isBijection = (==) `on` sort
