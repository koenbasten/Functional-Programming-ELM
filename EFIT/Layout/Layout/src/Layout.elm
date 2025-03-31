module Layout exposing (..)


layoutA : List Int -> String
layoutA list =
    case list of
        [] ->
            "/"

        e :: rest ->
            "/" ++ String.fromInt e ++ layoutA rest



-- Definition of 'layoutA'...


layoutB : List Int -> String
layoutB =
    List.foldl accLeft initLeft


accLeft : Int -> String -> String
accLeft number string =
    string ++ String.fromInt number ++ "/"


initLeft =
    "/"



-- Definitions of 'accLeft' and 'initLeft'...


layoutC : List Int -> String
layoutC =
    List.foldr accRight initRight


accRight : Int -> String -> String
accRight number string =
    "/" ++ String.fromInt number ++ string



-- Definitions of 'accRight' and 'initRight'...


initRight =
    "/"
