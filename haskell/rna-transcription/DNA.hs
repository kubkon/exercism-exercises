module DNA (
  toRNA,
  ) where

toRNA :: String -> String
toRNA = map transcribe
  where transcribe c = if c == 'T'
                        then 'U'
                        else c
