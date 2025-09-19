module Main (main) where

import Othello qualified (new)

main :: IO ()
main = do
  print Othello.new
