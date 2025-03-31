module QuestionC exposing (..)


sales =
    [ ( "Anna", 80.4 )
    , ( "Paul", 63.3 )
    , ( "Mary", 70.5 )
    , ( "Paul", 63.7 )
    , ( "Anna", 76.9 )
    , ( "Anna", 90.2 )
    ]


report : List ( String, Float ) -> String -> Maybe ( String, Float, Float )
report list name =
    let
        filteredList =
            List.filter (\( n, _ ) -> n == name) list
    in
    case filteredList of
        [] ->
            Nothing

        _ ->
            Just ( name, sum filteredList, avg filteredList )



-- sum : List ( String, Float ) -> Float
-- sum list =
--     case list of
--         [] ->
--             0
--         ( name, amount ) :: rest ->
--             roundOneDec (amount + sum rest)


sum : List ( String, Float ) -> Float
sum list =
    list
        |> List.map Tuple.second
        |> List.foldl (+) 0
        |> roundOneDec


avg : List ( String, Float ) -> Float
avg list =
    roundOneDec (sum list / toFloat (List.length list))


roundOneDec : Float -> Float
roundOneDec number =
    toFloat (round (number * 10)) / 10


equalsToString : String -> ( String, Float ) -> Bool
equalsToString name ( possibleName, amount ) =
    name == possibleName
