module Question1 exposing (..)


minimumList : List Int -> Maybe Int
minimumList ls =
    case ls of
        [] ->
            Nothing

        elem :: rest ->
            case minimumList rest of
                Nothing ->
                    Just elem

                Just num ->
                    if elem < num then
                        Just elem

                    else
                        minimumList rest
