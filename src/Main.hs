module Main where

import System.Environment
import qualified Data.ByteString.Lazy as BL
import qualified Data.Foldable as F
import Data.Csv.Streaming

type BaseballStats = (BL.ByteString, Int, BL.ByteString, Int)

fourth :: (a, b, c, d) -> d
fourth (_, _, _, d) = d

baseballStats :: BL.ByteString -> Records BaseballStats
baseballStats = decode NoHeader

main :: IO ()
main = do
    (file:_) <- getArgs
    csvData <- BL.readFile file
    let summed = F.foldr summer 0 (baseballStats csvData)
    putStrLn $ "Total atBats was: " ++ (show summed)
    where summer = (+) . fourth
