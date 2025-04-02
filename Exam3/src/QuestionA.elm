module QuestionA exposing (..)


insert : comparable -> List comparable -> List comparable
insert value list =
    case list of
        [] ->
            [ value ]

        elem :: rest ->
            if elem >= value then
                value :: elem :: rest

            else
                elem :: insert value rest
