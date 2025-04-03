module QuestionA exposing (..)


howManyTimes : a -> List a -> Int
howManyTimes input list =
    case list of
        [] ->
            0

        first :: rest ->
            if first == input then
                1 + howManyTimes input rest

            else
                howManyTimes input rest
