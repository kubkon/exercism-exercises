module Bob (
  responseFor,
  ) where


import Data.Char (isSpace, isLetter, isUpper)


responseFor :: String -> String
responseFor statement
  | isSilent statement = "Fine. Be that way!"
  | isShouting statement = "Woah, chill out!"
  | isAsking statement = "Sure."
  | otherwise = "Whatever."

isSilent :: String -> Bool
isSilent = all isSpace

isShouting :: String -> Bool
isShouting str = all ifLetterIsCapital str && any isLetter str
  where ifLetterIsCapital c
          | isLetter c = isUpper c
          | otherwise = True

isAsking :: String -> Bool
isAsking str = last str == '?'
