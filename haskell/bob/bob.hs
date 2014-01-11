module Bob (
  responseFor,
  ) where

import Text.Regex.Posix ((=~))

responseFor :: String -> String
responseFor statement
  | matchSilence statement = "Fine. Be that way!"
  | matchShouting statement = "Woah, chill out!"
  | matchQuestion statement = "Sure."
  | otherwise = "Whatever."


matchSilence :: String -> Bool
matchSilence str = str =~ "^[ ]+$" || str == ""

matchShouting :: String -> Bool
matchShouting str = justLetters || lettersAndNumbers || specialChars
  where justLetters = str =~ "^[A-Z ]+[!?]*$"
        lettersAndNumbers = str =~ "^([0-9][,]*[ ])+[A-Z]+!$"
        specialChars = str =~ "^[A-Z%\\^\\*@#\\$\\(\\) ]+[0-9!]+$"

matchQuestion :: String -> Bool
matchQuestion str = justLetters || justNumbers || justNonLetters
  where justLetters = str =~ "^[A-Za-z ,]+\\?$"
        justNumbers = str =~ "^[0-9]+\\?$"
        justNonLetters = str =~ "^([^A-Za-z]+[ ])+\\?$"
