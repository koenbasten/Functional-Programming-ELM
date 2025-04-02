module QuestionC exposing (..)

import Tuple exposing (first, second)


posProduct : List ( Int, Int ) -> List Int
posProduct list =
    case list of
        [] ->
            []

        elem :: rest ->
            let
                product =
                    first elem * second elem
            in
            if product > 0 then
                product :: posProduct rest

            else
                posProduct rest



-- first elem :: posProduct rest
