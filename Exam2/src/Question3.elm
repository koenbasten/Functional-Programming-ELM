module Question3 exposing (..)


listTest =
    [ 5, 6, 3, 7, 90 ]


selectionSort : List number -> List number
selectionSort list =
    case list of
        [] ->
            []

        elem :: _ ->
            let
                minimumNumber =
                    minimumList list
            in
            minimumNumber :: selectionSort (removeElement list minimumNumber)



-- findIndex : List number -> number -> number
-- findIndex list target =
--     case list of
--         [] ->
--             0
--         elem :: rest ->
--             if elem == target then
--                 0
--             else
--                 1 + findIndex rest target


removeElement : List number -> number -> List number
removeElement list target =
    case list of
        [] ->
            []

        elem :: rest ->
            if elem == target then
                rest

            else
                elem :: removeElement rest target


minimumList : List number -> number
minimumList ls =
    case ls of
        [] ->
            99999

        elem :: rest ->
            if elem < minimumList rest then
                elem

            else
                minimumList rest
