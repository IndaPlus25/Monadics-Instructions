module Main (main) where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Juicy

data World = World

windowWidth :: Int
windowWidth = 800

windowHeight :: Int
windowHeight = 600

drawWorld :: World -> Picture
drawWorld w =
  let widthEdge = (-1) + windowWidth `div` 2
   in Pictures [Translate (fromIntegral x) 0 $ Color red $ rectangleSolid 1 1 | x <- [(-widthEdge) .. widthEdge]] -- Test drawing

eventHandler :: Event -> World -> World
eventHandler (EventKey (Char key) Down _ _) world
  | key == 'w' = world
  | otherwise = world
eventHandler _ w = w

updateWorld :: Float -> World -> World
updateWorld _ w = w

-- Exit the game with "esc"
main :: IO ()
main = do
  let initialWorld = World
   in play
        (InWindow "Raycaster" (windowWidth, windowHeight) (0, 0))
        black
        60
        initialWorld
        drawWorld
        eventHandler
        updateWorld