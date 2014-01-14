module WordCount (
  wordCount,
) where


import Control.Monad (liftM2)
import Data.Char (toLower, isPunctuation, isSymbol, isSpace)
import Data.List.Split (wordsBy)
import Data.Map.Strict (Map, fromListWith)


wordCount :: String -> Map String Int
wordCount str = fromListWith (+) $ zip allWords $ repeat 1
  where allWords = wordsBy isValidSeparator $ map toLower str
        isValidSeparator = isSpace .||. isPunctuation .||. isSymbol
        (.||.) = liftM2 (||)
