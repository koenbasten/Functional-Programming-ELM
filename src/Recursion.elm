module Recursion exposing (..)

sumSquare : Int -> Int
sumSquare n =
    if (n==0) then
        0
    else
        n * n + sumSquare ( n - 1 )

exponential : Int -> Int
exponential n =
    if n == 0 then
        1
    else
        3 * exponential (n - 1)