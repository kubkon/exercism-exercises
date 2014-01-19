module School (
  School(..),
  add,
  empty,
  grade,
  sorted
) where

import Data.List (sort)
import qualified Data.Map.Strict as M

type School = M.Map Int [String]

empty :: School
empty = M.empty

add :: Int -> String -> School -> School
add key name = M.insertWith (++) key [name]

sorted :: School -> [(Int, [String])]
sorted = M.toAscList . M.map sort

grade :: Int -> School -> [String]
grade n = sort . M.findWithDefault [] n
