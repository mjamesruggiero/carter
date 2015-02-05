module Main where

import Carter
import System.Environment

main :: IO ()
main = do
    (file:_) <- getArgs
    summed <- getAtBatsSum file
    putStrLn $ "Total atBats was: " ++ (show summed)
