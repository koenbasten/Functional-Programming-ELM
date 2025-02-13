module Pythagoras exposing (..)

sqr: Int -> Int
sqr x = x * x

isTriple: Int -> Int -> Int -> Bool
isTriple a b c = 
    if (a <= 0 || b <= 0 || c <= 0) then False
    else
        if (sqr a + sqr b == sqr c) then
            True
        else
            False

leg1 : Int -> Int -> Int
leg1 x y = sqr x - sqr y

leg2 : Int -> Int -> Int
leg2 x y = 2 * x * y

hyp : Int -> Int -> Int
hyp x y = sqr x + sqr y

pythTriple : (Int, Int) -> (Int, Int, Int)
pythTriple (x, y) = 
    if (x > y && x > 0 && y > 0) then
        (leg1 x y, leg2 x y, hyp x y)
    else
        (0,0,0)

isTripleTuple : (Int, Int, Int) -> Bool
isTripleTuple (a, b, c) = isTriple a b c