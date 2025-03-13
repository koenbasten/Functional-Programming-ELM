module Pythagoras exposing (..)


sqr : Int -> Int
sqr x =
    x * x


isTriple : Int -> Int -> Int -> Bool
isTriple a b c =
    not (a <= 0 || b <= 0 || c <= 0) && sqr a + sqr b == sqr c


leg1 : Int -> Int -> Int
leg1 x y =
    sqr x - sqr y


leg2 : Int -> Int -> Int
leg2 x y =
    2 * x * y


hyp : Int -> Int -> Int
hyp x y =
    sqr x + sqr y


pythTriple : ( Int, Int ) -> ( Int, Int, Int )
pythTriple ( x, y ) =
    if x > y && x > 0 && y > 0 then
        ( leg1 x y, leg2 x y, hyp x y )

    else
        ( 0, 0, 0 )


isTripleTuple : ( Int, Int, Int ) -> Bool
isTripleTuple ( a, b, c ) =
    isTriple a b c


pythTriplesMap : List ( Int, Int ) -> List ( Int, Int, Int )
pythTriplesMap list =
    List.map pythTriple list


pythTriplesRec : List ( Int, Int ) -> List ( Int, Int, Int )
pythTriplesRec list =
    case list of
        [] ->
            []

        e :: rest ->
            pythTriple e :: pythTriplesRec rest


arePythTriplesFilter : List ( Int, Int, Int ) -> List ( Int, Int, Int )
arePythTriplesFilter list =
    List.filter isTripleTuple list


arePythTriplesRec : List ( Int, Int, Int ) -> List ( Int, Int, Int )
arePythTriplesRec list =
    case list of
        [] ->
            []

        e :: rest ->
            if isTripleTuple e then
                e :: arePythTriplesRec rest

            else
                arePythTriplesRec rest
