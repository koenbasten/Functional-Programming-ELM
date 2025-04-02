module Question2 exposing (..)


removeElement : List number -> number -> List number
removeElement list target =
    case list of
        [] ->
            []

        elem :: rest ->
            if elem == target then
                removeElement rest target

            else
                elem :: removeElement rest target
