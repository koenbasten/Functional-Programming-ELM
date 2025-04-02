module Lambda exposing (..)


doubleList : List Int -> List Int
doubleList list =
    List.map (\x -> x * 2) list


add : Int -> Int -> Int
add =
    \x y -> x + y
