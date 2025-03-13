module LetExample exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layer minutes =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            layer * 2
    in
    preparationTimeInMinutes + expectedMinutesInOven - minutes
