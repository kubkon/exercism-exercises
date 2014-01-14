module WordCount (
  wordCount,
) where


import Data.Char (toLower, isAlphaNum)
import Data.List.Split (wordsBy)
import Data.Map.Strict (Map, fromListWith)


wordCount :: String -> Map String Int
wordCount str = fromListWith (+) $ zip allWords $ repeat 1
  where allWords = wordsBy (not . isAlphaNum) $ map toLower str
