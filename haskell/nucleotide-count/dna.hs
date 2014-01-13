module DNA (
  count,
  nucleotideCounts
) where


import Data.Map.Strict (Map, fromList, member, adjust)
import Data.List (foldl')


count :: Char -> String -> Int
count c
  | c `elem` allNucleotides = foldl' (\acc x -> if x == c then acc + 1 else acc) 0
  | otherwise = error $ "invalid nucleotide " ++ show c

nucleotideCounts :: String -> Map Char Int
nucleotideCounts = foldl' updateMap initMap
  where initMap = fromList $ zip nucleotidesInDNA $ repeat 0
        updateMap = flip $ adjust (1+)

allNucleotides :: String
allNucleotides = "ACGTU"

nucleotidesInDNA :: String
nucleotidesInDNA = "ACGT"
