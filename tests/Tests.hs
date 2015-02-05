module Main where

import Carter
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Verify that carter outputs the correct data" $ do
        it "equals zero" $ do
            theSum <- getAtBatsSum "/Users/michaelruggiero/Desktop/batting.csv"
            theSum `shouldBe` 4858210
