module WordCount (
  wordCount,
  ) where


import Data.Char (toLower, isPunctuation, isSymbol)
import qualified Data.Map as DM
import qualified Data.Set as DS
import Data.String.Utils (replace)


wordCount :: String -> DM.Map String Int
wordCount str = DM.fromList $ zip uniqueWords counts
  where allWords = words $ sanitize str
        uniqueWords = DS.toList $ DS.fromList allWords
        counts = map (\f -> f allWords) $ map countElements uniqueWords

sanitize :: String -> String
sanitize = map replace
  where replace c
          | isPunctuation c || isSymbol c = ' '
          | otherwise = toLower c

countElements :: Eq a => a -> [a] -> Int
countElements x = length . filter (\y -> y == x)
