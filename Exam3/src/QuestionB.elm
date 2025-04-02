module QuestionB exposing (..)

--insertionSort [3,7,4,9,1] [] == [1,3,4,7,9]


insertionSort : List comparable -> List comparable -> List comparable
insertionSort list tempList =
    case list of
        [] ->
            tempList

        elem :: rest ->
            insertionSort rest (insert elem tempList)


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
