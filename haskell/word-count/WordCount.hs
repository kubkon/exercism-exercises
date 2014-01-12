module WordCount (
  wordCount,
  ) where


import Data.Char (toLower, isPunctuation, isSymbol)
import Data.Map.Strict (Map, insertWith, empty)
import Data.String.Utils (replace)


wordCount :: String -> Map String Int
wordCount str = foldr (\x acc -> insertWith (+) x 1 acc) empty allWords
  where allWords = words $ sanitize str

sanitize :: String -> String
sanitize = map replace
  where replace c
          | isPunctuation c || isSymbol c = ' '
          | otherwise = toLower c
