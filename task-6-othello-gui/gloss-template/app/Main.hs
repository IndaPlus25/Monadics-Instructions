module Main (main) where

import Data.Word
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Othello qualified as O

-- Constants
tileColor :: Color
tileColor = makeColorI 11 102 35 255

blackColor :: Color
blackColor = makeColorI 10 10 10 255

whiteColor :: Color
whiteColor = makeColorI 240 240 240 255

possibleMove :: Color
possibleMove = makeColorI 255 255 0 100

lineColor :: Color
lineColor = greyN 0.5

gridSize :: Float
gridSize = 8

tileSize :: Float
tileSize = 90

pieceRadius :: Float
pieceRadius = 35

boardSize :: Int
boardSize = floor $ gridSize * tileSize

-- Draws the whole board
drawBoard :: Picture
drawBoard =
  let board = Color tileColor $ rectangleSolid (fromIntegral boardSize) (fromIntegral boardSize)

      halfBoard = fromIntegral boardSize / 2
      -- You have to use rectangles if you want thicker lines
      vGrid = Pictures [line [(tile * tileSize - halfBoard, -halfBoard), (tile * tileSize - halfBoard, halfBoard)] | tile <- [0 .. gridSize]]
      hGrid = Pictures [line [(-halfBoard, tile * tileSize - halfBoard), (halfBoard, tile * tileSize - halfBoard)] | tile <- [0 .. gridSize]]
      grid = Color (greyN 0.5) $ Pictures [vGrid, hGrid]
   in Pictures [board, grid]

-- Draws one piece
drawPiece :: (Float, Float) -> Color -> Word64 -> Picture
drawPiece (file, rank) c bb =
  let x = file * tileSize - fromIntegral boardSize / 2 + tileSize / 2
      y = rank * tileSize - fromIntegral boardSize / 2 + tileSize / 2
   in Translate x y $ Color c $ circleSolid pieceRadius

-- Runs as soon as possible to keep a good framerate
drawWorld :: O.Game -> Picture
drawWorld w =
  -- Implement this map so it's correct
  -- then update the following logic so it works with your implementation
  let coords = map id [(f, r) | f <- [0 .. gridSize - 1], r <- [0 .. gridSize - 1]]

      -- You could also import some stuff for tile + color logic
      whitePieces = Pictures $ map (\(f, r) -> drawPiece (f, r) whiteColor (O.white w)) coords
      blackPieces = Pictures $ map (\(f, r) -> drawPiece (f, r) blackColor (O.black w)) coords
   in Pictures [drawBoard, whitePieces, blackPieces]

-- Runs every time an event is triggered
eventHandler :: Event -> O.Game -> O.Game
eventHandler (EventKey (MouseButton button) Down _ (x, y)) world
  | button == LeftButton = world -- Add logic for this event
  | button == RightButton = world
  -- maybe add some more!
  | otherwise = world
eventHandler _ world = world

-- Runs every frame
updateWorld :: Float -> O.Game -> O.Game
updateWorld timeDelta w = w

-- Exit the game with "esc"
main :: IO ()
main = do
  let initialWorld = O.new
   in play
        (InWindow "Othello" (boardSize, boardSize) (0, 0))
        black
        60
        initialWorld
        drawWorld
        eventHandler
        updateWorld
