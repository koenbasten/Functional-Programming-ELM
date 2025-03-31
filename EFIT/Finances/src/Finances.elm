module Finances exposing (..)


minimumGainA : List Float -> Maybe Float
minimumGainA list =
    let
        isPositive e =
            e > 0

        minimum =
            List.minimum (List.filter isPositive list)
    in
    minimum


minimumGainB : List Float -> Maybe Float
minimumGainB list =
    let
        positiveList =
            removeNegative list
    in
    case positiveList of
        [] ->
            Nothing

        e :: rest ->
            case minimumGainB rest of
                Nothing ->
                    Just e

                Just num ->
                    if num > e then
                        Just e

                    else
                        Just num


removeNegative : List Float -> List Float
removeNegative list =
    case list of
        [] ->
            []

        e :: rest ->
            if e > 0 then
                e :: removeNegative rest

            else
                removeNegative rest
