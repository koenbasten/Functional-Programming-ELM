module MergeSort exposing (..)


unsortedArr =
    [ 3, 7, 6, -10, 15, 23, 55, -13 ]


msort : List Int -> List Int
msort lst =
    case lst of
        [] ->
            []

        [ x ] ->
            [ x ]

        _ ->
            let
                mid =
                    List.length lst // 2

                leftHalf =
                    List.take mid lst

                rightHalf =
                    List.drop mid lst
            in
            merge (msort leftHalf) (msort rightHalf)


merge : List Int -> List Int -> List Int
merge left right =
    case ( left, right ) of
        ( [], r ) ->
            r

        ( l, [] ) ->
            l

        ( x :: xs, y :: ys ) ->
            if x < y then
                x :: merge xs (y :: ys)

            else
                y :: merge (x :: xs) ys
