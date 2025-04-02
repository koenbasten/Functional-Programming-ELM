module Currying exposing (..)


add : Int -> Int -> Int
add x y =
    x + y


addFive : Int -> Int
addFive =
    add 5



-- addFive 3 == 8
