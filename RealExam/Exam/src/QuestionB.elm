module QuestionB exposing (..)


bitsA : List Bool -> String
bitsA list =
    case list of
        [] ->
            ""

        elem :: rest ->
            if elem then
                "1" ++ bitsA rest

            else
                "0" ++ bitsA rest


bitsB : List Bool -> String
bitsB =
    List.foldl accLeft initLeft


accLeft : Bool -> String -> String
accLeft input bits =
    let
        newBit =
            if input then
                "1"

            else
                "0"
    in
    bits ++ newBit


initLeft =
    ""


bitsC : List Bool -> String
bitsC =
    List.foldr accRight initRight


accRight : Bool -> String -> String
accRight input bits =
    let
        newBit =
            if input then
                "1"

            else
                "0"
    in
    newBit ++ bits


initRight =
    ""
