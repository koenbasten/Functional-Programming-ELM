module QuestionB exposing (..)


indexOf : List a -> a -> Maybe Int
indexOf list input =
    case list of
        [] ->
            Nothing

        e :: rest ->
            if e == input then
                Just 0

            else
                case indexOf rest input of
                    Nothing ->
                        Nothing

                    Just num ->
                        Just (num + 1)
