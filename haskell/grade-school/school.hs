module School (
  School(..),
  add,
  empty,
  grade,
  sorted
) where

import Data.List (sort)
import qualified Data.Map.Strict as DMS

type School = DMS.Map Int [String]

empty :: School
empty = DMS.empty

add :: Int -> String -> School -> School
add key name = DMS.insertWith (++) key [name]

sorted :: School -> [(Int, [String])]
sorted = DMS.toAscList . DMS.map sort

grade :: Int -> School -> [String]
grade = DMS.findWithDefault []
