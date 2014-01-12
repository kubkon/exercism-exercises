module DNA (
  toRNA,
  ) where

toRNA :: String -> String
toRNA = map transcribe
  where transcribe c
          | c == 'T' = 'U'
          | otherwise = c
