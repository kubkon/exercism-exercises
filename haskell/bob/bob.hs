module Bob (
  responseFor,
  ) where


import qualified Data.Char as DC

responseFor :: String -> String
responseFor statement
  | isSilent statement = "Fine. Be that way!"
  | isAsking statement = "Sure."
  | isShouting statement = "Woah, chill out!"
  | otherwise = "Whatever."

isSilent :: String -> Bool
isSilent = all DC.isSpace

isShouting :: String -> Bool
isShouting = all func
  where func c
          | DC.isLetter c = DC.isUpper c
          | otherwise = True

isAsking :: String -> Bool
isAsking str = last str == '?'
