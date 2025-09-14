import Data.List(sort) 
-- Imports sort function 

main :: IO ()
-- Shows that main is an input-output action

main = do
-- Do block

    nString <- getLine
    -- binding standard input to nString
    let n = read nString
    -- conversion from string to int
    numbers_string <- getLine
    -- string containing space-separated numbers
    
    let numbers = map read (words numbers_string) :: [Int]
    -- splitting string into list and converts to int
    
    let k = if even n then n `div` 2 else (n+1) `div` 2
    -- summation calculation
    
    let sorted_descending_numbers = reverse (sort numbers)
    
    let result = sum (take k sorted_descending_numbers)
    
    print result