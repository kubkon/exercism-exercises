module DNA (
  count,
  nucleotideCounts
) where


import Data.Map.Strict (Map, fromList, mapWithKey)


count :: Char -> String -> Int
count c
  | c `elem` allNucleotides = foldr (\x acc -> if x == c then acc + 1 else acc) 0
  | otherwise = error $ "invalid nucleotide " ++ show c

nucleotideCounts :: String -> Map Char Int
nucleotideCounts str = mapWithKey (\k x -> count k str + x) initMap
  where initMap = fromList $ zip nucleotidesInDNA $ replicate (length nucleotidesInDNA) 0

allNucleotides :: String
allNucleotides = "ACGTU"

nucleotidesInDNA :: String
nucleotidesInDNA = "ACGT"
