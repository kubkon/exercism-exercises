module DNA (
  hammingDistance,
) where

hammingDistance :: String -> String -> Int
hammingDistance s1 s2 = length $ filter id $ zipWith (/=) s1 s2
