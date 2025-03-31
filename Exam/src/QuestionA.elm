module QuestionA exposing (..)


elemAt : List a -> Int -> Maybe a
elemAt list index =
    case list of
        [] ->
            Nothing

        e :: rest ->
            if index == 0 then
                Just e

            else
                elemAt rest (index - 1)
