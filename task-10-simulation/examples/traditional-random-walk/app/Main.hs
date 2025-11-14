module Main where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game hiding (Down, Up)
import System.Random
import Prelude hiding (Left, Right)

data Direction = Up | Down | Left | Right deriving (Eq, Enum)

data Walker = Walker
  { current :: Point,
    pixels :: ByteString,
    screen :: (Int, Int),
    generator :: StdGen
  }

-- Runs every step we defined in the main function
updateWalker :: Float -> Walker -> Walker
updateWalker _ walker =
  let (x, y) = current walker
      gen = generator walker
      pixelBS = pixels walker

      (newDirection, newGen) = randomR (0, 3) gen
      (dx, dy) = case toEnum newDirection of
        Up -> (x, y + 1)
        Down -> (x, y - 1)
        Left -> (x - 1, y)
        Right -> (x + 1, y)

      (halfW, halfH) = (screenWidth `div` 2, screenHeight `div` 2)

      wrappedX
        | round dx > halfW = round dx - screenWidth
        | round dx < -halfW = round dx + screenWidth
        | otherwise = round dx
      wrappedY
        | round dy > halfH = round dy - screenHeight
        | round dy < -halfH = round dy + screenHeight
        | otherwise = round dy

      -- Convert pixel position (0, 0 is center) to index of TopToBottom ByteString (0 is top left)
      (screenWidth, screenHeight) = screen walker
      x' = wrappedX + halfW
      y' = halfH - wrappedY
      i = (y' * screenWidth + x') * 4

      -- (cont. from drawSim) Instead we take the performance "hit" here with the split
      updatedPixels =
        if i >= 0 && i < BS.length pixelBS - 4 
          then
            let (start, rest) = BS.splitAt i pixelBS
                newPixel = BS.pack [0, 0, 0, 255]
                end = BS.drop 4 rest
             in start <> newPixel <> end -- and the concatenation. But this is faster than concatenating a picture every frame, e.g., Pictures [oldTrail, newPixel]
          else
            pixelBS
   in Walker
        { current = (dx, dy),
          pixels = updatedPixels,
          screen = screen walker,
          generator = newGen
        }

eventHandler :: Event -> Walker -> Walker
eventHandler event walker = case event of
  EventResize (newWidth, newHeight) ->
    -- Resets on window size change
    -- Though it doesn't have to!
    -- The BS needs to be resized together with the window, but the content *could* be moved around so it stays the same throughout
    let newPixels = BS.replicate (newWidth * newHeight * 4) 255
        newScreen = (newWidth, newHeight)
     in Walker
          { current = (0, 0),
            pixels = newPixels,
            screen = newScreen,
            generator = generator walker
          }
  _ -> walker

-- Draws every frame
drawSim :: Walker -> Picture
drawSim walker =
  let (screenWidth, screenHeight) = screen walker
      -- BitMaps are very fast to draw compared to if we draw a Picture per pixel
      picture = bitmapOfByteString screenWidth screenHeight (BitmapFormat TopToBottom PxRGBA) (pixels walker) False
   in Translate 0 0 picture

-- The size of the screen when we start the application, will get an window resize event as soon as it starts to change them though
starterWidth, starterHeight :: Int
starterWidth = 800
starterHeight = 600

main :: IO ()
main = do
  gen <- newStdGen

  let initialPixels = BS.replicate (starterWidth * starterHeight * 4) 255

      initialWalker =
        Walker
          { current = (0, 0),
            pixels = initialPixels,
            screen = (starterWidth, starterHeight),
            generator = gen
          }
   in play -- Play instead of simulate for the window resize event
  -- Unfortunately you lose the ability to move the canvas around
        FullScreen
        white
        1000
        initialWalker
        drawSim
        eventHandler
        updateWalker