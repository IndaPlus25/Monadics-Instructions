{- 
 Example solution to Kattis problem Minimum Scalar Product.
 See: https://open.kattis.com/problems/minimumscalar
 Author: Mikael Kemstedt <kemstedt@kth.se>
-}

import Data.List

main :: IO ()
main = do 
  -- Read stdin and parse the first line
  lines <- getLine 
  let numLines = read lines

  mapM_ (\c -> do
    -- Using a linked list makes the length irrelevant, so we skip this line
    _ <- getLine

    -- Take in the two lines with numbers
    vector1 <- getLine
    vector2 <- getLine 

    let sortedVector1 = 
          sort .                  -- Sort the parsed list of ints, ascending order
          map read                -- For every word, parse it implicitly to Int
            $ words vector1       -- Split the string at whitespace 

        -- Same as the previous vector, but sort in descending order
        sortedVector2 = sortBy (flip compare) . map read $ words vector2 

        -- Compute the minimal scalar product
        prod = foldl' (+) 0 $ zipWith (*) sortedVector1 sortedVector2 

    putStrLn $ "Case #" ++ show (c + 1) ++ ": "  ++ show prod

    ) [0..numLines - 1]
