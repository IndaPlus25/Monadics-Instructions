import System.IO (getContents')

main :: IO ()
main = do 
  -- Read stdin
  input <- getContents'
  let allLines = lines input

  -- Get the first line
      (h:l) = allLines

  -- loop through all lines and ignore the result
  mapM_ (\l -> do
    print l
    ) allLines

