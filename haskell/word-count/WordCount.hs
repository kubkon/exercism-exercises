module WordCount (
  wordCount,
) where


import Data.Char (toLower, isPunctuation, isSymbol)
import Data.Map.Strict (Map, fromListWith)
import Data.String.Utils (replace)


wordCount :: String -> Map String Int
wordCount str = fromListWith (+) $ zip allWords $ repeat 1
  where allWords = words $ sanitize str

sanitize :: String -> String
sanitize = map replace
  where replace c
          | isPunctuation c || isSymbol c = ' '
          | otherwise = toLower c
