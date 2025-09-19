module Othello
  ( new,
    makeMove,
    getPossibleMoves,
    Game (..),
  )
where

import Data.Bits
import Data.Word

-- You can change this to better represent the states
data GameState = InProgress | GameOver deriving (Eq, Show)

data Color = White | Black deriving (Eq, Show)

-- The files (A-H) are reversed so the bitboard representation makes more sense
data Tile = H1 | G1 | F1 | E1 | D1 | C1 | B1 | A1 | H2 | G2 | F2 | E2 | D2 | C2 | B2 | A2 | H3 | G3 | F3 | E3 | D3 | C3 | B3 | A3 | H4 | G4 | F4 | E4 | D4 | C4 | B4 | A4 | H5 | G5 | F5 | E5 | D5 | C5 | B5 | A5 | H6 | G6 | F6 | E6 | D6 | C6 | B6 | A6 | H7 | G7 | F7 | E7 | D7 | C7 | B7 | A7 | H8 | G8 | F8 | E8 | D8 | C8 | B8 | A8
  deriving (Bounded, Enum, Eq, Show)

data Game = Game
  { state :: GameState,
    black :: Word64,
    white :: Word64
    -- More fields here? Depending on your implementation ofc
  }

-- Converts a tile to a place on a bitboard
tileToBin :: Tile -> Word64
tileToBin t = 1 .<<. fromEnum t

-- Converts a number to the tile it represents
binToTile :: Word64 -> Tile
binToTile = toEnum . countTrailingZeros

-- | Initializes the board, ...
new :: Game
new =
  Game
    { state = InProgress,
      black = tileToBin E4 .|. tileToBin D5,
      white = tileToBin D4 .|. tileToBin E5
    }

makeMove :: Game -> Tile -> Maybe Game
makeMove game tile = Nothing -- TODO

getPossibleMoves :: Game -> Maybe [Tile]
getPossibleMoves game = Nothing -- TODO

instance Show Game where
  -- build board representation string
  show game = "" -- TODO
