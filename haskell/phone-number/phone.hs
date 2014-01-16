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
validate num
  | len == 10 = num
  | len == 11 && head num == '1' = tail num
  | otherwise = replicate 10 '0'
  where len = length num

prettyPrint :: String -> String
prettyPrint = concat
            . zipWith (++) ["(", ") ", "-"]
            . splitPlaces [3, 3, 4]
            . number
