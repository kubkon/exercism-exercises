module Phone (
  areaCode,
  number,
  prettyPrint
) where


import Data.Char (isNumber)
import Data.List.Split (splitPlaces)


areaCode :: String -> String
areaCode = take 3 . number

number :: String -> String
number = validate . filter isNumber

validate :: String -> String
validate "" = invalidNumber
validate num
  | check = reverse $ take 10 $ reverse num
  | otherwise = invalidNumber
  where check = isNDigits 10 || (isNDigits 11 && head num == '1')
        isNDigits = (==) $ length num

invalidNumber :: String
invalidNumber = replicate 10 '0'

prettyPrint :: String -> String
prettyPrint = concat
            . zipWith (++) ["(", ") ", "-"]
            . splitPlaces [3, 3, 4]
            . number
